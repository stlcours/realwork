unit tfwDictionaryStack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\tfwDictionaryStack.pas"
// ���������: "SimpleClass"
// ������� ������: "TtfwDictionaryStack" MUID: (559E7FC70157)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwDictionaryListPrim
;

type
 TtfwDictionaryStack = class(TtfwDictionaryListPrim)
 end;//TtfwDictionaryStack
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 //#UC START# *559E7FC70157impl_uses*
 //#UC END# *559E7FC70157impl_uses*
;
{$IfEnd} // NOT Defined(NoScripts)

end.
