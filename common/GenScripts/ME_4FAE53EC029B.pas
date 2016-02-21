unit K363570808;
 {* [Requestlink:363570808] }

// ������: "w:\archi\source\projects\Archi\Tests\K363570808.pas"
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
 TK363570808 = class(TArchiInsiderTest)
  {* [Requestlink:363570808] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK363570808
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK363570808.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'Text2TableTests';
end;//TK363570808.GetFolder

function TK363570808.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4FAE53EC029B';
end;//TK363570808.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK363570808.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
