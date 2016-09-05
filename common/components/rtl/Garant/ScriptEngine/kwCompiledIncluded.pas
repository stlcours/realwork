unit kwCompiledIncluded;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\kwCompiledIncluded.pas"
// ���������: "SimpleClass"
// ������� ������: "TkwCompiledIncluded" MUID: (4DC98AAC0395)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , kwCompiledWordPrim
 , tfwScriptingInterfaces
;

type
 TkwCompiledIncluded = class(TkwCompiledWordPrim)
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledIncluded
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , SysUtils
 //#UC START# *4DC98AAC0395impl_uses*
 //#UC END# *4DC98AAC0395impl_uses*
;

procedure TkwCompiledIncluded.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DC98AAC0395_var*
//#UC END# *4DAEEDE10285_4DC98AAC0395_var*
begin
//#UC START# *4DAEEDE10285_4DC98AAC0395_impl*
 RunnerError('������ ���������', aCtx);
//#UC END# *4DAEEDE10285_4DC98AAC0395_impl*
end;//TkwCompiledIncluded.DoDoIt

initialization
 TkwCompiledIncluded.RegisterClass;
 {* ����������� TkwCompiledIncluded }
{$IfEnd} // NOT Defined(NoScripts)

end.
