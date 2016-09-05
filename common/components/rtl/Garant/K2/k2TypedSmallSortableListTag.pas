unit k2TypedSmallSortableListTag;

// ������: "w:\common\components\rtl\Garant\K2\k2TypedSmallSortableListTag.pas"
// ���������: "SimpleClass"
// ������� ������: "Tk2TypedSmallSortableListTag" MUID: (527D1B7103A8)

{$Include w:\common\components\rtl\Garant\K2\k2Define.inc}

interface

uses
 l3IntfUses
 , k2TypedSimpleSortableTagListPrim
 , l3BitArr
 , l3Variant
 , k2Base
 , k2BaseStruct
 , k2TagList
 , k2Prim
 , l3IID
 , k2BaseTypes
 , l3Types
 , l3Interfaces
;

 {$Define k2Tag_No_f_TagType}

 {$Define k2TagIsList}

type
 _HashType_ = Tl3OneBytePtrHash;
 _k2HashTag_Parent_ = Tk2TypedSimpleSortableTagListPrim;
 {$Include w:\common\components\rtl\Garant\K2\k2HashTag.imp.pas}
 _k2TagByIntegerSearcher_Parent_ = _k2HashTag_;
 {$Include w:\common\components\rtl\Garant\K2\k2TagByIntegerSearcher.imp.pas}
 Tk2TypedSmallSortableListTag = class(_k2TagByIntegerSearcher_)
 end;//Tk2TypedSmallSortableListTag

implementation

uses
 l3ImplUses
 , SysUtils
 , k2Tags
 , l3Dict
 , k2Const
 , l3Const
 , l3String
 , k2Except
 , k2Strings
 , TypInfo
 , l3Stream
 , l3Base
 , k2Facade
 , Classes
 , k2OList_Const
 , k2Dictionary
 , k2NonOptimizeContext
 , k2VariantImpl
 , k2Bool_Const
 , k2String
 , k2NullTagImpl
 , k2Interfaces
 , k2DictionaryPrim
 , k2InterfaceFactory
 , k2List
 , l3Memory
 //#UC START# *527D1B7103A8impl_uses*
 //#UC END# *527D1B7103A8impl_uses*
;

type _Instance_R_ = Tk2TypedSmallSortableListTag;

{$Include w:\common\components\rtl\Garant\K2\k2HashTag.imp.pas}

{$Include w:\common\components\rtl\Garant\K2\k2TagByIntegerSearcher.imp.pas}

end.
