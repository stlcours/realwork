unit K313754442;
 {* [Requestlink:313754442] }

// ������: "w:\archi\source\projects\Archi\Tests\K313754442.pas"
// ���������: "TestCase"
// ������� ������: "K313754442" MUID: (4EEF09B1003C)
// ��� ����: "TK313754442"

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
 TK313754442 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:313754442] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK313754442
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4EEF09B1003Cimpl_uses*
 //#UC END# *4EEF09B1003Cimpl_uses*
;

{$If NOT Defined(NoScripts)}
function TK313754442.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'EditorTests';
end;//TK313754442.GetFolder

function TK313754442.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4EEF09B1003C';
end;//TK313754442.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK313754442.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
