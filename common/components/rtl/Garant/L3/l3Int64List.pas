unit l3Int64List;

// ������: "w:\common\components\rtl\Garant\L3\l3Int64List.pas"
// ���������: "SimpleClass"
// ������� ������: "Tl3Int64List" MUID: (541C300401C3)

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
 _ItemType_ = Int64;
 _l3AtomicList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3AtomicList.imp.pas}
 Tl3Int64List = class(_l3AtomicList_)
 end;//Tl3Int64List

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *541C300401C3impl_uses*
 //#UC END# *541C300401C3impl_uses*
;

type _Instance_R_ = Tl3Int64List;

{$Include w:\common\components\rtl\Garant\L3\l3AtomicList.imp.pas}

end.
