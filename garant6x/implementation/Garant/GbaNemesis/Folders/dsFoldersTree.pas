unit dsFoldersTree;
 {* ����� ��� ���������� ����� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Folders\dsFoldersTree.pas"
// ���������: "ViewAreaControllerImp"
// ������� ������: "TdsFoldersTree" MUID: (492286CA0097)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , FoldersInterfaces
 , l3TreeInterfaces
 , l3Interfaces
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3ProtoObjectWithCOMQI
 {$If NOT Defined(NoVCM)}
 , vcmLocalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3NotifyPtrList
;

type
 _FormDataSourceType_ = IdsFoldersTree;
 {$Include w:\common\components\gui\Garant\VCM\implementation\vcmFormDataSourcePrim.imp.pas}
 TdsFoldersTree = class(_vcmFormDataSourcePrim_, IdsFoldersTree)
  {* ����� ��� ���������� ����� }
  protected
   procedure CanBeOpen(const aNode: Il3SimpleNode); { can raise EdsConsultationInProcess, EdsConsultationSending, EdsOldRefusalConsultationFormat }
    {* ����� �� ������� �������.
           ��������� ����������:
             - EdsConsultationInProcess;
             - EdsConsultationSending; }
   function CanBeOpenAsConsultation(const aNode: Il3SimpleNode): Boolean;
    {* ���������� ����������� �������� ������� ��� ��������� }
   function CanGiveMarkOnConsultation(const aNode: Il3SimpleNode): Boolean;
    {* ���������� ����������� ������ �� ������������ }
   function CanDelete(const aNode: Il3SimpleNode): Boolean;
    {* ������ ������� }
   function IsConsultation(const aNode: Il3SimpleNode): Boolean;
    {* ���� �������� ������������� }
   procedure DeleteConsultation(const aNode: Il3SimpleNode);
    {* ������� ������������ }
   function CanImportConsultation(const aNode: Il3SimpleNode): Boolean;
    {* ����� �� ������������� ������������. �������� ������ ���� aNode =
           "��� ������������" }
   procedure ImportConsultation(const aFileName: Tl3WString);
    {* ������������� ������������.
           ����������:
           - EAccessDenied;
           - EInvalidXMLType; }
   function CanExportForIntegration(const aNode: Il3SimpleNode): Boolean;
    {* ����� �� �������������� ���������� ����� �� ������������ }
   procedure ExportForIntegration(const aNode: Il3SimpleNode);
    {* �������������� ������������.
           ����������:
           - EInvalidEntityType; }
   function CanExportToXML(const aNode: Il3SimpleNode): Boolean;
    {* ����� �� �������������� ���� �� ����� }
   procedure ExportToXML(const aNode: Il3SimpleNode;
    const aFileName: Tl3WString);
    {* �������������� ���� �� �����.
           ����������:
           - EAccessDenied;
           - EInvalidEntityType; }
   function CanImportFromXML(const aNode: Il3SimpleNode): Boolean;
    {* ����� �� ������������� ���� � ����� }
   procedure ImportFromXML(const aNode: Il3SimpleNode;
    const aFileName: Tl3WString);
    {* ������������� ���� � �����.
           ����������:
           - EAccessDenied;
           - EInvalidEntityType; }
 end;//TdsFoldersTree
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , SysUtils
 , DataAdapter
 , bsUtils
 , ConsultationDomainInterfaces
 , FoldersUnit
 , bsConsultation
 , bsTypes
 , nsFolders
 , FoldersDomainInterfaces
 , ConsultingUnit
 , nsManagers
 , nsTypes
 , l3InterfacesMisc
 , l3Base
 //#UC START# *492286CA0097impl_uses*
 //#UC END# *492286CA0097impl_uses*
;

type _Instance_R_ = TdsFoldersTree;

{$Include w:\common\components\gui\Garant\VCM\implementation\vcmFormDataSourcePrim.imp.pas}

procedure TdsFoldersTree.CanBeOpen(const aNode: Il3SimpleNode); { can raise EdsConsultationInProcess, EdsConsultationSending, EdsOldRefusalConsultationFormat }
 {* ����� �� ������� �������.
           ��������� ����������:
             - EdsConsultationInProcess;
             - EdsConsultationSending; }
//#UC START# *49219AE20118_492286CA0097_var*

  procedure lp_CheckConsultation;
  var
   l_Consultation: IbsConsultation;
  begin
   if bsHasFlag(aNode, [NF_PAYMENT_REFUSAL]) then
   begin
    l_Consultation := TbsConsultation.Make(bsGetConsultation(aNode));
    try
     if bs_csPaymentRefusalOldFormat in l_Consultation.Status then
      raise EdsOldRefusalConsultationFormat.Create('');
    finally
     l_Consultation := nil;
    end;//try..finally
   end;//if bsHasFlag(aNode, NF_PAYMENT_REFUSAL) then
  end;//lp_CheckConsultation

//#UC END# *49219AE20118_492286CA0097_var*
begin
//#UC START# *49219AE20118_492286CA0097_impl*
 // ����������� ������������ � ������ ������� ������ ���������:
 if bsCheckNodeType(aNode, FIT_CONSULTATION) then
  lp_CheckConsultation
 else
  ;
//#UC END# *49219AE20118_492286CA0097_impl*
end;//TdsFoldersTree.CanBeOpen

function TdsFoldersTree.CanBeOpenAsConsultation(const aNode: Il3SimpleNode): Boolean;
 {* ���������� ����������� �������� ������� ��� ��������� }
//#UC START# *49219B0B0108_492286CA0097_var*
//#UC END# *49219B0B0108_492286CA0097_var*
begin
//#UC START# *49219B0B0108_492286CA0097_impl*
 // �� ��������� ����������� ��� ������ ������������ �� ����� ���� ���������
 Result := bsCheckNodeType(aNode, FIT_CONSULTATION) and not bsHasFlag(aNode,
  [NF_CONSULTATION_SENT, NF_DRAFTS, NF_PAYMENT_REFUSAL]);
//#UC END# *49219B0B0108_492286CA0097_impl*
end;//TdsFoldersTree.CanBeOpenAsConsultation

function TdsFoldersTree.CanGiveMarkOnConsultation(const aNode: Il3SimpleNode): Boolean;
 {* ���������� ����������� ������ �� ������������ }
//#UC START# *49219B1D02A0_492286CA0097_var*
//#UC END# *49219B1D02A0_492286CA0097_var*
begin
//#UC START# *49219B1D02A0_492286CA0097_impl*
 // �� ���������, ������ �� ����� ���� �����������
 Result := bsCheckNodeType(aNode, FIT_CONSULTATION) and
           bsHasFlag(aNode, [NF_ANSWER_READ]) and
       not bsHasFlag(aNode, [NF_ESTIMATION_SENT]);
//#UC END# *49219B1D02A0_492286CA0097_impl*
end;//TdsFoldersTree.CanGiveMarkOnConsultation

function TdsFoldersTree.CanDelete(const aNode: Il3SimpleNode): Boolean;
 {* ������ ������� }
//#UC START# *49219B4D029C_492286CA0097_var*
//#UC END# *49219B4D029C_492286CA0097_var*
begin
//#UC START# *49219B4D029C_492286CA0097_impl*
 if bsCheckNodeType(aNode, FIT_CONSULTATION) then
  Result := bsHasFlag(aNode, [NF_ANSWER_RECEIVED,
                              NF_ANSWER_READ,
                              NF_ESTIMATION_SENT,
                              NF_DRAFTS,
                              NF_PAYMENT_REFUSAL,
                              NF_VALIDATION_FAILED])
 else
  Result := CheckFolderElementRights(aNode, faDelete);
//#UC END# *49219B4D029C_492286CA0097_impl*
end;//TdsFoldersTree.CanDelete

function TdsFoldersTree.IsConsultation(const aNode: Il3SimpleNode): Boolean;
 {* ���� �������� ������������� }
//#UC START# *49219B5E0026_492286CA0097_var*
//#UC END# *49219B5E0026_492286CA0097_var*
begin
//#UC START# *49219B5E0026_492286CA0097_impl*
 Result := bsCheckNodeType(aNode, FIT_CONSULTATION);
//#UC END# *49219B5E0026_492286CA0097_impl*
end;//TdsFoldersTree.IsConsultation

procedure TdsFoldersTree.DeleteConsultation(const aNode: Il3SimpleNode);
 {* ������� ������������ }
//#UC START# *49219B6D00F7_492286CA0097_var*
var
 l_Consultation: IConsultation;
//#UC END# *49219B6D00F7_492286CA0097_var*
begin
//#UC START# *49219B6D00F7_492286CA0097_impl*
 l_Consultation := bsGetConsultation(aNode);
 if Assigned(l_Consultation) then
 try
  DefDataAdapter.ConsultationManager.DeleteConsultation(l_Consultation);
  ConsultationManager.UnreadChanged;
 finally
  l_Consultation := nil;
 end;{try..finally}
//#UC END# *49219B6D00F7_492286CA0097_impl*
end;//TdsFoldersTree.DeleteConsultation

function TdsFoldersTree.CanImportConsultation(const aNode: Il3SimpleNode): Boolean;
 {* ����� �� ������������� ������������. �������� ������ ���� aNode =
           "��� ������������" }
//#UC START# *49219B7D0122_492286CA0097_var*
//#UC END# *49219B7D0122_492286CA0097_var*
begin
//#UC START# *49219B7D0122_492286CA0097_impl*
 Result := bsHasFlag(aNode, [NF_MY_CONSULTATIONS]);
//#UC END# *49219B7D0122_492286CA0097_impl*
end;//TdsFoldersTree.CanImportConsultation

procedure TdsFoldersTree.ImportConsultation(const aFileName: Tl3WString);
 {* ������������� ������������.
           ����������:
           - EAccessDenied;
           - EInvalidXMLType; }
//#UC START# *49219B9101C6_492286CA0097_var*
//#UC END# *49219B9101C6_492286CA0097_var*
begin
//#UC START# *49219B9101C6_492286CA0097_impl*
 DefDataAdapter.ConsultationManager.LoadFromXml(nsAStr(aFileName).S);
//#UC END# *49219B9101C6_492286CA0097_impl*
end;//TdsFoldersTree.ImportConsultation

function TdsFoldersTree.CanExportForIntegration(const aNode: Il3SimpleNode): Boolean;
 {* ����� �� �������������� ���������� ����� �� ������������ }
//#UC START# *49219BAA0308_492286CA0097_var*
//#UC END# *49219BAA0308_492286CA0097_var*
begin
//#UC START# *49219BAA0308_492286CA0097_impl*
 Result := bsCanExportNodeToIntegrationXML(aNode);
//#UC END# *49219BAA0308_492286CA0097_impl*
end;//TdsFoldersTree.CanExportForIntegration

procedure TdsFoldersTree.ExportForIntegration(const aNode: Il3SimpleNode);
 {* �������������� ������������.
           ����������:
           - EInvalidEntityType; }
//#UC START# *49219BBE035D_492286CA0097_var*
//#UC END# *49219BBE035D_492286CA0097_var*
begin
//#UC START# *49219BBE035D_492286CA0097_impl*
 bsExportNodeToIntegrationXML(aNode);
//#UC END# *49219BBE035D_492286CA0097_impl*
end;//TdsFoldersTree.ExportForIntegration

function TdsFoldersTree.CanExportToXML(const aNode: Il3SimpleNode): Boolean;
 {* ����� �� �������������� ���� �� ����� }
//#UC START# *49219BD0007C_492286CA0097_var*
//#UC END# *49219BD0007C_492286CA0097_var*
begin
//#UC START# *49219BD0007C_492286CA0097_impl*
 Result := bsCanExportNodeToXML(aNode);
//#UC END# *49219BD0007C_492286CA0097_impl*
end;//TdsFoldersTree.CanExportToXML

procedure TdsFoldersTree.ExportToXML(const aNode: Il3SimpleNode;
 const aFileName: Tl3WString);
 {* �������������� ���� �� �����.
           ����������:
           - EAccessDenied;
           - EInvalidEntityType; }
//#UC START# *49219BE201A9_492286CA0097_var*
//#UC END# *49219BE201A9_492286CA0097_var*
begin
//#UC START# *49219BE201A9_492286CA0097_impl*
 bsExportNodeToXML(aNode, aFileName);
//#UC END# *49219BE201A9_492286CA0097_impl*
end;//TdsFoldersTree.ExportToXML

function TdsFoldersTree.CanImportFromXML(const aNode: Il3SimpleNode): Boolean;
 {* ����� �� ������������� ���� � ����� }
//#UC START# *49219BFC01FD_492286CA0097_var*
//#UC END# *49219BFC01FD_492286CA0097_var*
begin
//#UC START# *49219BFC01FD_492286CA0097_impl*
 Result := bsCanImportNodeFromXML(aNode);
//#UC END# *49219BFC01FD_492286CA0097_impl*
end;//TdsFoldersTree.CanImportFromXML

procedure TdsFoldersTree.ImportFromXML(const aNode: Il3SimpleNode;
 const aFileName: Tl3WString);
 {* ������������� ���� � �����.
           ����������:
           - EAccessDenied;
           - EInvalidEntityType; }
//#UC START# *49219C0C0077_492286CA0097_var*
//#UC END# *49219C0C0077_492286CA0097_var*
begin
//#UC START# *49219C0C0077_492286CA0097_impl*
 bsImportNodeFromXML(aNode, aFileName);
//#UC END# *49219C0C0077_492286CA0097_impl*
end;//TdsFoldersTree.ImportFromXML
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
