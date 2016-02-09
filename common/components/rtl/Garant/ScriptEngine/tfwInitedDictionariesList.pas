unit tfwInitedDictionariesList;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\tfwInitedDictionariesList.pas"
// ���������: "SimpleClass"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwDictionaryExPrim
 , l3ProtoDataContainer
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

 {$Define l3Items_NoSort}

 {$Define l3Items_NoChanging}

type
 _ItemType_ = TtfwDictionaryExPrim;
 {$Include tfwDictionaryList.imp.pas}
 TtfwInitedDictionariesList = class(_tfwDictionaryList_)
 end;//TtfwInitedDictionariesList
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

type _Instance_R_ = TtfwInitedDictionariesList;

{$Include tfwDictionaryList.imp.pas}
{$IfEnd} // NOT Defined(NoScripts)

end.
