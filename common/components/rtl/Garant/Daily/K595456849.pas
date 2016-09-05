unit K595456849;
 {* [Requestlink:595456849] }

// ������: "w:\common\components\rtl\Garant\Daily\K595456849.pas"
// ���������: "TestCase"
// ������� ������: "K595456849" MUID: (551D02BB038E)
// ��� ����: "TK595456849"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK595456849 = class(TRTFtoEVDWriterTest)
  {* [Requestlink:595456849] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK595456849
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *551D02BB038Eimpl_uses*
 //#UC END# *551D02BB038Eimpl_uses*
;

function TK595456849.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.11';
end;//TK595456849.GetFolder

function TK595456849.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '551D02BB038E';
end;//TK595456849.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK595456849.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
