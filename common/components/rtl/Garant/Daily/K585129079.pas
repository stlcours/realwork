unit K585129079;
 {* [RequestLink:585129079] }

// ������: "w:\common\components\rtl\Garant\Daily\K585129079.pas"
// ���������: "TestCase"
// ������� ������: "K585129079" MUID: (54919A8E036E)
// ��� ����: "TK585129079"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK585129079 = class(TRTFtoEVDWriterTest)
  {* [RequestLink:585129079] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK585129079
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *54919A8E036Eimpl_uses*
 //#UC END# *54919A8E036Eimpl_uses*
;

function TK585129079.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.11';
end;//TK585129079.GetFolder

function TK585129079.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '54919A8E036E';
end;//TK585129079.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK585129079.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
