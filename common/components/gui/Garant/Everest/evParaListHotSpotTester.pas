unit evParaListHotSpotTester;

// ������: "w:\common\components\gui\Garant\Everest\evParaListHotSpotTester.pas"
// ���������: "SimpleClass"
// ������� ������: "TevParaListHotSpotTester" MUID: (4A27B7300174)

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

{$If Defined(evNeedHotSpot)}
uses
 l3IntfUses
 , evParaListHotSpotTesterPrim
;

type
 TevParaListHotSpotTester = class(TevParaListHotSpotTesterPrim)
 end;//TevParaListHotSpotTester
{$IfEnd} // Defined(evNeedHotSpot)

implementation

{$If Defined(evNeedHotSpot)}
uses
 l3ImplUses
 //#UC START# *4A27B7300174impl_uses*
 //#UC END# *4A27B7300174impl_uses*
;
{$IfEnd} // Defined(evNeedHotSpot)

end.
