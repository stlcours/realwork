unit K531975039;
 {* [Requestlink:531975039] }

// ������: "w:\common\components\rtl\Garant\Daily\K531975039.pas"
// ���������: "TestCase"
// ������� ������: "K531975039" MUID: (535A4B940172)
// ��� ����: "TK531975039"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK531975039 = class(TRTFtoEVDWriterTest)
  {* [Requestlink:531975039] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK531975039
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *535A4B940172impl_uses*
 //#UC END# *535A4B940172impl_uses*
;

function TK531975039.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.10';
end;//TK531975039.GetFolder

function TK531975039.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '535A4B940172';
end;//TK531975039.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK531975039.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
