unit K264902382;
 {* [$264902382] }

// ������: "w:\archi\source\projects\Archi\Tests\K264902382.pas"
// ���������: "TestCase"

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
 TK264902382 = class(TArchiInsiderTest)
  {* [$264902382] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK264902382
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK264902382.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'EditorTests';
end;//TK264902382.GetFolder

function TK264902382.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4DE7495802D7';
end;//TK264902382.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK264902382.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
