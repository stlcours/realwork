unit nevAnchorList;

// ������: "w:\common\components\gui\Garant\Everest\new\nevAnchorList.pas"
// ���������: "SimpleClass"
// ������� ������: "TnevAnchorList" MUID: (47F4CE1200E9)

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , nevTools
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = InevAnchor;
 _l3InterfaceRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}
 TnevAnchorList = class(_l3InterfaceRefList_)
 end;//TnevAnchorList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *47F4CE1200E9impl_uses*
 //#UC END# *47F4CE1200E9impl_uses*
;

type _Instance_R_ = TnevAnchorList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}

end.
