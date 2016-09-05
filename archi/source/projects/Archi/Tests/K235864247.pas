unit K235864247;
 {* [Requestlink:235864247] }

// ������: "w:\archi\source\projects\Archi\Tests\K235864247.pas"
// ���������: "TestCase"
// ������� ������: "K235864247" MUID: (4F339DEC030C)
// ��� ����: "TK235864247"

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
 TK235864247 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:235864247] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK235864247
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4F339DEC030Cimpl_uses*
 //#UC END# *4F339DEC030Cimpl_uses*
;

{$If NOT Defined(NoScripts)}
function TK235864247.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TableTools';
end;//TK235864247.GetFolder

function TK235864247.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F339DEC030C';
end;//TK235864247.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK235864247.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
