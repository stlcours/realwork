unit ObjExWin;

{ $Id: ObjExWin.pas,v 1.84 2016/08/11 10:41:59 lukyanets Exp $ }

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, ImgList,
  OvcBase,
  DragData, DT_Const, DT_Types, daTypes, daInterfaces,
  l3Types, l3Base, l3DatLst, l3Tree, l3Nodes, l3Tree_TLB,
  vtlister, vtOutliner, Menus, AdvMenus,
  ObjExpl,  Buttons, afwControl, afwInputControl, afwControlPrim,
  afwBaseControl;

type
  TExplorerObjType = (eotDocSet, eotSaveDocSet, eotMRUDocument, eotDocument, eotUser, eotMail);
  TExplorerNodeArray = Array[Low(TExplorerObjType)..High(TExplorerObjType)] of Il3Node;

  TObjectExplorerWin = class(TForm, IdaUserStatusChangedSubscriber)
    ObjectExplorer: TvtOutliner;
    pmExtendExplorer: TPopUpMenu;
    piDeleteSaveDocSet: TMenuItem;
    piRemoveLink: TMenuItem;
    piCloseDoc: TMenuItem;
    piSendMsg: TMenuItem;
    piDeleteMessage: TMenuItem;
    piHideExplorer: TMenuItem;
    N1: TMenuItem;
    piInsertDocToObjList: TMenuItem;
    procedure ObjectExplorerActionElement(Sender: TObject; Index: Longint);

    procedure piDeleteClickDispatcher(Sender: TObject);
    procedure piDeleteSaveDocSetClick(Sender: TObject);
    procedure piRemoveLinkClick(Sender: TObject);
    procedure piCloseDocClick(Sender: TObject);
    procedure piSendMsgClick(Sender: TObject);
    procedure piShowMsgClick(Sender: TObject);
    procedure piDeleteMessageClick(Sender: TObject);
    procedure piHideExplorerClick(Sender: TObject);
    procedure piInsertDocToObjListClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function ObjectExplorerGetItemImage(Sender: TObject; Index: Integer;
                                        var aImages : TCustomImageList): Integer;
    procedure ObjectExplorerCurrentChanged(Sender: TObject; aNewCurrent: Integer;
        aOldCurrent: Integer);
    //procedure SpeedButton1Click(Sender: TObject);

   protected
    // IdaUserStatusChangedSubscriber
    procedure UserStatusChanged(UserID: TdaUserID; Active: Boolean);
   private
    DDHLink   : TdaGlobalCoordinateRec;
    fInMailArrivedShowing : Boolean;

    procedure SaveMRU;
    procedure LoadMRU(aList : Tl3StringDataList);
    procedure ShowMailArrived(Sender: TObject; aMailID : LongInt);
//    procedure UserStatusChange(UserId : TdaUserID; Active : Boolean);
    function  GetNodeType(aNode : Il3Node): Byte;
    function  ChildNodeClass(aObjectType : TExplorerObjType) : Tl3NodeClass;
   public
    BaseExplorerNode : TExplorerNodeArray;
    procedure   WMDropAccept(var Message: TMessage); message wm_DropAccept;

    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   LoadStruct;

    procedure   AddToExplorer(aObjectType : TExplorerObjType; aText : AnsiString; aID : Longint; aIconID : integer = -1); overload;
    procedure   AddToExplorer(aObjectType : TExplorerObjType; aText : Tl3PCharLen; aID : Longint; aIconID : integer = -1); overload;

    procedure   DelFromExplorer(ObjectType : TExplorerObjType; ID : Longint);
  end;

implementation
{$R *.DFM}

Uses
     l3Interfaces, l3TreeInterfaces, l3InternalInterfaces,
     l3IniFile, ResShop, IniShop,
     l3LongintList,
     l3IDList,
     l3Except,
     daSchemeConsts,
     daDataProvider,
     dtIntf, DT_Sab,
     DT_Doc, DT_AskList, DT_Mail,
     VConst, ObjList, l3String, l3Date, l3Languages,
     vtDialogs, vtMenus,
     DocIntf,
     ddClientBaseEngine,
     ArchiUserRequestManager,
     Main, SrchWin, CustEditWin, {EditWin,} MailWin, VMailWin;

