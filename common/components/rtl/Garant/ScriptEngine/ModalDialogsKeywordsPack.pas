unit ModalDialogsKeywordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\ModalDialogsKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "ModalDialogsKeywordsPack" MUID: (4FFFDEE701EA)

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
 , SysUtils
 , TtfwTypeRegistrator_Proxy
 , tfwScriptingTypes
 //#UC START# *4FFFDEE701EAimpl_uses*
 //#UC END# *4FFFDEE701EAimpl_uses*
;
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

end.
