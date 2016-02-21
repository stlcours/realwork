unit tfwDictionaryPrimPrimPrim;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryPrimPrimPrim.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , l3ProtoDataContainer
 , l3Variant
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

 {$Undef l3Items_NeedsBeforeFreeItem}

 {$Undef l3Items_NoSort}

 {$Undef l3Items_CaseUnsensitive}

type
 _l3StringList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3StringList.imp.pas}
 TtfwDictionaryPrimPrimPrim = {abstract} class(_l3StringList_)
 end;//TtfwDictionaryPrimPrimPrim
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , l3String
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

{$If not Declared(_ItemType_)}type _ItemType_ = Tl3PrimString;{$IfEnd}

{$If not Declared(_DataType_)}type _DataType_ = Tl3Ptr;{$IfEnd}

{$If not Declared(_FindDataType_)}type _FindDataType_ = _ItemType_;{$IfEnd}

type _Instance_R_ = TtfwDictionaryPrimPrimPrim;

{$Include w:\common\components\rtl\Garant\L3\l3StringList.imp.pas}
{$IfEnd} // NOT Defined(NoScripts)

end.
