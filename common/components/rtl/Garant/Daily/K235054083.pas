unit K235054083;
 {* [RequestLink:235054083]. }

// ������: "w:\common\components\rtl\Garant\Daily\K235054083.pas"
// ���������: "TestCase"
// ������� ������: "K235054083" MUID: (4C9884370188)
// ��� ����: "TK235054083"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoBothNSRCWriterTest
;

type
 TK235054083 = class(TEVDtoBothNSRCWriterTest)
  {* [RequestLink:235054083]. }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK235054083
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4C9884370188impl_uses*
 //#UC END# *4C9884370188impl_uses*
;

function TK235054083.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK235054083.GetFolder

function TK235054083.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4C9884370188';
end;//TK235054083.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK235054083.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
