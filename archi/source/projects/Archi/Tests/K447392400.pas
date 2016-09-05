unit K447392400;
 {* [Requestlink:447392400] }

// ������: "w:\archi\source\projects\Archi\Tests\K447392400.pas"
// ���������: "TestCase"
// ������� ������: "K447392400" MUID: (515EE345026A)
// ��� ����: "TK447392400"

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
 TK447392400 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:447392400] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK447392400
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *515EE345026Aimpl_uses*
 //#UC END# *515EE345026Aimpl_uses*
;

{$If NOT Defined(NoScripts)}
function TK447392400.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'BlockTest';
end;//TK447392400.GetFolder

function TK447392400.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '515EE345026A';
end;//TK447392400.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK447392400.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
