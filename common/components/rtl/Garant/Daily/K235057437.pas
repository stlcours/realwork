unit K235057437;
 {* [$235057437] }

// ������: "w:\common\components\rtl\Garant\Daily\K235057437.pas"
// ���������: "TestCase"
// ������� ������: "K235057437" MUID: (4CA198090396)
// ��� ����: "TK235057437"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , QueryCardAddAttributeTest
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TK235057437 = class({$If NOT Defined(NoVCM)}
 TQueryCardAddAttributeTest
 {$IfEnd} // NOT Defined(NoVCM)
 )
  {* [$235057437] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK235057437
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
 //#UC START# *4CA198090396impl_uses*
 //#UC END# *4CA198090396impl_uses*
;

{$If NOT Defined(NoVCM)}
function TK235057437.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK235057437.GetFolder

function TK235057437.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4CA198090396';
end;//TK235057437.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK235057437.Suite);
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)
end.