Type
 PSaveItemData = ^TSaveItemData;
 TSaveItemData = packed record
                  rID     : TDocID;
                  rFamID  : TdaFamilyID;
                  rIconID : integer;
                 end;

 TSaveItemRec = packed record
                 rName : ShortString;
                 rData : TSaveItemData;
                end;

const
 cSaveItemRecFormat = 'SDD2D';  //AnsiString, uint32, uint16, uint32
 cSaveItemRecFormatOLD = 'SDD2';  //AnsiString, uint32, uint16

constructor TObjectExplorerWin.Create(AOwner: TComponent);
 Begin
  Inherited Create(AOwner);
  //LoadStruct;
  ObjectExplorer.Images := ArchiResources.CommonImageList;
  ObjectExplorer.UseStyleTable := True;
 end;

procedure TObjectExplorerWin.LoadStruct;
 var
  //PN      : Pointer;
  DT      : TStDateTimeRec;
  lGrAction : Tl3IteratorAction;
  lCurUsList : Tl3StringDataList;

 function lUserGroupIter(const aName: AnsiString; aIndex: Long): Boolean;
  var
   lCN : Il3Node;
  begin
   Result := True;
   lCN := MakeParamNode(PAnsiChar(aName), aIndex, TUsersListNode);
   ObjectExplorer.CTree.InsertNode(BaseExplorerNode[eotUser], lCN);

   With TUsersListNode((lCN as Il3NodeWrap).GetSelf) do
    begin
     lCurUsList := Tl3StringDataList.CreateSize(SizeOf(TdaUserID));
     lCurUsList.NeedAllocStr := True;
     try
      Items := lCurUsList;
      lCurUsList.Changing;
      try
       GlobalDataProvider.UserManager.GetUserListOnGroup(aIndex, Items, True);
      finally
       lCurUsList.Changed;
      end;
     finally
      l3Free(lCurUsList);
     end;
    end;
  end;

 procedure lCheckExists(aItems : Tl3StringDataList);
 var
  lIDList : Il3IDList;
  I       : Integer;
  lSab    : ISab;
 begin
  if aItems.Count = 0 then Exit;
  lIDList := l3MakeIDList;
  for I := 0 to Pred(aItems.Count) do
   lIDList.Add(PDocID(aItems.Data[I])^);
  lSab := MakeValueSet(DocumentServer(CurrentFamily).FileTbl, docIdFld, lIDList);

  lSab.RecordsByKey;
  lSab.ValuesOfKey(docIdFld);
  if lSab.Count =  aItems.Count then Exit;

  lIDList := dtMakeSortedIDListBySab(lSab);
  for I := Pred(aItems.Count) downto 0 do
   if lIDList.IndexOf(PDocID(aItems.Data[I])^) < 0 then
   aItems.Delete(I);
 end;

 var
  I       : Integer;
 begin
  With ObjectExplorer.CTree do
   Begin
    Changing;
    Try
     BaseExplorerNode[eotDocSet]      := InsertNode(CRootNode, MakeNode('������� ����������',TDocSetsListNode));
     BaseExplorerNode[eotSaveDocSet]  := InsertNode(BaseExplorerNode[eotDocSet], MakeNode('����������� �������',TSavedDocSetsListNode));
     BaseExplorerNode[eotDocument]    := InsertNode(CRootNode, MakeNode('���������',TDocsListNode));
     BaseExplorerNode[eotMRUDocument] := InsertNode(BaseExplorerNode[eotDocument],MakeNode('������� �����',TMRUDocListNode));
     BaseExplorerNode[eotUser]        := InsertNode(CRootNode, MakeNode('������������',TUsersGroupListNode));
     BaseExplorerNode[eotMail]        := InsertNode(CRootNode, MakeNode('���������',TMailListNode));

     {If IniRec.NeedRunTehProc then
      begin
       AsksList.DeleteEqualNameAsks;
       IniRec.NeedRunTehProc := False;
      end;
     }
     With TSavedDocSetsListNode((BaseExplorerNode[eotSaveDocSet] as Il3NodeWrap).GetSelf) do
      begin
       Items := g_dtQueryList;
      end;

     UserConfig.Section:='MRUList';
     With TMRUDocListNode((BaseExplorerNode[eotMRUDocument] as Il3NodeWrap).GetSelf) do
      begin
       Items := Tl3StringDataList.CreateSize(SizeOf(TSaveItemData));
       try
        LoadMRU(Items);
        lCheckExists(Items);
       finally
        Items.Free;
       end;
      end;

     GlobalDataProvider.UserManager.IterateUserGroupsF(L2ArchiUsersIteratorIterateUserGroupsFAction(@lUserGroupIter));
     GlobalDataProvider.UserManager.RegisterUserStatusChangedSubscriber(Self);
