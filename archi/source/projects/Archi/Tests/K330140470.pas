unit K330140470;
 {* [Requestlink:330140470] }

// ������: "w:\archi\source\projects\Archi\Tests\K330140470.pas"
// ���������: "TestCase"
// ������� ������: "TK330140470" MUID: (4F1FD3B801C1)

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
 TK330140470 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:330140470] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK330140470
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4F1FD3B801C1impl_uses*
 //#UC END# *4F1FD3B801C1impl_uses*
;

{$If NOT Defined(NoScripts)}
function TK330140470.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TableTools';
end;//TK330140470.GetFolder

function TK330140470.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F1FD3B801C1';
end;//TK330140470.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK330140470.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
