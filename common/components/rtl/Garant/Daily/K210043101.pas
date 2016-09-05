unit K210043101;
 {* [RequestLink:210043101] }

// ������: "w:\common\components\rtl\Garant\Daily\K210043101.pas"
// ���������: "TestCase"
// ������� ������: "K210043101" MUID: (4BE2BC4900C7)
// ��� ����: "TK210043101"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoBothNSRCWriterTest
;

type
 TK210043101 = class(TEVDtoBothNSRCWriterTest)
  {* [RequestLink:210043101] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK210043101
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4BE2BC4900C7impl_uses*
 //#UC END# *4BE2BC4900C7impl_uses*
;

function TK210043101.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.5';
end;//TK210043101.GetFolder

function TK210043101.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4BE2BC4900C7';
end;//TK210043101.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK210043101.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
