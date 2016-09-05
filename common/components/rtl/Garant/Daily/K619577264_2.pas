unit K619577264_2;
 {* [RequestLink:619577264] }

// ������: "w:\common\components\rtl\Garant\Daily\K619577264_2.pas"
// ���������: "TestCase"
// ������� ������: "K619577264_2" MUID: (56E6C0F4021C)
// ��� ����: "TK619577264_2"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoBothNSRCWriterTest
;

type
 TK619577264_2 = class(TEVDtoBothNSRCWriterTest)
  {* [RequestLink:619577264] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK619577264_2
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *56E6C0F4021Cimpl_uses*
 //#UC END# *56E6C0F4021Cimpl_uses*
;

function TK619577264_2.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.12';
end;//TK619577264_2.GetFolder

function TK619577264_2.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '56E6C0F4021C';
end;//TK619577264_2.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK619577264_2.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
