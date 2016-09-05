unit K336662790;
 {* [Requestlink:336662790] }

// ������: "w:\common\components\rtl\Garant\Daily\K336662790.pas"
// ���������: "TestCase"
// ������� ������: "K336662790" MUID: (516E5DF3029A)
// ��� ����: "TK336662790"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , HTMLtoEVDTest
;

type
 TK336662790 = class(THTMLtoEVDTest)
  {* [Requestlink:336662790] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK336662790
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *516E5DF3029Aimpl_uses*
 //#UC END# *516E5DF3029Aimpl_uses*
;

function TK336662790.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.8';
end;//TK336662790.GetFolder

function TK336662790.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '516E5DF3029A';
end;//TK336662790.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK336662790.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
