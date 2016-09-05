unit K333550210;
 {* [Requestlink:333550210] }

// ������: "w:\archi\source\projects\Archi\Tests\K333550210.pas"
// ���������: "TestCase"
// ������� ������: "K333550210" MUID: (4F2A8BDC02A8)
// ��� ����: "TK333550210"

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
 TK333550210 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:333550210] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK333550210
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4F2A8BDC02A8impl_uses*
 //#UC END# *4F2A8BDC02A8impl_uses*
;

{$If NOT Defined(NoScripts)}
function TK333550210.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TableTools';
end;//TK333550210.GetFolder

function TK333550210.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F2A8BDC02A8';
end;//TK333550210.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK333550210.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
