unit K477643230;
 {* [Requestlink:477643230] }

// ������: "w:\archi\source\projects\Archi\Tests\K477643230.pas"
// ���������: "TestCase"
// ������� ������: "K477643230" MUID: (5216104C00B4)
// ��� ����: "TK477643230"

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
 TK477643230 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:477643230] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK477643230
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *5216104C00B4impl_uses*
 //#UC END# *5216104C00B4impl_uses*
;

{$If NOT Defined(NoScripts)}
function TK477643230.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'FilterTests';
end;//TK477643230.GetFolder

function TK477643230.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '5216104C00B4';
end;//TK477643230.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK477643230.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
