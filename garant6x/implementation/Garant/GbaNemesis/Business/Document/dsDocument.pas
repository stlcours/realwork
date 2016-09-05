unit dsDocument;
 {* ������� ����������� ��������, ���� � ��������� �� ������� (�����) }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Business\Document\dsDocument.pas"
// ���������: "ViewAreaControllerImp"
// ������� ������: "TdsDocument" MUID: (493D63D20049)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , DocumentAndListInterfaces
 , nevTools
 , WorkWithDocumentInterfaces
 , evdInterfaces
 , l3IID
 , DynamicDocListUnit
 , l3TreeInterfaces
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3Types
 , DocumentInterfaces
 , WorkWithListInterfaces
 , nsDocumentLikeStateHolder
 , afwInterfaces
 , l3Interfaces
 , bsTypes
 , FoldersDomainInterfaces
 , UnderControlUnit
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , DocumentUnit
 , bsTypesNew
 , l3ProtoObjectWithCOMQI
 {$If NOT Defined(NoVCM)}
 , vcmLocalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3NotifyPtrList
 , UnderControlInterfaces
 , PrimPrimListInterfaces
;

type
 _FormDataSourceType_ = IdsDocument;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\Business\Document\dsDocument.imp.pas}
 TdsDocument = class(_dsDocument_)
  {* ������� ����������� ��������, ���� � ��������� �� ������� (�����) }
  protected
   function MakeContainer: InevDocumentContainer; override;
    {* ������������ ��������� ��������� }
 end;//TdsDocument
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , nsF1DocumentContainer
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 , SysUtils
 , l3String
 , l3Base
 , deListSet
 , evdHyperlinkInfo
 , afwNavigation
 , Common_F1CommonServices_Contracts
 , bsUtils
 , BaseTypesUnit
 , bsConvert
 , l3Utils
 , deDocInfo
 , nsTypes
 , nsDocInfoHAFMacroReplacer
 {$If NOT Defined(NoVCM)}
 , StdRes
 {$IfEnd} // NOT Defined(NoVCM)
 , nsFolderFilterInfo
 , l3InterfacesMisc
 , afwFacade
 , IOUnit
 , deSearchInfo
 , DynamicTreeUnit
 , nsINodeWrap
 //#UC START# *493D63D20049impl_uses*
 //#UC END# *493D63D20049impl_uses*
;

type _Instance_R_ = TdsDocument;

{$Include w:\garant6x\implementation\Garant\GbaNemesis\Business\Document\dsDocument.imp.pas}

function TdsDocument.MakeContainer: InevDocumentContainer;
 {* ������������ ��������� ��������� }
//#UC START# *4C6AB38800F3_493D63D20049_var*
//#UC END# *4C6AB38800F3_493D63D20049_var*
begin
//#UC START# *4C6AB38800F3_493D63D20049_impl*
 Result := TnsF1DocumentContainer.Make(DocInfo);
//#UC END# *4C6AB38800F3_493D63D20049_impl*
end;//TdsDocument.MakeContainer
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
