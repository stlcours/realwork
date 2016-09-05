unit K616564654;
 {* [Requestlink:616564654] }

// ������: "w:\common\components\rtl\Garant\Daily\K616564654.pas"
// ���������: "TestCase"
// ������� ������: "K616564654" MUID: (56A9DCBB0258)
// ��� ����: "TK616564654"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , HTMLtoEVDWithURLTest
;

type
 TK616564654 = class(THTMLtoEVDWithURLTest)
  {* [Requestlink:616564654] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK616564654
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *56A9DCBB0258impl_uses*
 //#UC END# *56A9DCBB0258impl_uses*
;

function TK616564654.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.12';
end;//TK616564654.GetFolder

function TK616564654.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '56A9DCBB0258';
end;//TK616564654.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK616564654.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
