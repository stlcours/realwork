unit kwMedianBacket;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\kwMedianBacket.pas"
// ���������: "ScriptKeyword"
// ������� ������: "MedianBacket" MUID: (52D7DD7A0120)
// ��� ����: "TkwMedianBacket"

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwRegisterableWord
 , tfwScriptingInterfaces
;

type
 TkwMedianBacket = {abstract} class(TtfwRegisterableWord)
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function IsImmediate(const aCtx: TtfwContext): Boolean; override;
 end;//TkwMedianBacket
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 //#UC START# *52D7DD7A0120impl_uses*
 //#UC END# *52D7DD7A0120impl_uses*
;

procedure TkwMedianBacket.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52D7DD7A0120_var*
//#UC END# *4DAEEDE10285_52D7DD7A0120_var*
begin
//#UC START# *4DAEEDE10285_52D7DD7A0120_impl*
 if not aCtx.rWordCompilingNow.AcceptMedianBracket(Self, PtfwContext(@aCtx)^) then
  CompilerAssert(false, '�������� ������� ������', aCtx);
//#UC END# *4DAEEDE10285_52D7DD7A0120_impl*
end;//TkwMedianBacket.DoDoIt

function TkwMedianBacket.IsImmediate(const aCtx: TtfwContext): Boolean;
begin
 Result := True;
end;//TkwMedianBacket.IsImmediate

initialization
 TkwMedianBacket.RegisterClass;
 {* ����������� MedianBacket }
{$IfEnd} // NOT Defined(NoScripts)

end.
