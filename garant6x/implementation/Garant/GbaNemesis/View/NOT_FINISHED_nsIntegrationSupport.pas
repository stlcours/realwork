unit NOT_FINISHED_nsIntegrationSupport;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\NOT_FINISHED_nsIntegrationSupport.pas"
// ���������: "UtilityPack"
// ������� ������: "nsIntegrationSupport" MUID: (4F86C0140332)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
;

type
 PnsLinkDataArray = ^TnsLinkDataArray;

 PIntegrationData = ^TIntegrationData;

 TnsLinkDataArray = array of ;

 TIntegrationData = packed record
 end;//TIntegrationData
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , IntegrationWordsPack
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *4F86C0140332impl_uses*
 //#UC END# *4F86C0140332impl_uses*
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
