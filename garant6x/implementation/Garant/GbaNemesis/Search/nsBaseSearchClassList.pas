unit nsBaseSearchClassList;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Search\nsBaseSearchClassList.pas"
// ���������: "SimpleClass"
// ������� ������: "TnsBaseSearchClassList" MUID: (5625FA0902EE)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , l3ProtoDataContainer
 , BaseSearchInterfaces
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = InsBaseSearchClass;
 _l3InterfaceRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}
 TnsBaseSearchClassList = class(_l3InterfaceRefList_)
 end;//TnsBaseSearchClassList
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *5625FA0902EEimpl_uses*
 //#UC END# *5625FA0902EEimpl_uses*
;

type _Instance_R_ = TnsBaseSearchClassList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