//      UserManager.OnUserActiveChange := UserStatusChange;
     g_BaseEngine.SetCurrentActiveUsers;

     With TMailListNode((BaseExplorerNode[eotMail] as Il3NodeWrap).GetSelf) do
      begin
       DT := MailServer.LoadMailList;
       Items := MailServer as Il3HandledStringList;
       MailServer.OnMailArrived := ShowMailArrived;
       {$IFNDEF InsiderTest}
       if (DT.D > 0) and (CompareStDateTime(IniRec.LastExitDateTime, DT) < 0) then
       begin
        if vtMessageDlg(l3CStr('� ��� ���� ����� ������. ��������?'), mtInformation, [mbYes, mbNo]) = mrYes then
        for I := 0 to pred(MailServer.Count) do
         if CompareStDateTime(IniRec.LastExitDateTime, PMailRec(MailServer.ItemSlot(I))^.rDateTime) < 0 then
          With TViewMailWin.Create(Application.MainForm) do
           SetMessage(PMailRec(MailServer.ItemSlot(I))^.rID);
       end;
       {$ENDIF InsiderTest}
      end;
    finally
     Changed;
    end;
   end;
 end;

destructor TObjectExplorerWin.Destroy;
begin
 GlobalDataProvider.UserManager.UnRegisterUserStatusChangedSubscriber(Self);
 SaveMRU;
 inherited Destroy;
end;

procedure TObjectExplorerWin.SaveMRU;
 var
  lIndex : Integer;
  lMRUList : Tl3StringDataList;

 function  GetMRUItem(var ItStr : ShortString) : Boolean;
 var
  lRec : TSaveItemRec;
  //lP   : PAnsiChar;
 begin
  Result := lIndex < lMRUList.Count;
  if Not Result then Exit;
  lRec.rName  := lMRUList.PasStr[lIndex];

  //lP            := Items.Data[lIndex];
  lRec.rData    := PSaveItemData(lMRUList.Data[lIndex])^;

  ItStr      := l3RecToFormatString(lRec, cSaveItemRecFormat);
  Inc(lIndex);
 end;

var
 lIterFunc : TOnGetListItem;
begin
 lMRUList := TMRUDocListNode((BaseExplorerNode[eotMRUDocument] as Il3NodeWrap).GetSelf).Items;
 lIndex := 0;
 UserConfig.Section := 'MRUList';
 lIterFunc := MakeWGLStub(@GetMRUItem);
 try
  UserConfig.WriteParamExtList('MRUItem', lIterFunc);
 finally
  FreeWGLStub(lIterFunc);
 end;
end;


procedure  TObjectExplorerWin.LoadMRU(aList : Tl3StringDataList);

 procedure SetMRUItem(Const ItStr : ShortString);
 var
  Rec : TSaveItemRec;
 begin
  try
   l3FormatStringToRec(ItStr, Rec, cSaveItemRecFormat);
  except
   on E : El3ConvertError do //������ ������
   begin
    l3FormatStringToRec(ItStr, Rec, cSaveItemRecFormatOLD);
    Rec.rData.rIconID := picText;
   end;
  end;
  aList.AddStr(Rec.rName, @Rec.rData);
 end;

