unit K425263512;
 {* [Requestlink:425263512] }

// ������: "w:\archi\source\projects\Archi\Tests\K425263512.pas"
// ���������: "TestCase"
// ������� ������: "K425263512" MUID: (510BB0AE028E)
// ��� ����: "TK425263512"

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
 TK425263512 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:425263512] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK425263512
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *510BB0AE028Eimpl_uses*
 //#UC END# *510BB0AE028Eimpl_uses*
;

{$If NOT Defined(NoScripts)}
function TK425263512.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'InnerTable';
end;//TK425263512.GetFolder

function TK425263512.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '510BB0AE028E';
end;//TK425263512.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK425263512.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
