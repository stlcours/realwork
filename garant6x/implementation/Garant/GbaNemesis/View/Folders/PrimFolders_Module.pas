unit PrimFolders_Module;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Folders\PrimFolders_Module.pas"
// ���������: "VCMFormsPack"
// ������� ������: "PrimFolders" MUID: (4A96B68A03B1)
// ��� ����: "TPrimFoldersModule"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , vcmModule
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , FoldersInterfaces
 , FoldersDomainInterfaces
 , l3Interfaces
 , nsTypes
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 , nsLogEvent
;

type
 TnsOpenConsultationEvent = class(TnsLogEvent)
  public
   class procedure Log;
 end;//TnsOpenConsultationEvent

 TPrimFoldersModule = {abstract} class({$If NOT Defined(NoVCM)}
 TvcmModule
 {$IfEnd} // NOT Defined(NoVCM)
 )
  private
   f_InfoTypeList: IvcmItems;
  private
   class function OpenFoldersForSelect(const aContainer: IvcmContainer;
    const aForm: IvcmEntityForm;
    const aFilterInfo: InsFolderFilterInfo;
    const aCaption: Il3CString;
    const aUserData: IUnknown;
    anOpenType: TFoldersInfoType;
    anOp: TListLogicOperation = LLO_NONE): Integer;
  protected
   class procedure OpenFoldersPrim(const aContainer: IvcmContainer);
   class function FindFoldersForm(const aContainer: IvcmContainer): IvcmEntityForm;
   class function Open(const aContainer: IvcmContainer;
    aCanCreate: Boolean): IvcmEntityForm;
   procedure opMyConsultationsTest(const aParams: IvcmTestParamsPrim);
    {* ��� ������������ }
   procedure opMyConsultationsExecute(const aParams: IvcmExecuteParamsPrim);
    {* ��� ������������ }
   procedure opMyInformationTest(const aParams: IvcmTestParamsPrim);
    {* ��� ���������� }
   procedure opMyInformationExecute(const aParams: IvcmExecuteParamsPrim);
    {* ��� ���������� }
   procedure opOpenFrmActExecute(const aParams: IvcmExecuteParamsPrim);
    {* ��� ��������� }
   procedure opUnderControlOpenFrmActExecute(const aParams: IvcmExecuteParamsPrim);
    {* ��������� �� �������� }
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure Loaded; override;
   {$If NOT Defined(NoVCM)}
   class procedure GetEntityForms(aList: TvcmClassList); override;
   {$IfEnd} // NOT Defined(NoVCM)
 end;//TPrimFoldersModule
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoVCM)}
 , vcmModuleContractImplementation
 {$IfEnd} // NOT Defined(NoVCM)
 , Base_Operations_F1Services_Contracts
 , eeInterfaces
 , BaseTreeSupportUnit
 , FoldersUnit
 , BaseTypesUnit
 , Search_Strange_Controls
 , PrimFoldersTree_utSaveOpen_UserType
 , DataAdapter
 , Folders_Strange_Controls
 , vtCtrls
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCM)}
 , vcmMessagesSupport
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmItems
 {$IfEnd} // NOT Defined(NoVCM)
 , nsFolders
 , sdsFolders
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , nsFormCoordinates
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 , LoggingUnit
 , SysUtils
 , l3Base
 , Folders_Form
 , fsFolders
 , FoldersInfo_Form
 , FoldersTree_Form
 , FoldersElementInfo_Form
 , Common_FormDefinitions_Controls
 //#UC START# *4A96B68A03B1impl_uses*
 , StdRes
 //#UC END# *4A96B68A03B1impl_uses*
;