var
 lIterFunc : TOnSetListItem;
begin
 UserConfig.Section:='MRUList';
 lIterFunc := MakeRGLStub(@SetMRUItem);
 try
  UserConfig.ReadParamExtList('MRUItem', lIterFunc);
 finally
  FreeRGLStub(lIterFunc);
 end;
end;

function TObjectExplorerWin.ChildNodeClass(aObjectType : TExplorerObjType) : Tl3NodeClass;
begin
 Case aObjectType of
  eotDocSet      : Result := TDocSetNode;
  eotSaveDocSet  : Result := TDocSetNode;
  eotMRUDocument : Result := TDocumentNode;
  eotDocument    : Result := TDocumentNode;
  eotUser        : Result := nil;
  eotMail        : Result := nil;
 end;
end;

procedure TObjectExplorerWin.AddToExplorer(aObjectType : TExplorerObjType; aText : AnsiString; aID : Longint; aIconID : integer = -1);
begin
 AddToExplorer(aObjectType, l3PCharLen(aText), aID, aIconID);
end;

procedure TObjectExplorerWin.AddToExplorer(aObjectType : TExplorerObjType; aText : Tl3PcharLen; aID : Longint; aIconID : integer = -1);
 var
  lNode        : Il3Node;
  lSaveCurNode : Il3Node;
  Cnt          : Longint;
  lRec         : TSaveItemRec;
 begin
  If (csDestroying in ComponentState) then Exit;
  Try
   lNode := BaseExplorerNode[aObjectType].ChildNode;
   If lNode <> Nil then
    Repeat
     If (lNode as Il3HandleNode).Handle = aID then
      begin
       //ObjectExplorer.TreeCursor.ChangeName(PN, Text);
       if aObjectType = eotMRUDocument then
        lNode.Move(dUpMax);
       lNode.Text := aText;
       //ObjectExplorer.InvalidateItem(ObjectExplorer.TreeSource.GetIndex(lNode));
       Exit;
      end;
     If lNode.IsLast then Break;
     lNode := lNode.NextNode;
    until false;
  except
  end;

  lSaveCurNode := ObjectExplorer.CurrentCNode;

  Case aObjectType of
   eotDocSet, eotDocument :
    lNode := ObjectExplorer.CTree.InsertNodeBefore(BaseExplorerNode[aObjectType].ChildNode,
             MakeParamNode(aText.S, aID, ChildNodeClass(aObjectType)));

   //eotDocument    : lNode := ObjectExplorer.TreeSource.InsertNodeBefore(BaseExplorerNode[aObjectType].ChildNode,
   //                   MakeParamNode(aText, aID, ChildNodeClass(aObjectType))) as Il3HandleNode;

   eotSaveDocSet  : TSavedDocSetsListNode((BaseExplorerNode[eotSaveDocSet] as Il3NodeWrap).GetSelf).Items := g_dtQueryList;
   eotMRUDocument :
    With TMRUDocListNode((BaseExplorerNode[eotMRUDocument] as Il3NodeWrap).GetSelf) do
    begin
     lRec.rData.rID := aID;
     lRec.rData.rFamID := 1;
     lRec.rData.rIconID := aIconID;
     Items.Changing;
     Try
      Items.InsertData(0, aText.S, @lRec.rData);
      While Items.Count > 20 do
       Items.Delete(Pred(Items.Count));
     finally
      Items.Changed;
     end;
    end;
  end;

  If lSaveCurNode <> Nil then ObjectExplorer.Current := ObjectExplorer.TreeStruct.GetIndex(lSaveCurNode);
 end;

