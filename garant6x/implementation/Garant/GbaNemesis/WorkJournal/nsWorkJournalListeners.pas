unit nsWorkJournalListeners;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\WorkJournal\nsWorkJournalListeners.pas"
// ���������: "SimpleClass"
// ������� ������: "TnsWorkJournalListeners" MUID: (4A83AC9D0128)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , l3SimpleDataContainer
 , PrimWorkJournalInterfaces
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = InsWorkJournalListener;
 _l3InterfacePtrList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfacePtrList.imp.pas}
 TnsWorkJournalListeners = class(_l3InterfacePtrList_)
 end;//TnsWorkJournalListeners
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *4A83AC9D0128impl_uses*
 //#UC END# *4A83AC9D0128impl_uses*
;

type _Instance_R_ = TnsWorkJournalListeners;

{$Include w:\common\components\rtl\Garant\L3\l3InterfacePtrList.imp.pas}
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
