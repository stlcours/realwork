unit nsDocumentWarningGenerator;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\PrimListAndDocumentControllers\nsDocumentWarningGenerator.pas"
// ���������: "SimpleClass"
// ������� ������: "TnsDocumentWarningGenerator" MUID: (4ED7576E02F7)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , nsTypes
 , DocumentAndListInterfaces
 , DocumentUnit
 , nevBase
 {$If NOT Defined(NoVCM)}
 , vcmUserControls
 {$IfEnd} // NOT Defined(NoVCM)
 , UnderControlInterfaces
;

type
 TnsDocumentWarningGenerator = class
  public
   class function Generate(const aWarning: IdsWarning;
    const aDoc: IDocument;
    const aGen: InevTagGenerator;
    aUserType: TvcmUserType;
    const anUnderControl: IucpUnderControl): TWarningTypeSet;
 end;//TnsDocumentWarningGenerator
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , l3StringIDEx
 , BaloonWarningUserTypes_remListModified_UserType
 , bsUtils
 , Document_Const
 , TextPara_Const
 , k2Tags
 , l3String
 , l3Base
 , DataAdapter
 {$If NOT Defined(NoVCM)}
 , StdRes
 {$IfEnd} // NOT Defined(NoVCM)
 , BaloonWarningUserTypes_WarnTimeMachineException_UserType
 , BaloonWarningUserTypes_WarnTimeMachineWarning_UserType
 , BaloonWarningUserTypes_WarnRedaction_UserType
 , BaloonWarningUserTypes_WarnTimeMachineOn_UserType
 , l3Interfaces
 , l3Core
 , Graphics
 , nsDocumentTools
 , BaseTypesUnit
 , nsConst
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 , BaloonWarningUserTypes_WarnJuror_UserType
 , BaloonWarningUserTypes_WarnPreActive_UserType
 , ControlStatusUtils
 , BaloonWarningUserTypes_WarnInactualDocument_UserType
 , BaloonWarningUserTypes_WarnOnControl_UserType
 , Common_F1CommonServices_Contracts
 //#UC START# *4ED7576E02F7impl_uses*
 //#UC END# *4ED7576E02F7impl_uses*
;

const
 {* ������������ ������ WarningGeneratorStrings }
 str_wgNoActiveRedation: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgNoActiveRedation'; rValue : '��������� �������� ��������� �� �����������');
  {* '��������� �������� ��������� �� �����������' }
 str_wgPreActiveRedation: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgPreActiveRedation'; rValue : '��������� �������� ��������� �� ����� �����������');
  {* '��������� �������� ��������� �� ����� �����������' }
 str_wgBadRedation: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgBadRedation'; rValue : '��������� �������� ��������� �� ��������� �� ������ ������ ������������� � ��� ������ ������� ������');
  {* '��������� �������� ��������� �� ��������� �� ������ ������ ������������� � ��� ������ ������� ������' }
 str_wgNotSureLinkText: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgNotSureLinkText'; rValue : '��. �����������');
  {* '��. �����������' }
 str_wgTimeMachineOffActualRedactionLink: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgTimeMachineOffActualRedactionLink'; rValue : '��������� ������ �������');
  {* '��������� ������ �������' }
 str_wgTimeMachineOffLink: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgTimeMachineOffLink'; rValue : '��������� ������ ������� � ������� � ���������� ��������');
  {* '��������� ������ ������� � ������� � ���������� ��������' }
 str_wgBadRedationLink: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgBadRedationLink'; rValue : '[������������� � ���������� �������� ���������|script:��::��������_���������_����������_��������|����� ��������� ����� ����������� � ���������� ��������]');
  {* '[������������� � ���������� �������� ���������|script:��::��������_���������_����������_��������|����� ��������� ����� ����������� � ���������� ��������]' }
 str_wgTimeMachineChangeDateOrOff: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgTimeMachineChangeDateOrOff'; rValue : '�������� ���� ��� ��������� ������ �������');
  {* '�������� ���� ��� ��������� ������ �������' }
 str_wgOpenInIntranetLink: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgOpenInIntranetLink'; rValue : '%s.' +#13#10 + '[������� ����� ��������� � ��������-������.|script:��::enIntranetSourcePoint_opGoToIntranet]');
  {* '%s.' +#13#10 + '[������� ����� ��������� � ��������-������.|script:��::enIntranetSourcePoint_opGoToIntranet]' }
 str_wgChangingDocuments: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgChangingDocuments'; rValue : '���������� ���������:');
  {* '���������� ���������:' }
 str_wgChangingDocument: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgChangingDocument'; rValue : '���������� ��������:');
  {* '���������� ��������:' }
 str_wgRedactionIsNotActive: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgRedactionIsNotActive'; rValue : '�������� �� ���������');
  {* '�������� �� ���������' }
 str_wgFutureRedaction: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'wgFutureRedaction'; rValue : '������� ��������');
  {* '������� ��������' }