procedure TObjectExplorerWin.DelFromExplorer(ObjectType : TExplorerObjType; ID : Longint);
 var
  PN, CurPN : Il3Node;
 begin
  If (csDestroying in ComponentState) then Exit;
  With ObjectExplorer, CTree do
   begin
    CurPN := CurrentCNode;
    PN := FindNodeByParam(BaseExplorerNode[ObjectType], ID, imOneLevel);
    If PN = CurPN then CurPN := Nil;
    If PN <> Nil then
     begin
      PN.Delete;
      If CurPN <> Nil then ObjectExplorer.Current := GetIndex(CurPN);
      ObjectExplorer.Invalidate;
     end;
   end;
 end;

procedure TObjectExplorerWin.ObjectExplorerActionElement(Sender: TObject; Index : Longint);
 var
  lNode    : Tl3CustomNode;
 begin
  lNode := (ObjectExplorer.TreeStruct.Nodes[Index] as Il3NodeWrap).GetSelf;
  Case GetNodeType(lNode) of
   enOpenDocSet, enOpenDocID :
    with TForm(lNode.StringID) do
    begin
     PostMessage(MainForm.ClientHandle, WM_MDIActivate, TForm(lNode.StringID).Handle, 0);
     If (WindowState = wsMinimized) then WindowState := wsNormal;
    end;
   enDocID :
    MainForm.RunTextEditor(CurrentFamily, (lNode as Il3HandleNode).Handle);
   enSavedDocSet :
    begin
     If lNode.ParentNode.IsSame(BaseExplorerNode[eotSaveDocSet]) then
     begin
      If Longint(lNode.StringID) > 0 then
       With TSearchWin.Create(Self) do
       begin
        Family := CurrentFamily;
        LoadDocSet(g_dtQueryList.GetSQueryByHandle((lNode as Il3HandleNode).Handle)); {StringID??}
       end;
     end;
    end;

   enUser, enActUser :
    piSendMsgClick(Self);
   enMail :
    piShowMsgClick(Self);
   else
    with ObjectExplorer do
     ExpandNode(lNode, Not TreeStruct.IsExpanded(lNode));
  end;
 end;

function TObjectExplorerWin.GetNodeType(aNode : Il3Node): Byte;
 begin
  Result := 0;
  If aNode = nil then Exit;
  With aNode as Il3NodeWrap do
   If InheritFrom(TDocSetsListNode)
    then Result := enDirDocSet
    else
     If InheritFrom(TSavedDocSetsListNode)
      then Result := enDirDocSet
      else
       If InheritFrom(TDocsListNode)
        then Result := enDirDoc
        else
         If InheritFrom(TMRUDocListNode)
          then Result := enDirDoc
          else
           If InheritFrom(TUsersGroupListNode)
            then Result := enDirUser
            else
             If InheritFrom(TUsersListNode)
              then Result := enUserGroup
              else
               If InheritFrom(TMailListNode)
                then Result := enDirMail
                else
                 with aNode.ParentNode as Il3NodeWrap do
                  If InheritFrom(TDocSetsListNode)
                   then Result := enOpenDocSet
                   else
                    If InheritFrom(TSavedDocSetsListNode)
                     then Result := enSavedDocSet
                     else
                      If InheritFrom(TDocsListNode)
                       then Result := enOpenDocID
                       else
                        If InheritFrom(TMRUDocListNode)
                         then Result := enDocID
                         else
                          If InheritFrom(TUsersGroupListNode)
                           then Result := enUserGroup
                           else
                            If InheritFrom(TUsersListNode)
                             then Result := enUser
                             else
                              If InheritFrom(TMailListNode)
                               then Result := enMail;
 end;

