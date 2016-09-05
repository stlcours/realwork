unit ddJustList;

// ������: "w:\common\components\rtl\Garant\dd\ddJustList.pas"
// ���������: "SimpleClass"
// ������� ������: "TddJustList" MUID: (51F0DBD202B0)

{$Include w:\common\components\rtl\Garant\dd\ddDefine.inc}

interface

uses
 l3IntfUses
 , l3SimpleDataContainer
 , ddTypes
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = TJust;
 _l3EnumList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3EnumList.imp.pas}
 TddJustList = class(_l3EnumList_)
 end;//TddJustList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *51F0DBD202B0impl_uses*
 //#UC END# *51F0DBD202B0impl_uses*
;

type _Instance_R_ = TddJustList;

{$Include w:\common\components\rtl\Garant\L3\l3EnumList.imp.pas}

end.
