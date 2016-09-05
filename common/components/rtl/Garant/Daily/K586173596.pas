unit K586173596;
 {* [Requestlink:586173596] }

// ������: "w:\common\components\rtl\Garant\Daily\K586173596.pas"
// ���������: "TestCase"
// ������� ������: "K586173596" MUID: (54C646E4015A)
// ��� ����: "TK586173596"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , HTMLtoEVDTest
;

type
 TK586173596 = class(THTMLtoEVDTest)
  {* [Requestlink:586173596] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK586173596
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *54C646E4015Aimpl_uses*
 //#UC END# *54C646E4015Aimpl_uses*
;

function TK586173596.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.11';
end;//TK586173596.GetFolder

function TK586173596.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '54C646E4015A';
end;//TK586173596.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK586173596.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