function TObjectExplorerWin.ObjectExplorerGetItemImage(Sender: TObject;
                       Index: Integer;var aImages : TCustomImageList): Integer;
 var
  lNode    : Tl3CustomNode;
  lIndex     : Integer;

 begin
  Result := -1;
  lNode := (ObjectExplorer.TreeStruct.Nodes[Index] as Il3NodeWrap).GetSelf;
  Case GetNodeType(lNode) of
   enOpenDocID :
    Result := TCustomEditorWindow(lNode.StringID).IconID;
   enDocID     :
   begin
    with PSaveItemData((lNode as Tl3DataListItemNode).Data)^ do
    if rIconID = -1 then
     Result := picText
    else
     Result := rIconID;
   end;

   enActUser   : Result := picActUser;

   enUser      : If (lNode.Flags and $8000) = 0
                  then Result := picUser
                  else Result := picActUser;

   enMail      : begin
                  lIndex := MailServer.IndexByID(lNode.StringID);
                  If lIndex < 0 then Exit;
                  If (PMailRec(MailServer.ItemSlot(lIndex))^.rMType and mlWasRead) = 0
                   then Result := picMessage
                   else Result := picReadMessage;
                 end;

   enDirDocSet : Result := picSrchFile;
   enDirDoc    : Result := picDocFile;
   enDirUser   : Result := picUserFile;
   enDirMail   : Result := picMailFile;
   enUserGroup : Result := picUserGroup;
   enOpenDocSet,
   enSavedDocSet : Result := picDocSet;
  end;
 end;

procedure TObjectExplorerWin.ObjectExplorerCurrentChanged(Sender: TObject;
  aNewCurrent: Integer; aOldCurrent: Integer);

 var
  lNode    : Il3Node;
 begin
  lNode := ObjectExplorer.CTree.CNodes[aNewCurrent];

  piDeleteSaveDocSet.Visible := False;
  vtVisibleAndEnabled(piRemoveLink        , False);
  vtVisibleAndEnabled(piCloseDoc          , False);
  vtVisibleAndEnabled(piSendMsg           , False);
  vtVisibleAndEnabled(piDeleteMessage     , False);
  vtVisibleAndEnabled(N1                  , True);
  vtVisibleAndEnabled(piInsertDocToObjList, False);

  Case GetNodeType(lNode) of
   enOpenDocID:
    begin
     ObjectExplorer.PopupMenu := pmExtendExplorer;
     vtVisibleAndEnabled(piCloseDoc, True);
     If (BaseExplorerNode[eotDocument]).IsSame(lNode.ParentNode)
      then piInsertDocToObjList.Visible := True;
    end;

   enDocID    :
    begin
     ObjectExplorer.PopupMenu := pmExtendExplorer;
     vtVisibleAndEnabled(piRemoveLink, True);
     vtVisibleAndEnabled(piInsertDocToObjList, True);
    end;

   enSavedDocSet :
    begin
     ObjectExplorer.PopupMenu := pmExtendExplorer;
     vtVisibleAndEnabled(piDeleteSaveDocSet, True);
    end;
   enActUser, enUser :
    begin
     ObjectExplorer.PopupMenu := pmExtendExplorer;
     vtVisibleAndEnabled(piSendMsg, True);
    end;
   enMail :
    begin
     ObjectExplorer.PopupMenu := pmExtendExplorer;
     vtVisibleAndEnabled(piDeleteMessage, True);
    end;
   else
    N1.Visible := False;
  end;
 end;

procedure TObjectExplorerWin.piDeleteClickDispatcher(Sender: TObject);
 begin
  If piDeleteSaveDocSet.Visible then
   piDeleteSaveDocSetClick(Sender)
  else
   If piRemoveLink.Visible then
    piRemoveLinkClick(Sender)
   else
    If piDeleteMessage.Visible then
     piDeleteMessageClick(Sender);
 end;

procedure TObjectExplorerWin.piDeleteSaveDocSetClick(Sender: TObject);
 var
  PN : Il3HandleNode;
 begin
  PN := (ObjectExplorer.TreeStruct.Nodes[ObjectExplorer.Current] as Il3HandleNode);
  g_dtQueryList.DelSQuery(PN.Handle);
  //PN.Delete;
  //ObjectExplorer.Invalidate;
 end;

