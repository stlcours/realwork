unit K371644395;
 {* [Requestlink:371644395] }

// ������: "w:\archi\source\projects\Archi\Tests\K371644395.pas"
// ���������: "TestCase"
// ������� ������: "K371644395" MUID: (4FFC003802F7)
// ��� ����: "TK371644395"

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
 TK371644395 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:371644395] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK371644395
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4FFC003802F7impl_uses*
 //#UC END# *4FFC003802F7impl_uses*
;

{$If NOT Defined(NoScripts)}
function TK371644395.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'BlockTest';
end;//TK371644395.GetFolder

function TK371644395.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4FFC003802F7';
end;//TK371644395.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK371644395.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
