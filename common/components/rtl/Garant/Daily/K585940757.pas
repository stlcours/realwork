unit K585940757;
 {* [Requestlink:585940757] }

// ������: "w:\common\components\rtl\Garant\Daily\K585940757.pas"
// ���������: "TestCase"
// ������� ������: "K585940757" MUID: (54A13842014F)
// ��� ����: "TK585940757"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , HTMLtoEVDTest
;

type
 TK585940757 = class(THTMLtoEVDTest)
  {* [Requestlink:585940757] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK585940757
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *54A13842014Fimpl_uses*
 //#UC END# *54A13842014Fimpl_uses*
;

function TK585940757.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.11';
end;//TK585940757.GetFolder

function TK585940757.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '54A13842014F';
end;//TK585940757.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK585940757.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