class function TnsDocumentWarningGenerator.Generate(const aWarning: IdsWarning;
 const aDoc: IDocument;
 const aGen: InevTagGenerator;
 aUserType: TvcmUserType;
 const anUnderControl: IucpUnderControl): TWarningTypeSet;
//#UC START# *4ED7594E0218_4ED7576E02F7_var*

 procedure AddBlankPara(const aGen: InevTagGenerator);
 begin
  with aGen do
  begin//AddBlankPara
   // ������ �����
   StartChild(k2_typTextPara);
   Finish;
  end;//with aGen
 end;//AddBlankPara

 procedure AddPara(const aGen    : InevTagGenerator;
                   const aText   : Il3CString;
                   aAnchorNum    : TnsWarningSub = cNoneWarningSub;
                   aLinkHandle   : TnsWarningLinkHandle = cNone_LinkHandle;
                   aLinkStartPos : Integer = 1;
                   aForeColor    : Tl3Color = clWindowText;
                   aFontItalic   : Boolean = False);
 begin//AddPara
  bsEditorAddPara(aGen,
                  l3PCharLen(aText),
                  (aUserType > 0),
                  aAnchorNum,
                  aLinkHandle,
                  aLinkStartPos,
                  l3Len(aText),
                  nil,
                  cNone_LinkHandle,
                  aForeColor,
                  aFontItalic);
 end;//AddPara

 function lp_GetChangingDocumentText(const aChangingDocumentInfo: TRedactionSourceDocumentInfo): Il3CString;
 {* ����� ��� ����������� ��������� - ������ ��� ��������. }
 const
  c_ChangingDocumentLinkTemplate = '[%s|%d.%d.%d]';
 var
  l_ChangingDocumentDisplayName: Il3CString;
  l_ResString: Il3CString;
  l_Topic: TTopic;
 begin
  Result := nil;
  l_ChangingDocumentDisplayName := nsCStr(aChangingDocumentInfo.rDisplayName);
  if (not l3IsNil(l_ChangingDocumentDisplayName)) then
  try
   l_Topic := aChangingDocumentInfo.rDocTopic;
   // ���� ����� ��������� �� ������� - ������ ������
   if (l_Topic.rPid.rObjectId <> 0) then
    l_ResString := l3Fmt(l3CStr(c_ChangingDocumentLinkTemplate),
     [l_ChangingDocumentDisplayName, l_Topic.rPid.rObjectId - 100000,
      l_Topic.rPosition.rPoint, l_Topic.rPid.rClassId])
   else//l_Topic.rPid.rObjectId <> 0
   // ������ ��������� ��� - ������� ������ � �������
    l_ResString := l_ChangingDocumentDisplayname;
   Result := l_ResString;
  finally
   l_ChangingDocumentDisplayName := nil;
   l_ResString := nil;
  end;//try..finally
 end;//lp_GetChangingDocumentText

 function lp_GetChangingDocumentsText(const aRedactionInfo: TRedactionInfo): Il3CString;
 {* ���������� ������ � �������� � ������ ���������� ���������� � �������� �� ���. }
 const
  c_ChangingDocumentNameDelimiter = ', ';
 var
  l_RedactionList: IRedactionInfoList;
  l_RedactionInfo: TRedactionInfo;
  l_ChangingDocumentsList: IRedactionSourceDocumentInfoList;
  l_ChangingDocumentInfo: TRedactionSourceDocumentInfo;
  l_ChangingDocumentsCount: Integer;
  l_Index: Integer;
  l_PrefixString: Il3CString;
  l_ResultString: Il3CString;
  l_ChangingDocumentDisplayName: Il3CString;
  l_Document: IDocument;
 begin
  Result := nil;
  aDoc.GetRedactionsList(l_RedactionList);
  if (l_RedactionList = nil) then
   Exit;
  try
   for l_Index := 0 to l_RedactionList.Count - 1 do
   begin
    l_RedactionList.pm_GetItem(l_Index, l_RedactionInfo);
    if (l_RedactionInfo.rId = aRedactionInfo.rId) then
    begin
     l_ChangingDocumentsList := l_RedactionInfo.rChangingDocuments;
     Break;
    end;//l_RedactionInfo.rId = aRedactionInfo.rId
   end;//for l_Index := 0 to l_RedactionList.Count - 1
  finally
   l_RedactionList := nil;
  end;//try..finally
  if (l_ChangingDocumentsList <> nil) and (l_ChangingDocumentsList.Count > 0) then
  try
   l_ChangingDocumentsCount := l_ChangingDocumentsList.Count;
   if (l_ChangingDocumentsCount = 1) then
   // ���� ���������� ��������
    l_PrefixString := str_wgChangingDocument.AsCStr
   else//l_ChangingDocumentsCount = 1
   // ��������� ���������� ����������
    l_PrefixString := str_wgChangingDocuments.AsCStr;
   for l_Index := 0 to Pred(l_ChangingDocumentsCount) do
   begin
    l_ChangingDocumentsList.pm_GetItem(l_Index, l_ChangingDocumentInfo);
    l_ChangingDocumentDisplayName := lp_GetChangingDocumentText(l_ChangingDocumentInfo);
    try
     if (not l3IsNil(l_ChangingDocumentDisplayName)) then
     begin
      if (l_Index > 0) then
       l_ResultString := l3Cat([l_ResultString, l3CStr(c_ChangingDocumentNameDelimiter)]);
      if (l_ResultString <> nil) then
       l_ResultString := l3Cat([l_ResultString, l_ChangingDocumentDisplayName])
      else//l_ResultString <> nil
       l_ResultString := l_ChangingDocumentDisplayName;
     end;//not l3IsNil
    finally
     l_ChangingDocumentDisplayName := nil;
    end;//try..finally
   end;//for l_Index := 0
   l_ResultString := l3Fmt(l3CStr('%s %s'), [l_PrefixString, l_ResultString]);
   Result := l_ResultString;
  finally
   l_ChangingDocumentsList := nil;
   l_ResultString := nil;
   l_PrefixString := nil;
  end;//try..finally
 end;//lp_GetChangingDocumentsText

 procedure lp_ShowChangingDocuments(const aChangingDocuments: Il3CString);
 {* �������� ������ ���������� ����������. }
 begin
  if not l3IsNil(aChangingDocuments) then
   bsEditorAddWikiPara(aGen, l3PCharLen(aChangingDocuments), (aUserType > 0), not aDoc.HasRelatedDoc);
 end;//lp_ShowChangingDocuments

 procedure lp_ShowRangeOfWork(const aRangeOfWork: Il3CString);
 {* �������� �������� ��������. }
 begin//lp_ShowRangeOfWork
  if not l3IsNil(aRangeOfWork) then
   AddPara(aGen, aRangeOfWork, cEditionWarningSub);
 end;//lp_ShowRangeOfWork

 procedure lp_Redaction(const aDocument : IDocument);
 var
  l_RedactionInfo : TRedactionInfo;
  l_State         : IDocumentState;
  l_EditionWarning   : Il3CString;
  l_EditionIntervals : Il3CString;
  l_ChangingDocuments : Il3CString;
 begin//lp_Redaction
  l3FillChar(l_RedactionInfo, SizeOf(l_RedactionInfo), 0);
  if (aDocument <> nil) then
  begin
   aDocument.GetCurrentState(l_State);
   try
    if not TCommonService.Instance.IsCurEditionActual(l_State) then
    begin
     l_State.GetCurrentRedaction(l_RedactionInfo);
     l_EditionIntervals := bsCreateEditionDateInterval(l_RedactionInfo.rActiveIntervals);
     (*if l3IsNil(l_EditionIntervals) then
     begin*)
      if (l_RedactionInfo.rActualType in [RT_OLD, RT_ACTUAL_ABOLISHED]) then
       l_EditionWarning := str_wgRedactionIsNotActive.AsCStr
      else
      if (l_RedactionInfo.rActualType in [RT_NEW, RT_NEW_ABOLISHED, RT_NEW_PREACTIVE,
       RT_ACTUAL_PREACTIVE]) then
       l_EditionWarning := str_wgFutureRedaction.AsCStr;
      (*if l_RedactionInfo.rActualType = RT_OLD then
       l_EditionWarning := str_wgNoActiveRedation.AsCStr
      else
      if (l_RedactionInfo.rActualType = RT_NEW_ABOLISHED) then
       l_EditionWarning := str_wgPreActiveRedation.AsCStr
      else
       l_EditionWarning := str_wgBadRedation.AsCStr;*)
    (* end//l3IsNil(l_EditionIntervals)
     else
      l_EditionWarning := str_wgBadRedation.AsCStr;*)
     // ������� ����� � "����������" ��������
     AddPara(aGen, l_EditionWarning);
     AddBlankPara(aGen);
     lp_ShowRangeOfWork(l_EditionIntervals);
     l_ChangingDocuments := lp_GetChangingDocumentsText(l_RedactionInfo);
     lp_ShowChangingDocuments(l_ChangingDocuments);
     AddBlankPara(aGen);
     Include(Result, wtNotActualEdition);
     if defDataAdapter.TimeMachine.IsOn then
      Include(Result, wtTimeMachineWarning);
    end;//not IsCurEditionActual(l_State)
   finally
    l_State := nil;
   end;//try..finally
  end;//aDocument <> nil
 end;//lp_Redaction

