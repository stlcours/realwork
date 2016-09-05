unit K421111320;
 {* [Requestlink:421111320] }

// ������: "w:\archi\source\projects\Archi\Tests\K421111320.pas"
// ���������: "TestCase"
// ������� ������: "K421111320" MUID: (50ED3862008B)
// ��� ����: "TK421111320"

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
 TK421111320 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:421111320] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK421111320
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *50ED3862008Bimpl_uses*
 //#UC END# *50ED3862008Bimpl_uses*
;

{$If NOT Defined(NoScripts)}
function TK421111320.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'SelectionTests';
end;//TK421111320.GetFolder

function TK421111320.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '50ED3862008B';
end;//TK421111320.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK421111320.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
