unit K474154467;
 {* [Requestlink:474154467] }

// ������: "w:\archi\source\projects\Archi\Tests\K474154467.pas"
// ���������: "TestCase"
// ������� ������: "K474154467" MUID: (51EFE56102B6)
// ��� ����: "TK474154467"

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
 TK474154467 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:474154467] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK474154467
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *51EFE56102B6impl_uses*
 //#UC END# *51EFE56102B6impl_uses*
;

{$If NOT Defined(NoScripts)}
function TK474154467.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'FilterTests';
end;//TK474154467.GetFolder

function TK474154467.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '51EFE56102B6';
end;//TK474154467.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK474154467.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
