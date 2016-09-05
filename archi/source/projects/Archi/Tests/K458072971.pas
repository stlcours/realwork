unit K458072971;
 {* [Requestlink:458072971] }

// ������: "w:\archi\source\projects\Archi\Tests\K458072971.pas"
// ���������: "TestCase"
// ������� ������: "K458072971" MUID: (51A4608F021D)
// ��� ����: "TK458072971"

{$Include w:\archi\source\projects\Archi\arDefine.inc}

interface

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3IntfUses
 {$If NOT Defined(NoScripts)}
 , ArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
;

type
 TK458072971 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:458072971] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK458072971
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *51A4608F021Dimpl_uses*
 //#UC END# *51A4608F021Dimpl_uses*
;

{$If NOT Defined(NoScripts)}
function TK458072971.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'FilterTests';
end;//TK458072971.GetFolder

function TK458072971.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '51A4608F021D';
end;//TK458072971.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK458072971.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
