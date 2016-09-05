unit K341082326;
 {* [Requestlink:341082326] }

// ������: "w:\archi\source\projects\Archi\Tests\K341082326.pas"
// ���������: "TestCase"
// ������� ������: "K341082326" MUID: (4F47496A03AE)
// ��� ����: "TK341082326"

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
 TK341082326 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:341082326] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK341082326
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4F47496A03AEimpl_uses*
 //#UC END# *4F47496A03AEimpl_uses*
;

{$If NOT Defined(NoScripts)}
function TK341082326.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'BlockTest';
end;//TK341082326.GetFolder

function TK341082326.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F47496A03AE';
end;//TK341082326.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK341082326.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
