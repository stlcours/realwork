unit NOT_FINISHED_vcmOperationParams;

// ������: "w:\common\components\gui\Garant\VCM\implementation\Components\NOT_FINISHED_vcmOperationParams.pas"
// ���������: "SimpleClass"
// ������� ������: "TvcmOperationParams" MUID: (5620D0B90294)

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If NOT Defined(NoVCM)}
uses
 l3IntfUses
 , vcmBaseCollectionItem
;

type
 TvcmOperationParams = class(TvcmBaseCollectionItem)
 end;//TvcmOperationParams
{$IfEnd} // NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoVCM)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *5620D0B90294impl_uses*
 //#UC END# *5620D0B90294impl_uses*
;

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TvcmOperationParams);
 {* ����������� TvcmOperationParams }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(NoVCM)

end.
