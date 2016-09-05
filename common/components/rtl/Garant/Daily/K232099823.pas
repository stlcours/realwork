unit K232099823;
 {* [RequestLink:232099823] }

// ������: "w:\common\components\rtl\Garant\Daily\K232099823.pas"
// ���������: "TestCase"
// ������� ������: "K232099823" MUID: (4C68FC100016)
// ��� ����: "TK232099823"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoNSRCPlusWriterTest
;

type
 TK232099823 = class(TEVDtoNSRCPlusWriterTest)
  {* [RequestLink:232099823] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK232099823
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4C68FC100016impl_uses*
 //#UC END# *4C68FC100016impl_uses*
;

function TK232099823.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK232099823.GetFolder

function TK232099823.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4C68FC100016';
end;//TK232099823.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK232099823.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
