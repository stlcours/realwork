unit NOT_FINISHED_vcmRepOperationsCollectionItem;

// ������: "w:\common\components\gui\Garant\VCM\implementation\Components\NOT_FINISHED_vcmRepOperationsCollectionItem.pas"
// ���������: "SimpleClass"
// ������� ������: "TvcmRepOperationsCollectionItem" MUID: (4E3012700155)

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If NOT Defined(NoVCM)}
uses
 l3IntfUses
 , vcmBaseOperationsCollectionItem
;

type
 TvcmFormActivate = class
 end;//TvcmFormActivate

 TvcmRepOperationsCollectionItem = class(TvcmBaseOperationsCollectionItem)
 end;//TvcmRepOperationsCollectionItem
{$IfEnd} // NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoVCM)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *4E3012700155impl_uses*
 //#UC END# *4E3012700155impl_uses*
;

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TvcmRepOperationsCollectionItem);
 {* ����������� TvcmRepOperationsCollectionItem }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(NoVCM)

end.
