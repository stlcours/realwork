unit InscContextFilterStateList;

// ������: "w:\common\components\gui\Garant\Nemesis\InscContextFilterStateList.pas"
// ���������: "SimpleClass"
// ������� ������: "TInscContextFilterStateList" MUID: (49083E6F02D8)

{$Include w:\common\components\gui\Garant\Nemesis\nscDefine.inc}

interface

{$If Defined(Nemesis)}
uses
 l3IntfUses
 , l3ProtoDataContainer
 , nscNewInterfaces
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = InscContextFilterState;
 _l3InterfaceRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}
 TInscContextFilterStateList = class(_l3InterfaceRefList_)
 end;//TInscContextFilterStateList
{$IfEnd} // Defined(Nemesis)

implementation

{$If Defined(Nemesis)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *49083E6F02D8impl_uses*
 //#UC END# *49083E6F02D8impl_uses*
;

type _Instance_R_ = TInscContextFilterStateList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}
{$IfEnd} // Defined(Nemesis)

end.