const
 cTimeMachine = [WarnTimeMachineOn,
                 WarnTimeMachineWarning,
                 WarnTimeMachineException];
var
 l_TMWarning        : Il3CString;
 l_NotSureWarning   : Il3CString;
 l_NotSureComment   : Il3CString;
 l_NotShure         : Boolean;

 procedure lp_Standart(const aDocument : IDocument);
 begin//lp_Standart
  if (aDocument <> nil) then
  begin
   if aDocument.HasWarning then
   begin
    if not (aUserType in cTimeMachine) then
    begin
     // ������� ����� ��������� ��������������
     bsEditorAddWikiPara(aGen, l3PCharLen(nsGetDocumentWarning(aDocument)), (aUserType > 0), not aDoc.HasRelatedDoc);
     //AddPara(aGen, nsGetDocumentWarning(aDocument), cSimpleWarningSub);

     Include(Result, wtUsual);
    end;//not (aUserType in cTimeMachine)
    // �������� ������� ���� � ��������� � ��������� ��������, ������� ���
    // ���� �������� �������� ���������� �������� (CQ: OIT500011244):
    if (aDocument.GetStatus = IS_ABOLISHED) and
      TCommonService.Instance.IsCurEditionActual(aDoc) then
     lp_ShowRangeOfWork(bsCreateEditionDateInterval(bsRedationInfo(aDocument).
      rActiveIntervals));
   end;//aDocument.HasWarning
   defDataAdapter.TimeMachine.GetTimeMachineWarning(aDocument, l_TMWarning);
   l_NotShure := defDataAdapter.TimeMachine.HasNotSureWarning(aDocument);
   if l_NotShure then
    l_NotSureWarning := defDataAdapter.TimeMachine.GetNotSureWarning(aDocument, l_NotSureComment);
  end//aDocument.HasWarning
  else
  begin
   l_TMWarning := nil;
   l_NotShure := False;
  end;//aDocument <> nil
 end;//lp_Standart

 procedure lp_TimeMachine;
 begin//lp_TimeMachine
  if not l3IsNil(l_TMWarning) then
  begin
   if (Result <> cEmptyWarning) then
    // �����-�����������
    AddBlankPara(aGen);
   // ������� ����� �������������� ��� ������ �������
   AddPara(aGen, l_TMWarning, cTimeMachineWarningSub);
   Include(Result, wtTimeMachineWarning);
  end;//not l3IsNil(l_TMWarning)
 end;//lp_TimeMachine


 procedure lp_NotShure;
 const
  cNotSureDelemiter = '. ';
 begin//lp_NotShure
  if l_NotShure then
  begin
   // �������������� �� ��������� ������������� �� ������� �� ��������
   if not l3IsNil(l_NotSureComment) then
   begin
    if (l_NotSureWarning <> nil) then
     AddPara(aGen, l_NotSureWarning, cNotSureWarningSub);
    AddPara(aGen, l_NotSureComment);
   end//not l3IsNil(l_NotSureComment)
   else
    AddPara(aGen,
            l3Cat([l3Cat(l_NotSureWarning, cNotSureDelemiter),
                   str_wgNotSureLinkText.AsCStr]),
            cNotSureWarningSub, cNotSure_LinkHandle,
            l3Len(l_NotSureWarning) + Length(cNotSureDelemiter) + 1);
   Include(Result, wtNotSure);
  end;//l_NotShure
 end;//lp_NotShure

 procedure lp_Links;
 begin//lp_Links
  if (wtTimeMachineWarning in Result) or (wtNotSure in Result) then
  begin
   // ������ ��� ���������� ��
   if TCommonService.Instance.IsCurEditionActual(aDoc) then
    AddPara(aGen,
            str_wgTimeMachineOffActualRedactionLink.AsCStr,
            cNoneWarningSub,
            cTimeMachineOff_LinkHandle)
   else
    AddPara(aGen,
            str_wgTimeMachineOffLink.AsCStr,
            cNoneWarningSub,
            cTimeMachineOff_LinkHandle);
  end//(wtTimeMachineWarning in Result) or (wtNotSure in Result)
  else
  if (wtNotActualEdition in Result) AND
     not aWarning.ForSynchroView then
   // ������ ��� �������� �� ���������� ��������
   bsEditorAddWikiPara(aGen, str_wgBadRedationLink.AsWStr, (aUserType > 0), not aDoc.HasRelatedDoc);
 end;//lp_Links