procedure TObjectExplorerWin.piRemoveLinkClick(Sender: TObject);
 begin
  //ObjectExplorer.TreeCursor.DeleteSubTree(ObjectExplorer.GetCurrentNode, True);
  ObjectExplorer.CurrentCNode.Delete;
 end;

procedure TObjectExplorerWin.piCloseDocClick(Sender: TObject);
 begin
  TForm((ObjectExplorer.GetCurrentNode as Il3HandleNode).Handle).Close;
 end;

procedure TObjectExplorerWin.piSendMsgClick(Sender: TObject);
 begin
  With TSendMailWin.Create(Application.MainForm) do
   begin
    //edtTo.Text := GetStrPas(ObjectExplorer.GetCurrentNode.Text);
    ReceiverID := (ObjectExplorer.GetCurrentNode as Il3HandleNode).Handle;
    //Longint(ObjectExplorer.GetCurrentNode.Handle);
   end;
 end;

procedure TObjectExplorerWin.piShowMsgClick(Sender: TObject);
 begin
  With TViewMailWin.Create(Application.MainForm) do
    SetMessage((ObjectExplorer.GetCurrentNode as Il3HandleNode).Handle);
 end;

procedure TObjectExplorerWin.piDeleteMessageClick(Sender: TObject);
 begin
  ObjectExplorer.CurrentCNode.Delete;
 end;

procedure TObjectExplorerWin.piHideExplorerClick(Sender: TObject);
 begin
  MainForm.piHideExplorerClick(Self);
 end;

procedure TObjectExplorerWin.piInsertDocToObjListClick(Sender: TObject);
 var
  ItDataRec  : TdaGlobalCoordinateRec;
  ItDataRecS : TSrchObjAddr absolute ItDataRec;
  lNode      : Il3Node;
 begin
  lNode := ObjectExplorer.TreeStruct.Nodes[ObjectExplorer.Current] as Il3Node;
  Case GetNodeType(lNode) of
   enOpenDocID :
    begin
     if TForm((lNode as Il3HandleNode).Handle) is TCustomEditorWindow then
      begin
       ItDataRec.Family := CurrentFamily;
       ItDataRec.Doc := TCustomEditorWindow((lNode as Il3HandleNode).Handle).DocID;
       ArchiObjectList.AddObjRec(PAnsiChar(l3PCharLen2String(lNode.Text)), ddDoc, @ItDataRec);
      end;
     if TForm((lNode as Il3HandleNode).Handle) is TSearchWin then
     begin
      ItDataRecS := TForm((lNode as Il3HandleNode).Handle);
      ArchiObjectList.AddObjRec(PAnsiChar(l3PCharLen2String(lNode.Text)), ddSrchObj, @ItDataRec);
     end;
    end;

   enDocID :
    begin
     ItDataRec.Family := 1;
     ItDataRec.Doc := Longint((lNode as Il3HandleNode).Handle);
     ArchiObjectList.AddObjRec(PAnsiChar(l3PCharLen2String(lNode.Text)), ddDoc, @ItDataRec);
    end;
  end;
 end;

procedure TObjectExplorerWin.WMDropAccept(var Message: TMessage);
 var
  PN : Il3HandleNode;
  I  : Longint;

 begin
  Message.Result := 0;
  If TControl(Message.lParam) <> ObjectExplorer then Exit;

  If (TDragDataSupport.Instance.DragDataType = Ord(ddHyperLink)) or
     (TDragDataSupport.Instance.DragDataType = Ord(ddMailDocLink))
   then
    begin
     I := ObjectExplorer.MousePointToIndex;
     If I < 0 then Exit;
     PN := ObjectExplorer.GetNode(I) as Il3HandleNode;

     Case GetNodeType(PN as Il3Node) of
      enOpenDocID: begin
                    if TForm(PN.Handle) is TCustomEditorWindow then
                    begin
                     DDHLink.Family := TCustomEditorWindow(PN.Handle).DocFamily;
                     DDHLink.Doc    := TCustomEditorWindow(PN.Handle).DocID;
                     DDHLink.Sub    := 0;
                    end;
                   end;

      enDocID    : begin
                    DDHLink.Family := 1;
                    DDHLink.Doc    := Longint(PN.Handle);
                    DDHLink.Sub    := 0;
                   end;

      else Exit;
     end;

     TDragDataSupport.Instance.AnswerData := @DDHLink;
     Message.Result := 1;
    end;
 end;

