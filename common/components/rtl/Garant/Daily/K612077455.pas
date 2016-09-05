unit K612077455;
 {* [Requestlink:612077455] }

// ������: "w:\common\components\rtl\Garant\Daily\K612077455.pas"
// ���������: "TestCase"
// ������� ������: "K612077455" MUID: (565457BD01C9)
// ��� ����: "TK612077455"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK612077455 = class(TRTFtoEVDWriterTest)
  {* [Requestlink:612077455] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK612077455
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *565457BD01C9impl_uses*
 //#UC END# *565457BD01C9impl_uses*
;

function TK612077455.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.12';
end;//TK612077455.GetFolder

function TK612077455.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '565457BD01C9';
end;//TK612077455.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK612077455.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