//#UC END# *4ED7594E0218_4ED7576E02F7_var*
begin
//#UC START# *4ED7594E0218_4ED7576E02F7_impl*
 Assert(aUserType < remListModified);
 Result := cEmptyWarning; // ������� � ���, ��� ������� �������������� ���
 if (aGen <> nil) AND (aDoc <> nil) then
 begin
  aGen.Start;
  try
   aGen.StartChild(k2_typDocument);
   try
    aGen.AddIntegerAtom(k2_tiExternalHandle,
                        aDoc.GetInternalId + c_InternalDocShift);
    aGen.AddIntegerAtom(k2_tiSpaceBefore, 0);
    Case aUserType of
     WarnInactualDocument:
      bsEditorAddWikiPara(aGen,
              l3PCharLen(
               l3Fmt(str_wgOpenInIntranetLink.AsCStr,
                [
                l3Fmt(str_InActualDocumentAction.AsCStr,
                      [
                      BsControlStatusHint(aDoc.GetChangeStatus, true)
                      ]
                     )
                ]
               )
              )
              ,
              (aUserType > 0), not aDoc.HasRelatedDoc);
(*      AddPara(aGen,
              bsFullControlStatusHint(pm_GetDsDocument As IucpUnderControl));*)
     WarnOnControl:
      bsEditorAddWikiPara(aGen,
              l3PCharLen(bsFullControlStatusHint(anUnderControl)),
              (aUserType > 0), not aDoc.HasRelatedDoc);
     WarnTimeMachineOn:
     begin
      AddPara(aGen, vcmFmt(str_TimeMachineTurnOnOnDate,
                           [DefDataAdapter.TimeMachine.DateStr]));
