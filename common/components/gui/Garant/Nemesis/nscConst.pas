unit nscConst;

// ������: "w:\common\components\gui\Garant\Nemesis\nscConst.pas"
// ���������: "UtilityPack"
// ������� ������: "nscConst" MUID: (4CFF747800AA)

{$Include w:\common\components\gui\Garant\Nemesis\nscDefine.inc}

interface

{$If Defined(Nemesis)}
uses
 l3IntfUses
 , Graphics
;

const
 cDefaultContextEmptyColor = Graphics.clGrayText;
 cPlusKeyCode = 188;
 cMinusKeyCode = 189;
{$IfEnd} // Defined(Nemesis)

implementation

{$If Defined(Nemesis)}
uses
 l3ImplUses
 //#UC START# *4CFF747800AAimpl_uses*
 //#UC END# *4CFF747800AAimpl_uses*
;
{$IfEnd} // Defined(Nemesis)

end.
