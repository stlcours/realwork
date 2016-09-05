unit l3ProtoObjectRefSortableList;

// ������: "w:\common\components\rtl\Garant\L3\l3ProtoObjectRefSortableList.pas"
// ���������: "SimpleClass"
// ������� ������: "Tl3ProtoObjectRefSortableList" MUID: (4D5BF8B60011)

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , l3ProtoObjectComparable
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = Tl3ProtoObjectComparable;
 _l3UncomparabeObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3UncomparabeObjectRefList.imp.pas}
 Tl3ProtoObjectRefSortableList = class(_l3UncomparabeObjectRefList_)
 end;//Tl3ProtoObjectRefSortableList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *4D5BF8B60011impl_uses*
 //#UC END# *4D5BF8B60011impl_uses*
;

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_4D5BF8B60011_var*
//#UC END# *47B2C42A0163_4D5BF8B60011_var*
begin
//#UC START# *47B2C42A0163_4D5BF8B60011_impl*
 Assert(false);
//#UC END# *47B2C42A0163_4D5BF8B60011_impl*
end;//AssignItem
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)

function CompareExistingItems(const CI: CompareItemsRec): Integer;
 {* ���������� ��� ������������ ��������. }
//#UC START# *47B99D4503A2_4D5BF8B60011_var*
//#UC END# *47B99D4503A2_4D5BF8B60011_var*
begin
//#UC START# *47B99D4503A2_4D5BF8B60011_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := CI.rA.CompareWith(CI.rB^);
//#UC END# *47B99D4503A2_4D5BF8B60011_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3ProtoObjectRefSortableList;

{$Include w:\common\components\rtl\Garant\L3\l3UncomparabeObjectRefList.imp.pas}

end.
