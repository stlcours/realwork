unit l3ProtoIntegerList;

// ������: "w:\common\components\rtl\Garant\L3\l3ProtoIntegerList.pas"
// ���������: "SimpleClass"
// ������� ������: "Tl3ProtoIntegerList" MUID: (4CA9A2EB01E4)

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = Integer;
 _l3AtomicList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3AtomicList.imp.pas}
 Tl3ProtoIntegerList = class(_l3AtomicList_)
 end;//Tl3ProtoIntegerList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *4CA9A2EB01E4impl_uses*
 //#UC END# *4CA9A2EB01E4impl_uses*
;

type _Instance_R_ = Tl3ProtoIntegerList;

{$Include w:\common\components\rtl\Garant\L3\l3AtomicList.imp.pas}

end.
