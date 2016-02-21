unit K206078013;
 {* [Requestlink:206078013] }

// ������: "w:\archi\source\projects\Archi\Tests\K206078013.pas"
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
 TK206078013 = class(TArchiInsiderTest)
  {* [Requestlink:206078013] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK206078013
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK206078013.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TableBoundariesAlignment';
end;//TK206078013.GetFolder

function TK206078013.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F30CB7B02FC';
end;//TK206078013.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK206078013.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
