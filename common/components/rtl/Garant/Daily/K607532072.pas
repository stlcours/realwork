unit K607532072;
 {* [Requestlink:607532072] }

// ������: "w:\common\components\rtl\Garant\Daily\K607532072.pas"
// ���������: "TestCase"
// ������� ������: "K607532072" MUID: (560159FF0323)
// ��� ����: "TK607532072"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK607532072 = class(TRTFtoEVDWriterTest)
  {* [Requestlink:607532072] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK607532072
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *560159FF0323impl_uses*
 //#UC END# *560159FF0323impl_uses*
;

function TK607532072.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.11';
end;//TK607532072.GetFolder

function TK607532072.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '560159FF0323';
end;//TK607532072.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK607532072.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
