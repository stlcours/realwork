unit kwBaseRelCorrecter;

// ������: "w:\archi\source\projects\Archi\Archi_Insider_Test_Support\kwBaseRelCorrecter.pas"
// ���������: "ScriptKeyword"
// ������� ������: "base_RelCorrecter" MUID: (526E5B5D033B)
// ��� ����: "TkwBaseRelCorrecter"

{$Include w:\archi\source\projects\Archi\arDefine.inc}

interface

{$If Defined(nsTest) AND Defined(InsiderTest) AND Defined(AppClientSide) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwRegisterableWord
 , tfwScriptingInterfaces
;

type
 TkwBaseRelCorrecter = {final} class(TtfwRegisterableWord)
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwBaseRelCorrecter
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest) AND Defined(AppClientSide) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest) AND Defined(AppClientSide) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , arArchiTestAdapter2
 //#UC START# *526E5B5D033Bimpl_uses*
 //#UC END# *526E5B5D033Bimpl_uses*
;

class function TkwBaseRelCorrecter.GetWordNameForRegister: AnsiString;
begin
 Result := 'base:RelCorrecter';
end;//TkwBaseRelCorrecter.GetWordNameForRegister

procedure TkwBaseRelCorrecter.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_526E5B5D033B_var*
var
 l_FileName: AnsiString;
//#UC END# *4DAEEDE10285_526E5B5D033B_var*
begin
//#UC START# *4DAEEDE10285_526E5B5D033B_impl*
 RunnerAssert(aCtx.rEngine.IsTopString, '�� ������ ��� �����!', aCtx);
 l_FileName := aCtx.rEngine.PopDelphiString;
 l_FileName := aCtx.rCaller.ResolveInputFilePath(l_FileName);
 acCorrectRelatedText(l_FileName);
//#UC END# *4DAEEDE10285_526E5B5D033B_impl*
end;//TkwBaseRelCorrecter.DoDoIt

initialization
 TkwBaseRelCorrecter.RegisterInEngine;
 {* ����������� base_RelCorrecter }
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest) AND Defined(AppClientSide) AND NOT Defined(NoScripts)

end.
