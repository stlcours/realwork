unit Filters_Form;
 {* ������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Filters\Forms\Filters_Form.pas"
// ���������: "VCMFinalForm"
// ������� ������: "Filters" MUID: (4ABCD2BC0302)
// ��� ����: "TenFilters"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , PrimFiltersOptions_Form
 , Common_FormDefinitions_Controls
 {$If NOT Defined(NoVCM)}
 , vcmEntities
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TenFilters = {final} class(TPrimFiltersOptionsForm, FiltersFormDef)
  {* ������� }
   Entities : TvcmEntities;
 end;//TenFilters
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , FiltersKeywordsPack
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
;

{$R *.DFM}

initialization
 fm_enFilters.SetFactory(TenFilters.Make);
 {* ����������� ������� ����� Filters }
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TenFilters);
 {* ����������� Filters }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