{$If NOT Defined(NoVCM)}
type
 TFoldersServiceImpl = {final} class(TvcmModuleContractImplementation, IFoldersService)
  public
   procedure CloseFolders(const aContainer: IvcmContainer);
   procedure SelectOpenWithOperation(const aForm: IvcmEntityForm;
    const aFilterInfo: InsFolderFilterInfo;
    const aCaption: TvcmStringID;
    anOp: TListLogicOperation);
   function EditInfoOpen(aIsNewFolder: Boolean;
    const aNode: IeeNode;
    const aCoords: InsFormCoordinates): Integer;
   procedure SelectOpenWithUserData(const aForm: IvcmEntityForm;
    const aFilterInfo: InsFolderFilterInfo;
    const aCaption: TvcmStringID;
    const aUserData: IUnknown);
   procedure LoadOpen(const aForm: IvcmEntityForm;
    const aData: InsFolderFilterInfo);
   procedure TryOpenConsultationAnswer(const aContainer: IvcmContainer);
   procedure RefreshStructure(const aNode: INode;
    aStatus: TNotifyStatus);
   function OpenFolders(const aContainer: IvcmContainer;
    aCanCreate: Boolean): IvcmEntityForm;
   function SaveOpen(const aForm: IvcmEntityForm;
    const aFilterInfo: InsFolderFilterInfo;
    anElementType: TFoldersElementType;
    const anEntity: IEntityBase;
    aSaveAs: Boolean): Integer;
   procedure SelectOpen(const aForm: IvcmEntityForm;
    const aFilterInfo: InsFolderFilterInfo;
    const aCaption: TvcmStringID);
   class function Instance: TFoldersServiceImpl;
    {* ����� ��������� ���������� ���������� TFoldersServiceImpl }
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
 end;//TFoldersServiceImpl

var g_TFoldersServiceImpl: TFoldersServiceImpl = nil;
 {* ��������� ���������� TFoldersServiceImpl }

procedure TFoldersServiceImplFree;
 {* ����� ������������ ���������� ���������� TFoldersServiceImpl }
begin
 l3Free(g_TFoldersServiceImpl);
end;//TFoldersServiceImplFree

class procedure TnsOpenConsultationEvent.Log;
//#UC START# *4B14D5A203B1_4B14D5890031_var*
//#UC END# *4B14D5A203B1_4B14D5890031_var*
begin
//#UC START# *4B14D5A203B1_4B14D5890031_impl*
 GetLogger.AddEvent(LE_OPEN_CONSULTATION, MakeParamsList);
//#UC END# *4B14D5A203B1_4B14D5890031_impl*
end;//TnsOpenConsultationEvent.Log

