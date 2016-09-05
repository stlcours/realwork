unit K541116849;
 {* [Requestlink:541116849] }

// ������: "w:\common\components\rtl\Garant\Daily\K541116849.pas"
// ���������: "TestCase"
// ������� ������: "K541116849" MUID: (5396CCA702A3)
// ��� ����: "TK541116849"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK541116849 = class(TRTFtoEVDWriterTest)
  {* [Requestlink:541116849] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK541116849
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *5396CCA702A3impl_uses*
 //#UC END# *5396CCA702A3impl_uses*
;

function TK541116849.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.10';
end;//TK541116849.GetFolder

function TK541116849.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '5396CCA702A3';
end;//TK541116849.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK541116849.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
