unit tfwScriptEngineEX;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\tfwScriptEngineEX.pas"
// ���������: "SimpleClass"
// ������� ������: "TtfwScriptEngineEX" MUID: (4DEF306102FF)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwScriptEngine
;

type
 TtfwScriptEngineEX = class(TtfwScriptEngine)
 end;//TtfwScriptEngineEX
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , CodeFlowWordsPack
 , CompilationPack
 , WordsDefinitionPack
 , IncludesAndUsesPack
 , EtalonsWorkingPack
 , MouseInputPack
 {$If NOT Defined(NoVCL)}
 , ModalDialogsKeywordsPack
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , KeyboardInputPack
 {$IfEnd} // NOT Defined(NoVCL)
 , ObjectFromstackWords
 , CodeBranchingPack
 , ScriptsCompilingAndProcessingPack
 {$If NOT Defined(NoWindows)}
 , WinUtilsPack
 {$IfEnd} // NOT Defined(NoWindows)
 //#UC START# *4DEF306102FFimpl_uses*
 //#UC END# *4DEF306102FFimpl_uses*
;
{$IfEnd} // NOT Defined(NoScripts)

end.
