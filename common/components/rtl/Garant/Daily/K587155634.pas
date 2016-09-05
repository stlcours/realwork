unit K587155634;
 {* [Requestlink:587155634] }

// ������: "w:\common\components\rtl\Garant\Daily\K587155634.pas"
// ���������: "TestCase"
// ������� ������: "K587155634" MUID: (54CB4A7A00D6)
// ��� ����: "TK587155634"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , HTMLtoEVDTest
;

type
 TK587155634 = class(THTMLtoEVDTest)
  {* [Requestlink:587155634] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK587155634
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *54CB4A7A00D6impl_uses*
 //#UC END# *54CB4A7A00D6impl_uses*
;

function TK587155634.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.11';
end;//TK587155634.GetFolder

function TK587155634.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '54CB4A7A00D6';
end;//TK587155634.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK587155634.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
