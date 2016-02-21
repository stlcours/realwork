unit ModalDialogsKeywordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\ModalDialogsKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3IntfUses
;
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

implementation

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3ImplUses
 , kwWasWait
 , kwWaitNo
 , kwWaitOk
 , kwWaitYes
 , kwWaitCancel
 , kwWaitChoice
 , tfwScriptingTypes
;
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

end.
