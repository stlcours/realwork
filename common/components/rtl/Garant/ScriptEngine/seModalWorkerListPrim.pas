unit seModalWorkerListPrim;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\seModalWorkerListPrim.pas"
// ���������: "SimpleClass"
// ������� ������: "TseModalWorkerListPrim" MUID: (4FC7562801FE)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , l3ProtoDataContainer
 , seModalWorker
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = TseModalWorker;
 _l3RecordListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3RecordListPrim.imp.pas}
 TseModalWorkerListPrim = class(_l3RecordListPrim_)
 end;//TseModalWorkerListPrim
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *4FC7562801FEimpl_uses*
 //#UC END# *4FC7562801FEimpl_uses*
;

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_); forward;
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)
function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If NOT Defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
 const B: _ItemType_): Boolean;
 {* ���������� �������� ������ }
//#UC START# *47B07CF403D0_4FC7562801FE_var*
//#UC END# *47B07CF403D0_4FC7562801FE_var*
begin
//#UC START# *47B07CF403D0_4FC7562801FE_impl*
 Result := false;
 Assert(false);
//#UC END# *47B07CF403D0_4FC7562801FE_impl*
end;//IsSameItems
{$IfEnd} // NOT Defined(l3Items_IsAtomic)

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_4FC7562801FE_var*
//#UC END# *47B2C42A0163_4FC7562801FE_var*
begin
//#UC START# *47B2C42A0163_4FC7562801FE_impl*
 Assert(false);
//#UC END# *47B2C42A0163_4FC7562801FE_impl*
end;//AssignItem
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)

function CompareExistingItems(const CI: CompareItemsRec): Integer;
 {* ���������� ��� ������������ ��������. }
//#UC START# *47B99D4503A2_4FC7562801FE_var*
//#UC END# *47B99D4503A2_4FC7562801FE_var*
begin
//#UC START# *47B99D4503A2_4FC7562801FE_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_4FC7562801FE_impl*
end;//CompareExistingItems

type _Instance_R_ = TseModalWorkerListPrim;

{$Include w:\common\components\rtl\Garant\L3\l3RecordListPrim.imp.pas}
{$IfEnd} // NOT Defined(NoScripts)

end.
