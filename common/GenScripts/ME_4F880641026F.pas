unit K358355183;
 {* [Requestlink:358355183] }

// ������: "w:\archi\source\projects\Archi\Tests\K358355183.pas"
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
 TK358355183 = class(TArchiInsiderTest)
  {* [Requestlink:358355183] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK358355183
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK358355183.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'BlockTest';
end;//TK358355183.GetFolder

function TK358355183.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F880641026F';
end;//TK358355183.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK358355183.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
