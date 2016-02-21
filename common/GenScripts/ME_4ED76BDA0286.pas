unit K109904163;
 {* [Requestlink:109904163] }

// ������: "w:\archi\source\projects\Archi\Tests\K109904163.pas"
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
 TK109904163 = class(TArchiInsiderTest)
  {* [Requestlink:109904163] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK109904163
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK109904163.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'SBSTests';
end;//TK109904163.GetFolder

function TK109904163.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4ED76BDA0286';
end;//TK109904163.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK109904163.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
