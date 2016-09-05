unit K517772970_TcsSpellCorrectTaskDefault;
 {* [RequestLink:517772970] }

// ������: "w:\archi\source\projects\PipeInAuto\Tests\Tasks\SaveLoadWithDefault\K517772970_TcsSpellCorrectTaskDefault.pas"
// ���������: "TestCase"
// ������� ������: "K517772970_TcsSpellCorrectTaskDefault" MUID: (53B25CAB001A)
// ��� ����: "TK517772970_TcsSpellCorrectTaskDefault"

{$Include w:\archi\source\projects\PipeInAuto\alcuDefine.inc}

interface

{$If Defined(AppServerSide) AND Defined(InsiderTest)}
uses
 l3IntfUses
 , K517772970_TCheckSaveToStreamDefault
 {$If NOT Defined(Nemesis)}
 , ddServerTask
 {$IfEnd} // NOT Defined(Nemesis)
;

type
 TK517772970_TcsSpellCorrectTaskDefault = class(TK517772970_TCheckSaveToStreamDefault)
  {* [RequestLink:517772970] }
  protected
   function GetTaskClass: TddTaskClass; override;
   {$If Defined(nsTest)}
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   {$IfEnd} // Defined(nsTest)
   {$If Defined(nsTest)}
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
   {$IfEnd} // Defined(nsTest)
 end;//TK517772970_TcsSpellCorrectTaskDefault
{$IfEnd} // Defined(AppServerSide) AND Defined(InsiderTest)

implementation

{$If Defined(AppServerSide) AND Defined(InsiderTest)}
uses
 l3ImplUses
 {$If NOT Defined(Nemesis)}
 , csSpellCorrectTask
 {$IfEnd} // NOT Defined(Nemesis)
 {$If Defined(nsTest)}
 , TestFrameWork
 {$IfEnd} // Defined(nsTest)
 , l3Filer
 , SysUtils
 //#UC START# *53B25CAB001Aimpl_uses*
 //#UC END# *53B25CAB001Aimpl_uses*
;

function TK517772970_TcsSpellCorrectTaskDefault.GetTaskClass: TddTaskClass;
//#UC START# *53170E4100CF_53B25CAB001A_var*
//#UC END# *53170E4100CF_53B25CAB001A_var*
begin
//#UC START# *53170E4100CF_53B25CAB001A_impl*
 Result := TcsSpellCorrectTask;
//#UC END# *53170E4100CF_53B25CAB001A_impl*
end;//TK517772970_TcsSpellCorrectTaskDefault.GetTaskClass

{$If Defined(nsTest)}
function TK517772970_TcsSpellCorrectTaskDefault.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TasksSaveLoadWithDefault';
end;//TK517772970_TcsSpellCorrectTaskDefault.GetFolder
{$IfEnd} // Defined(nsTest)

{$If Defined(nsTest)}
function TK517772970_TcsSpellCorrectTaskDefault.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '53B25CAB001A';
end;//TK517772970_TcsSpellCorrectTaskDefault.GetModelElementGUID
{$IfEnd} // Defined(nsTest)

initialization
 TestFramework.RegisterTest(TK517772970_TcsSpellCorrectTaskDefault.Suite);
{$IfEnd} // Defined(AppServerSide) AND Defined(InsiderTest)

end.
