unit NOT_FINISHED_csClientMessageRequest;

// ������: "w:\common\components\rtl\Garant\cs\NOT_FINISHED_csClientMessageRequest.pas"
// ���������: "UtilityPack"
// ������� ������: "csClientMessageRequest" MUID: (52FA504602B0)

{$Include w:\common\components\rtl\Garant\cs\CsDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , ddClientMessagePrim
;

type
 TddClientMessage = class(TddClientMessagePrim)
 end;//TddClientMessage
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
 //#UC START# *52FA504602B0impl_uses*
 //#UC END# *52FA504602B0impl_uses*
;
{$IfEnd} // NOT Defined(Nemesis)

end.