procedure TFoldersServiceImpl.CloseFolders(const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4ABCE27102AD_4A96B68A03B1_var*
var
 l_Form: IvcmEntityForm;
//#UC END# *4ABCE27102AD_4A96B68A03B1_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABCE27102AD_4A96B68A03B1_impl*
 Assert(aContainer <> nil);
 aContainer.HasForm(fm_cfFolders.rFormID, vcm_ztNavigator, true, @l_Form);
 if (l_Form <> nil) then
  l_Form.SafeClose;
//#UC END# *4ABCE27102AD_4A96B68A03B1_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TFoldersServiceImpl.CloseFolders

procedure TFoldersServiceImpl.SelectOpenWithOperation(const aForm: IvcmEntityForm;
 const aFilterInfo: InsFolderFilterInfo;
 const aCaption: TvcmStringID;
 anOp: TListLogicOperation);
var
 __WasEnter : Boolean;
//#UC START# *4AC0BA2301AC_4A96B68A03B1_var*
//#UC END# *4AC0BA2301AC_4A96B68A03B1_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC0BA2301AC_4A96B68A03B1_impl*
  TPrimFoldersModule.OpenFoldersForSelect(CheckContainer(nil),
                      aForm,
                      aFilterInfo,
                      vcmCStr(aCaption),
                      nsCStr('����� ����������� �� ���������'),
                      fiSelect,
                      anOp);
//#UC END# *4AC0BA2301AC_4A96B68A03B1_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TFoldersServiceImpl.SelectOpenWithOperation

function TFoldersServiceImpl.EditInfoOpen(aIsNewFolder: Boolean;
 const aNode: IeeNode;
 const aCoords: InsFormCoordinates): Integer;
var
 __WasEnter : Boolean;
//#UC START# *4AC0AB11030C_4A96B68A03B1_var*
var
 l_Container : IvcmEntityForm;
 l_Form : IvcmEntityForm;
//#UC END# *4AC0AB11030C_4A96B68A03B1_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC0AB11030C_4A96B68A03B1_impl*
 vcmDispatcher.FormDispatcher.Lock;
 try
  l_Container := TcfFoldersInfo.Make(vcmCheckAggregate(vcmMakeParams(nil, nil, Application)));
//  TenFoldersElementInfo.Make(vcmParams(l_Container.Aggregate, l_Container.AsContainer));
  l_Form := TenFoldersElementInfo.Make(vcmMakeParams(l_Container.Aggregate, l_Container.AsContainer));

  if aIsNewFolder then
   Op_FolderElement_SetState.Call(l_Container.Aggregate, fiNewFolder)
  else
   Op_FolderElement_SetState.Call(l_Container.Aggregate, fiEdit);
  Op_FolderElement_SetContent.Call(l_Form, aNode, aIsNewFolder);
  AdjustCtrl(l_Container.VCLWinControl, aCoords.Rect);
 finally
  vcmDispatcher.FormDispatcher.UnLock;
 end;//try..finally
 Result := l_Container.ShowModal;
//#UC END# *4AC0AB11030C_4A96B68A03B1_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TFoldersServiceImpl.EditInfoOpen

procedure TFoldersServiceImpl.SelectOpenWithUserData(const aForm: IvcmEntityForm;
 const aFilterInfo: InsFolderFilterInfo;
 const aCaption: TvcmStringID;
 const aUserData: IUnknown);
var
 __WasEnter : Boolean;
//#UC START# *4AC0BAEB012F_4A96B68A03B1_var*
//#UC END# *4AC0BAEB012F_4A96B68A03B1_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC0BAEB012F_4A96B68A03B1_impl*
  TPrimFoldersModule.OpenFoldersForSelect(CheckContainer(nil),
                      aForm,
                      aFilterInfo,
                      vcmCStr(aCaption),
                      aUserData,
                      fiSelect);
//#UC END# *4AC0BAEB012F_4A96B68A03B1_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TFoldersServiceImpl.SelectOpenWithUserData

procedure TFoldersServiceImpl.LoadOpen(const aForm: IvcmEntityForm;
 const aData: InsFolderFilterInfo);
var
 __WasEnter : Boolean;
//#UC START# *4AC0B7BA003B_4A96B68A03B1_var*
//#UC END# *4AC0B7BA003B_4A96B68A03B1_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC0B7BA003B_4A96B68A03B1_impl*
  TPrimFoldersModule.OpenFoldersForSelect(CheckContainer(nil),
                      aForm,
                      aData,
                      nil,
                      nil,
                      fiLoad);
//#UC END# *4AC0B7BA003B_4A96B68A03B1_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TFoldersServiceImpl.LoadOpen

procedure TFoldersServiceImpl.TryOpenConsultationAnswer(const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4ABCE3C2032A_4A96B68A03B1_var*
var
 l_Container: IvcmEntityForm;
//#UC END# *4ABCE3C2032A_4A96B68A03B1_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABCE3C2032A_4A96B68A03B1_impl*
 if not defDataAdapter.AdministratorLogin then
 begin
  l_Container := TPrimFoldersModule.Open(CheckContainer(aContainer), true);
  op_Folders_TryOpenConsultationAnswer.Call(l_Container.Aggregate);
 end;//not defDataAdapter.AdministratorLogin
//#UC END# *4ABCE3C2032A_4A96B68A03B1_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TFoldersServiceImpl.TryOpenConsultationAnswer

procedure TFoldersServiceImpl.RefreshStructure(const aNode: INode;
 aStatus: TNotifyStatus);
var
 __WasEnter : Boolean;
//#UC START# *4AC09777035C_4A96B68A03B1_var*
//#UC END# *4AC09777035C_4A96B68A03B1_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC09777035C_4A96B68A03B1_impl*
 if FoldersReaded then
 begin
  case aStatus of
   NS_NODE    : (UserFoldersTree.Tree as InsReloadedTree).ReloadChildren(aNode);
   NS_CONTENT : UserFoldersTree.Refresh(aNode);
  end;//case aStatus
 end;//FoldersReaded
//#UC END# *4AC09777035C_4A96B68A03B1_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TFoldersServiceImpl.RefreshStructure

function TFoldersServiceImpl.OpenFolders(const aContainer: IvcmContainer;
 aCanCreate: Boolean): IvcmEntityForm;
var
 __WasEnter : Boolean;
//#UC START# *4ABCDBC0002F_4A96B68A03B1_var*
//#UC END# *4ABCDBC0002F_4A96B68A03B1_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4ABCDBC0002F_4A96B68A03B1_impl*
 if not defDataAdapter.AdministratorLogin then
  Result := TPrimFoldersModule.Open(aContainer, aCanCreate)
 else
  Result := nil; 
//#UC END# *4ABCDBC0002F_4A96B68A03B1_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TFoldersServiceImpl.OpenFolders

function TFoldersServiceImpl.SaveOpen(const aForm: IvcmEntityForm;
 const aFilterInfo: InsFolderFilterInfo;
 anElementType: TFoldersElementType;
 const anEntity: IEntityBase;
 aSaveAs: Boolean): Integer;
var
 __WasEnter : Boolean;
//#UC START# *4AC0CBE300FC_4A96B68A03B1_var*
var
 l_Params : IvcmMakeParams;
 l_Folders : IsdsFolders;
 l_Container : IvcmEntityForm; 
 l_Form : IvcmEntityForm; 
//#UC END# *4AC0CBE300FC_4A96B68A03B1_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC0CBE300FC_4A96B68A03B1_impl*
 if not defDataAdapter.AdministratorLogin then
 begin
  vcmDispatcher.FormDispatcher.Lock;
  try
   l_Params := vcmCheckAggregate(vcmMakeParams(nil, CheckContainer(nil)));
   l_Folders := TsdsFolders.Make;
   aFilterInfo.ShowFolders := sfMyDocuments;
   Assert(l_Folders <> nil);
   l_Container := TcfFolders.Make(l_Params,
                                  vcm_ztManualModal,
                                  0,
                                  nil,
                                  l_Folders.dsFolders);
   l_Form := TenFoldersTree.Make(vcmMakeParams(l_Params.Aggregate,
                                           l_Container.AsContainer),
                                 vcm_ztAny,
                                 Ord(utSaveOpen),
                                 nil,
                                 l_Folders.dsFoldersTree);
   TenFoldersElementInfo.Make(vcmMakeParams(l_Params.Aggregate,
                                        l_Container.AsContainer),
                              vcm_ztAny,
                              0,
                              nil,
                              l_Folders.dsFolderElement);
  finally
   vcmDispatcher.FormDispatcher.UnLock;
  end;//try..finally
  op_Folders_SetInfoContent.Call(l_Form);
  op_FolderElement_DisableSecurityPage.Call(l_Container.Aggregate);
  Op_FolderElement_SetSaveInfo.Call(l_Container.Aggregate, aForm, aFilterInfo, anElementType, anEntity, aSaveAs);
  Op_FolderElement_SetState.Call(l_Container.Aggregate, fiSave);
  Op_AdditionInfo_Show.Call(l_Container.Aggregate);
  Op_AdditionInfo_SetCaption.Call(l_Container.Aggregate,vcmCStr(str_SaveAsCaption));
  Result := l_Container.ShowModal;
  l_Container := nil;
 end//not defDataAdapter.AdministratorLogin
 else
 begin
  vcmSay(war_SystemLogin);
  Result := mrCancel; 
 end;//not defDataAdapter.AdministratorLogin
//#UC END# *4AC0CBE300FC_4A96B68A03B1_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TFoldersServiceImpl.SaveOpen

procedure TFoldersServiceImpl.SelectOpen(const aForm: IvcmEntityForm;
 const aFilterInfo: InsFolderFilterInfo;
 const aCaption: TvcmStringID);
var
 __WasEnter : Boolean;
//#UC START# *4AC0B94902C7_4A96B68A03B1_var*
//#UC END# *4AC0B94902C7_4A96B68A03B1_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC0B94902C7_4A96B68A03B1_impl*
  TPrimFoldersModule.OpenFoldersForSelect(CheckContainer(nil),
                      aForm,
                      aFilterInfo,
                      vcmCStr(aCaption),
                      nsCStr('����� ����������� �� ���������'),
                      fiSelect);
//#UC END# *4AC0B94902C7_4A96B68A03B1_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TFoldersServiceImpl.SelectOpen

class function TFoldersServiceImpl.Instance: TFoldersServiceImpl;
 {* ����� ��������� ���������� ���������� TFoldersServiceImpl }
begin
 if (g_TFoldersServiceImpl = nil) then
 begin
  l3System.AddExitProc(TFoldersServiceImplFree);
  g_TFoldersServiceImpl := Create;
 end;
 Result := g_TFoldersServiceImpl;
end;//TFoldersServiceImpl.Instance

class function TFoldersServiceImpl.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TFoldersServiceImpl <> nil;
end;//TFoldersServiceImpl.Exists

class procedure TPrimFoldersModule.OpenFoldersPrim(const aContainer: IvcmContainer);
//#UC START# *4AA532E202C1_4A96B68A03B1_var*
//#UC END# *4AA532E202C1_4A96B68A03B1_var*
begin
//#UC START# *4AA532E202C1_4A96B68A03B1_impl*
 Tfs_Folders.Make(TsdsFolders.Make, aContainer);
//#UC END# *4AA532E202C1_4A96B68A03B1_impl*
end;//TPrimFoldersModule.OpenFoldersPrim

class function TPrimFoldersModule.FindFoldersForm(const aContainer: IvcmContainer): IvcmEntityForm;
//#UC START# *4AA534760215_4A96B68A03B1_var*
//#UC END# *4AA534760215_4A96B68A03B1_var*
begin
//#UC START# *4AA534760215_4A96B68A03B1_impl*
 Result := nil;
 if (aContainer <> nil) then
    aContainer.HasForm(fm_cfFolders.rFormID, vcm_ztNavigator, true, @Result);
//#UC END# *4AA534760215_4A96B68A03B1_impl*
end;//TPrimFoldersModule.FindFoldersForm

class function TPrimFoldersModule.Open(const aContainer: IvcmContainer;
 aCanCreate: Boolean): IvcmEntityForm;
//#UC START# *4ABCDB5D034C_4A96B68A03B1_var*
//#UC END# *4ABCDB5D034C_4A96B68A03B1_var*
begin
//#UC START# *4ABCDB5D034C_4A96B68A03B1_impl*
 Result := FindFoldersForm(CheckContainer(aContainer));
 if not Assigned(Result) and aCanCreate then
 begin
  OpenFoldersPrim(CheckContainer(aContainer));
  Result := FindFoldersForm(CheckContainer(aContainer));
 end;//if not Assigned(Result) then
 if Assigned(Result) and aCanCreate then
  Result.SetActiveAndShowInParent;
//#UC END# *4ABCDB5D034C_4A96B68A03B1_impl*
end;//TPrimFoldersModule.Open

class function TPrimFoldersModule.OpenFoldersForSelect(const aContainer: IvcmContainer;
 const aForm: IvcmEntityForm;
 const aFilterInfo: InsFolderFilterInfo;
 const aCaption: Il3CString;
 const aUserData: IUnknown;
 anOpenType: TFoldersInfoType;
 anOp: TListLogicOperation = LLO_NONE): Integer;
var l_Params: IvcmMakeParams;
var l_Container: IvcmEntityForm;
var l_Folders: IsdsFolders;
//#UC START# *4AC0B80702DE_4A96B68A03B1_var*
//#UC END# *4AC0B80702DE_4A96B68A03B1_var*
begin
//#UC START# *4AC0B80702DE_4A96B68A03B1_impl*
 if not defDataAdapter.AdministratorLogin then
 begin
  vcmDispatcher.FormDispatcher.Lock;
  try
   l_Params := vcmCheckAggregate(vcmMakeParams(nil, aContainer));
   l_Folders := TsdsFolders.Make;
   try
    l_Container := TcfFolders.Make(l_Params,
                                   vcm_ztManualModal,
                                   0,
                                   nil,
                                   l_Folders.dsFolders);
    TenFoldersTree.Make(vcmMakeParams(l_Params.Aggregate,
                                  l_Container.AsContainer,
                                  l_Params.Owner),
                        vcm_ztAny,
                        0,
                        nil,
                        l_Folders.dsFoldersTree);
    TenFoldersElementInfo.Make(vcmMakeParams(l_Params.Aggregate,
                                         l_Container.AsContainer,
                                         l_Params.Owner),
                               vcm_ztAny,
                               0,
                               nil,
                               l_Folders.dsFolderElement);
   finally
    l_Folders := nil;
   end;//try..finally
   op_FolderElement_DisableSecurityPage.Call(l_Params.Aggregate);
   Op_FolderElement_SetLoadInfo.Call(l_Params.Aggregate,
                                     aForm,
                                     aFilterInfo,
                                     aCaption,
                                     aUserData,
                                     anOp);
   Op_FolderElement_SetState.Call(l_Params.Aggregate, anOpenType);
   Op_AdditionInfo_Show.Call(l_Params.Aggregate);
  finally
   vcmDispatcher.FormDispatcher.UnLock;
  end;//try..finally
  Result := l_Container.ShowModal;
 end//not defDataAdapter.AdministratorLogin
 else
 begin
  vcmSay(war_SystemLogin);
  Result := mrCancel;
 end;//not defDataAdapter.AdministratorLogin
//#UC END# *4AC0B80702DE_4A96B68A03B1_impl*
end;//TPrimFoldersModule.OpenFoldersForSelect

procedure TPrimFoldersModule.opMyConsultationsTest(const aParams: IvcmTestParamsPrim);
 {* ��� ������������ }
//#UC START# *4ABCE5070362_4A96B68A03B1test_var*
//#UC END# *4ABCE5070362_4A96B68A03B1test_var*
begin
//#UC START# *4ABCE5070362_4A96B68A03B1test_impl*
 aParams.Op.Flag[vcm_ofVisible] := DefDataAdapter.HasConsultations;
//#UC END# *4ABCE5070362_4A96B68A03B1test_impl*
end;//TPrimFoldersModule.opMyConsultationsTest

procedure TPrimFoldersModule.opMyConsultationsExecute(const aParams: IvcmExecuteParamsPrim);
 {* ��� ������������ }
//#UC START# *4ABCE5070362_4A96B68A03B1exec_var*
var
 l_Container: IvcmEntityForm;
//#UC END# *4ABCE5070362_4A96B68A03B1exec_var*
begin
//#UC START# *4ABCE5070362_4A96B68A03B1exec_impl*
 if not defDataAdapter.AdministratorLogin then
 begin
  l_Container := Open(CheckContainer(nil), true);
  op_Folders_OpenMyConsultations.Call(l_Container.Aggregate);
  TnsOpenConsultationEvent.Log;
 end//if not defDataAdapter.AdministratorLogin then
 else
  vcmSay(war_SystemLogin);
//#UC END# *4ABCE5070362_4A96B68A03B1exec_impl*
end;//TPrimFoldersModule.opMyConsultationsExecute

procedure TPrimFoldersModule.opMyInformationTest(const aParams: IvcmTestParamsPrim);
 {* ��� ���������� }
//#UC START# *4ABCE463038F_4A96B68A03B1test_var*

 function MakeAvailableInformation: IvcmItems;
 begin
  if (f_InfoTypeList = nil) then
  begin
   f_InfoTypeList := TvcmItems.Make;
   with f_InfoTypeList do
   begin
    f_InfoTypeList.AddOp(mod_opcode_FoldersService_OpenFrmAct);
    f_InfoTypeList.AddOp(mod_opcode_FoldersService_UnderControlOpenFrmAct);
    f_InfoTypeList.AddOp(mod_opcode_MonitoringsService_OpenNewsLine);
    f_InfoTypeList.AddOp(mod_opcode_FoldersService_MyConsultations);
    f_InfoTypeList.AddOp(mod_opcode_WorkJournalService_OpenJournal);
    f_InfoTypeList.AddOp(mod_opcode_ChatService_OpenContactList);
   end;
  end;//f_InfoTypeList = nil
  Result := f_InfoTypeList;
 end;

var
 l_List : IvcmItems;
//#UC END# *4ABCE463038F_4A96B68A03B1test_var*
begin
//#UC START# *4ABCE463038F_4A96B68A03B1test_impl*
 l_List := MakeAvailableInformation;
 aParams.Op.SubItems := l_List;
 aParams.Op.Flag[vcm_ofEnabled] := (l_List <> nil) AND (l_List.Count > 0);
//#UC END# *4ABCE463038F_4A96B68A03B1test_impl*
end;//TPrimFoldersModule.opMyInformationTest

procedure TPrimFoldersModule.opMyInformationExecute(const aParams: IvcmExecuteParamsPrim);
 {* ��� ���������� }
//#UC START# *4ABCE463038F_4A96B68A03B1exec_var*
//#UC END# *4ABCE463038F_4A96B68A03B1exec_var*
begin
//#UC START# *4ABCE463038F_4A96B68A03B1exec_impl*
 // - ����� �� ������, �� ������� ������
//#UC END# *4ABCE463038F_4A96B68A03B1exec_impl*
end;//TPrimFoldersModule.opMyInformationExecute

procedure TPrimFoldersModule.opOpenFrmActExecute(const aParams: IvcmExecuteParamsPrim);
 {* ��� ��������� }
//#UC START# *4AC0A2D30078_4A96B68A03B1exec_var*
//#UC END# *4AC0A2D30078_4A96B68A03B1exec_var*
begin
//#UC START# *4AC0A2D30078_4A96B68A03B1exec_impl*
 if not defDataAdapter.AdministratorLogin then
  Open(nil, true)
 else
  vcmSay(war_SystemLogin);
//#UC END# *4AC0A2D30078_4A96B68A03B1exec_impl*
end;//TPrimFoldersModule.opOpenFrmActExecute

procedure TPrimFoldersModule.opUnderControlOpenFrmActExecute(const aParams: IvcmExecuteParamsPrim);
 {* ��������� �� �������� }
//#UC START# *4AC093B801EE_4A96B68A03B1exec_var*
//#UC END# *4AC093B801EE_4A96B68A03B1exec_var*
begin
//#UC START# *4AC093B801EE_4A96B68A03B1exec_impl*
 TUnderControlService.Instance.OpenUnderControl(nil);
//#UC END# *4AC093B801EE_4A96B68A03B1exec_impl*
end;//TPrimFoldersModule.opUnderControlOpenFrmActExecute

procedure TPrimFoldersModule.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_4A96B68A03B1_var*
//#UC END# *479731C50290_4A96B68A03B1_var*
begin
//#UC START# *479731C50290_4A96B68A03B1_impl*
 f_InfoTypeList := nil;
 inherited;
//#UC END# *479731C50290_4A96B68A03B1_impl*
end;//TPrimFoldersModule.Cleanup

procedure TPrimFoldersModule.Loaded;
begin
 inherited;
 PublishOp('opMyConsultations', opMyConsultationsExecute, opMyConsultationsTest);
 PublishOp('opMyInformation', opMyInformationExecute, opMyInformationTest);
 PublishOp('opOpenFrmAct', opOpenFrmActExecute, nil);
 PublishOp('opUnderControlOpenFrmAct', opUnderControlOpenFrmActExecute, nil);
end;//TPrimFoldersModule.Loaded

class procedure TPrimFoldersModule.GetEntityForms(aList: TvcmClassList);
begin
 inherited;
 aList.Add(TcfFolders);
 aList.Add(TcfFoldersInfo);
 aList.Add(TenFoldersTree);
 aList.Add(TenFoldersElementInfo);
end;//TPrimFoldersModule.GetEntityForms

initialization
 TFoldersService.Instance.Alien := TFoldersServiceImpl.Instance;
 {* ����������� TFoldersServiceImpl }
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimFoldersModule);
 {* ����������� PrimFolders }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)
end.
