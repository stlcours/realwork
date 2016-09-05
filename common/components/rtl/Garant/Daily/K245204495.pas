unit K245204495;
 {* [$245204495] }

// ������: "w:\common\components\rtl\Garant\Daily\K245204495.pas"
// ���������: "TestCase"
// ������� ������: "K245204495" MUID: (4D0097F601C2)
// ��� ����: "TK245204495"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , PreviewWithLinesTestBefore235875079
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TK245204495 = class({$If NOT Defined(NoVCM)}
 TPreviewWithLinesTestBefore235875079
 {$IfEnd} // NOT Defined(NoVCM)
 )
  {* [$245204495] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK245204495
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
 //#UC START# *4D0097F601C2impl_uses*
 //#UC END# *4D0097F601C2impl_uses*
;

{$If NOT Defined(NoVCM)}
function TK245204495.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK245204495.GetFolder

function TK245204495.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4D0097F601C2';
end;//TK245204495.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK245204495.Suite);
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)
end.