procedure TObjectExplorerWin.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  Action := caNone;
  if (HostDockSite is TPanel) then
    MainForm.ShowExplorer(False);
    //ShowDockPanel(HostDockSite as TPanel, False, nil);
 end;
(*
procedure TObjectExplorerWin.UserStatusChange(UserId : TdaUserID; Active : Boolean);
 var
  lCN  : Il3Node;
  lCN2 : Il3Node;
  I    : Integer;
  lChangeIndex : Integer;
  l_ULN: TUsersListNode;

 begin
  lCN := BaseExplorerNode[eotUser].ChildNode;
  Repeat
   l_ULN := TUsersListNode((lCN as Il3NodeWrap).GetSelf);
   With l_ULN do
    For I := 0 to Pred(Items.Count) do
     begin
      lCN2 := Il3Node(l_ULN).GetChildByNumber(I);
      With lCN2, (lCN2 as Il3HandleNode) do
       If Handle = UserID then
        begin
         ObjectExplorer.ChangeNotifyOff;
         try
          If Active
           then Flags := Flags or $8000
           else Flags := Flags and not $8000;
           lChangeIndex := ObjectExplorer.TreeStruct.GetIndex(lCN2);
           If lChangeIndex >= 0 then ObjectExplorer.InvalidateItem(lChangeIndex);
         finally
          ObjectExplorer.ChangeNotifyOn(False);
         end;
        end;
     end;
   lCN := lCN.NextNode;
  until lCN.IsFirst;
 end;
*)
procedure TObjectExplorerWin.ShowMailArrived(Sender: TObject; aMailID : LongInt);

 function lp_NeedShowDialog: Boolean;
 begin
  Result := (IniRec = nil) or IniRec.MailNotifyByModalDialog;
 end;

begin
 If fInMailArrivedShowing then Exit;
 fInMailArrivedShowing := True;
 Try
  //Application.MessageBox('��� ������ ������.','���������',MB_ICONINFORMATION);
  if lp_NeedShowDialog then
  begin
   if vtMessageDlg(l3CStr('��� ������ ������. ������ ��������?'), mtInformation, [mbYes, mbNo]) = mrYes then
    With TViewMailWin.Create(Application.MainForm) do
     SetMessage(aMailID);
  end
  else
   ArchiRequestManager.RequestShowMessage('��� ������ ������.');
 finally
  fInMailArrivedShowing := False;
 end;
end;

procedure TObjectExplorerWin.UserStatusChanged(UserID: TdaUserID;
  Active: Boolean);
var
 lCN  : Il3Node;
 lCN2 : Il3Node;
 I    : Integer;
 lChangeIndex : Integer;
 l_ULN: TUsersListNode;

begin
 lCN := BaseExplorerNode[eotUser].ChildNode;
 Repeat
  l_ULN := TUsersListNode((lCN as Il3NodeWrap).GetSelf);
  With l_ULN do
   For I := 0 to Pred(Items.Count) do
    begin
     lCN2 := Il3Node(l_ULN).GetChildByNumber(I);
     With lCN2, (lCN2 as Il3HandleNode) do
      If Handle = UserID then
       begin
        ObjectExplorer.ChangeNotifyOff;
        try
         If Active
          then Flags := Flags or $8000
          else Flags := Flags and not $8000;
          lChangeIndex := ObjectExplorer.TreeStruct.GetIndex(lCN2);
          If lChangeIndex >= 0 then ObjectExplorer.InvalidateItem(lChangeIndex);
        finally
         ObjectExplorer.ChangeNotifyOn(False);
        end;
       end;
    end;
  lCN := lCN.NextNode;
 until lCN.IsFirst;
end;

end.
