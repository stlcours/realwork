unit evReqList;

// ������: "w:\common\components\gui\Garant\Everest\qf\evReqList.pas"
// ���������: "SimpleClass"
// ������� ������: "TevReqList" MUID: (47CEE14D026C)

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , evQueryCardInt
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = IevReq;
 _l3InterfaceRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}
 TevReqList = class(_l3InterfaceRefList_)
 end;//TevReqList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *47CEE14D026Cimpl_uses*
 //#UC END# *47CEE14D026Cimpl_uses*
;

type _Instance_R_ = TevReqList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}

end.
