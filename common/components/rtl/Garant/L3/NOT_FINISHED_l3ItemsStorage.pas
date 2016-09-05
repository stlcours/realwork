unit NOT_FINISHED_l3ItemsStorage;

// ������: "w:\common\components\rtl\Garant\L3\NOT_FINISHED_l3ItemsStorage.pas"
// ���������: "SimpleClass"
// ������� ������: "Tl3ItemsStorage" MUID: (4908A9FF0357)

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoPersistentDataContainer
 , l3Types
 , l3Interfaces
 , l3NotifyPtrList
;

type
 _l3LockedChange_Parent_ = Tl3ProtoPersistentDataContainer;
 {$Include w:\common\components\rtl\Garant\L3\l3LockedChange.imp.pas}
 _l3Sortable_Parent_ = _l3LockedChange_;
 {$Include w:\common\components\rtl\Garant\L3\l3Sortable.imp.pas}
 _l3ChangingChangedNotifier_Parent_ = _l3Sortable_;
 {$Include w:\common\components\rtl\Garant\L3\l3ChangingChangedNotifier.imp.pas}
 Tl3ItemsStorage = class(_l3ChangingChangedNotifier_)
  protected
   procedure Swap(var I1: _ItemType_;
    var I2: _ItemType_); override;
    {* ������ �������� ��������� �������. �� ��������� ���������� ��������. }
 end;//Tl3ItemsStorage

implementation

uses
 l3ImplUses
 , l3Base
 , SysUtils
 , l3IID
 , l3InterfacesMisc
 //#UC START# *4908A9FF0357impl_uses*
 //#UC END# *4908A9FF0357impl_uses*
;

function DoCompareItems(const A: _ItemType_;
 const B: _ItemType_;
 aSortIndex: Tl3SortIndex
{$If Defined(l3Items_CompareItemsRec_NeedsRList)};
 aList: _l3Sortable_
{$IfEnd} // Defined(l3Items_CompareItemsRec_NeedsRList)
): Integer;
//#UC START# *47B5B5F1038E_4908A9FF0357_var*
//#UC END# *47B5B5F1038E_4908A9FF0357_var*
begin
//#UC START# *47B5B5F1038E_4908A9FF0357_impl*
 !!! Needs to be implemented !!!
//#UC END# *47B5B5F1038E_4908A9FF0357_impl*
end;//DoCompareItems

{$Include w:\common\components\rtl\Garant\L3\l3LockedChange.imp.pas}

type _Instance_R_ = Tl3ItemsStorage;

{$Include w:\common\components\rtl\Garant\L3\l3Sortable.imp.pas}

{$Include w:\common\components\rtl\Garant\L3\l3ChangingChangedNotifier.imp.pas}

procedure Tl3ItemsStorage.Swap(var I1: _ItemType_;
 var I2: _ItemType_);
 {* ������ �������� ��������� �������. �� ��������� ���������� ��������. }
//#UC START# *47B5B88203A7_4908A9FF0357_var*
//#UC END# *47B5B88203A7_4908A9FF0357_var*
begin
//#UC START# *47B5B88203A7_4908A9FF0357_impl*
 !!! Needs to be implemented !!!
//#UC END# *47B5B88203A7_4908A9FF0357_impl*
end;//Tl3ItemsStorage.Swap

end.
