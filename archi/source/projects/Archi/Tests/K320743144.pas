unit K320743144;
 {* [Requestlink:320743144] }

// ������: "w:\archi\source\projects\Archi\Tests\K320743144.pas"
// ���������: "TestCase"
// ������� ������: "K320743144" MUID: (4EF03F8103BB)
// ��� ����: "TK320743144"

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
 TK320743144 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:320743144] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK320743144
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4EF03F8103BBimpl_uses*
 //#UC END# *4EF03F8103BBimpl_uses*
;

{$If NOT Defined(NoScripts)}
function TK320743144.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'SBSTests';
end;//TK320743144.GetFolder

function TK320743144.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4EF03F8103BB';
end;//TK320743144.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK320743144.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
