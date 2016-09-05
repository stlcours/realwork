unit kwCompiledTryFinally;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\kwCompiledTryFinally.pas"
// ���������: "SimpleClass"
// ������� ������: "TkwCompiledTryFinally" MUID: (4DBAC56C017C)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , kwDualCompiledWordContainer
 , tfwScriptingInterfaces
;

type
 TkwCompiledTryFinally = class(TkwDualCompiledWordContainer)
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledTryFinally
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwClassRef
 //#UC START# *4DBAC56C017Cimpl_uses*
 //#UC END# *4DBAC56C017Cimpl_uses*
;

procedure TkwCompiledTryFinally.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DBAC56C017C_var*
//#UC END# *4DAEEDE10285_4DBAC56C017C_var*
begin
//#UC START# *4DAEEDE10285_4DBAC56C017C_impl*
 try
  WordToWork.DoIt(aCtx);
 finally
  f_ElseBranch.DoIt(aCtx);
 end;//try..finally
//#UC END# *4DAEEDE10285_4DBAC56C017C_impl*
end;//TkwCompiledTryFinally.DoDoIt

initialization
 TkwCompiledTryFinally.RegisterClass;
 {* ����������� TkwCompiledTryFinally }
{$IfEnd} // NOT Defined(NoScripts)

end.
