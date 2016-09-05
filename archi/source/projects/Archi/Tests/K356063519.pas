unit K356063519;
 {* [Requestlink:356063519] }

// ������: "w:\archi\source\projects\Archi\Tests\K356063519.pas"
// ���������: "TestCase"
// ������� ������: "K356063519" MUID: (4F7D5A5E0087)
// ��� ����: "TK356063519"

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
 TK356063519 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:356063519] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK356063519
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4F7D5A5E0087impl_uses*
 //#UC END# *4F7D5A5E0087impl_uses*
;

{$If NOT Defined(NoScripts)}
function TK356063519.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'ContentsTree';
end;//TK356063519.GetFolder

function TK356063519.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F7D5A5E0087';
end;//TK356063519.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK356063519.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
