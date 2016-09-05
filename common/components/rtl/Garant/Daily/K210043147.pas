unit K210043147;
 {* [RequestLink:210043147] }

// ������: "w:\common\components\rtl\Garant\Daily\K210043147.pas"
// ���������: "TestCase"
// ������� ������: "K210043147" MUID: (4BED409D03D4)
// ��� ����: "TK210043147"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , NSRCtoEVDTest
;

type
 TK210043147 = class(TNSRCtoEVDTest)
  {* [RequestLink:210043147] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK210043147
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4BED409D03D4impl_uses*
 //#UC END# *4BED409D03D4impl_uses*
;

function TK210043147.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.5';
end;//TK210043147.GetFolder

function TK210043147.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4BED409D03D4';
end;//TK210043147.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK210043147.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