(*      if TCommonService.Instance.IsCurEditionActual(aDoc) then
       bsEditorAddPara(aGen, str_wgTimeMachineOffActualRedactionLink.AsWStr, true,
                       cNoneWarningSub,
                       cNone_LinkHandle,
                       0,
                       0,
                       str_wgTimeMachineOffActualRedactionLink.AsCStr,
                       cNoneWarningSub,
                       cTimeMachineOff_LinkHandle)
      else*)
       bsEditorAddPara(aGen, str_wgTimeMachineChangeDateOrOff.AsWStr, true,
                       cNoneWarningSub,
                       cNone_LinkHandle,
                       0,
                       0,
                       str_wgTimeMachineChangeDateOrOff.AsCStr,
                       cTimeMachineChangeDateOrOff_LinkHandle);
     end;//WarnTimeMachineOn
     else
     begin
      // ������ �������������� (�����������)
      lp_Standart(aDoc);
      // ������ �������������� (������ �������)
      if not (aUserType in [WarnJuror, WarnPreActive]) then
       lp_TimeMachine;
      if not (aUserType in cTimeMachine) then
      // ��������� �������������� (�������������� � ���������)
       lp_Redaction(aDoc);
      // ����� �������������� (�������� �������������)
      lp_NotShure;
      // ������
      lp_Links;
     end;//else
    end;//Case aUserType
   finally
    aGen.Finish;
   end;//try..finally
  finally
   aGen.Finish;
  end;//try..finally
 end;//aGen <> nil
