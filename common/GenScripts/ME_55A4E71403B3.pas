unit tfwDictionaryList;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryList.pas"
// ���������: "SimpleClass"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwDictionaryEx
 , l3ProtoDataContainer
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
 , tfwDictionaryExPrim
;

type
 _ItemType_ = TtfwDictionaryEx;
 {$Include w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryList.imp.pas}
 _tfwNamedDictionaryList_Parent_ = _tfwDictionaryList_;
 {$Include w:\common\components\rtl\Garant\ScriptEngine\tfwNamedDictionaryList.imp.pas}
 TtfwDictionaryList = class(_tfwNamedDictionaryList_)
 end;//TtfwDictionaryList
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 , l3String
;

type _Instance_R_ = TtfwDictionaryList;

{$Include w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryList.imp.pas}

{$Include w:\common\components\rtl\Garant\ScriptEngine\tfwNamedDictionaryList.imp.pas}
{$IfEnd} // NOT Defined(NoScripts)

end.
