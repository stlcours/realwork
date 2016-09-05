unit nsIFilterFromQueryList;
 {* ������ ������ �� IFilterFromQuery }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Filters\nsIFilterFromQueryList.pas"
// ���������: "SimpleClass"
// ������� ������: "TnsIFilterFromQueryList" MUID: (4D0B4D810270)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , l3ProtoDataContainer
 , FiltersUnit
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = IFilterFromQuery;
 _l3InterfaceRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}
 TnsIFilterFromQueryList = class(_l3InterfaceRefList_)
  {* ������ ������ �� IFilterFromQuery }
 end;//TnsIFilterFromQueryList
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *4D0B4D810270impl_uses*
 //#UC END# *4D0B4D810270impl_uses*
;

type _Instance_R_ = TnsIFilterFromQueryList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