//#UC END# *4ED7594E0218_4ED7576E02F7_impl*
end;//TnsDocumentWarningGenerator.Generate

initialization
 str_wgNoActiveRedation.Init;
 {* ������������� str_wgNoActiveRedation }
 str_wgPreActiveRedation.Init;
 {* ������������� str_wgPreActiveRedation }
 str_wgBadRedation.Init;
 {* ������������� str_wgBadRedation }
 str_wgNotSureLinkText.Init;
 {* ������������� str_wgNotSureLinkText }
 str_wgTimeMachineOffActualRedactionLink.Init;
 {* ������������� str_wgTimeMachineOffActualRedactionLink }
 str_wgTimeMachineOffLink.Init;
 {* ������������� str_wgTimeMachineOffLink }
 str_wgBadRedationLink.Init;
 {* ������������� str_wgBadRedationLink }
 str_wgTimeMachineChangeDateOrOff.Init;
 {* ������������� str_wgTimeMachineChangeDateOrOff }
 str_wgOpenInIntranetLink.Init;
 {* ������������� str_wgOpenInIntranetLink }
 str_wgChangingDocuments.Init;
 {* ������������� str_wgChangingDocuments }
 str_wgChangingDocument.Init;
 {* ������������� str_wgChangingDocument }
 str_wgRedactionIsNotActive.Init;
 {* ������������� str_wgRedactionIsNotActive }
 str_wgFutureRedaction.Init;
 {* ������������� str_wgFutureRedaction }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
