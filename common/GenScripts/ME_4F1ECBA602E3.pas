unit K329649989;
 {* [Requestlink:329649989] }

// ������: "w:\archi\source\projects\Archi\Tests\K329649989.pas"
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
 TK329649989 = class(TArchiInsiderTest)
  {* [Requestlink:329649989] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK329649989
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK329649989.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'EditorTests';
end;//TK329649989.GetFolder

function TK329649989.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F1ECBA602E3';
end;//TK329649989.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK329649989.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
