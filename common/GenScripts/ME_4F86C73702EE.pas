unit K337510841;
 {* [Requestlink:337510841] }

// ������: "w:\common\components\rtl\Garant\Daily\K337510841.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , ScrollBackTest
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TK337510841 = class(TScrollBackTest)
  {* [Requestlink:337510841] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK337510841
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 , SysUtils
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 , l3Base
;

function TK337510841.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.8';
end;//TK337510841.GetFolder

function TK337510841.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F86C73702EE';
end;//TK337510841.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK337510841.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
