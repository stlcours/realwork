unit K288787848;
 {* [Requestlink:288787848] }

// ������: "w:\common\components\rtl\Garant\Daily\K288787848.pas"
// ���������: "TestCase"
// ������� ������: "K288787848" MUID: (4E8ED6D1012B)
// ��� ����: "TK288787848"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , PreviewTest
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TK288787848 = class({$If NOT Defined(NoVCM)}
 TPreviewTest
 {$IfEnd} // NOT Defined(NoVCM)
 )
  {* [Requestlink:288787848] }
  protected
   {$If NOT Defined(NoVCM)}
   function GetNormalFontSize: Integer; override;
    {* ���������� ������ ������ ����� "����������". 0 - ��-��������� }
   {$IfEnd} // NOT Defined(NoVCM)
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK288787848
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
 //#UC START# *4E8ED6D1012Bimpl_uses*
 //#UC END# *4E8ED6D1012Bimpl_uses*
;

{$If NOT Defined(NoVCM)}
function TK288787848.GetNormalFontSize: Integer;
 {* ���������� ������ ������ ����� "����������". 0 - ��-��������� }
//#UC START# *4C07AC6F036D_4E8ED6D1012B_var*
//#UC END# *4C07AC6F036D_4E8ED6D1012B_var*
begin
//#UC START# *4C07AC6F036D_4E8ED6D1012B_impl*
 Result := 30;
//#UC END# *4C07AC6F036D_4E8ED6D1012B_impl*
end;//TK288787848.GetNormalFontSize

function TK288787848.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.7';
end;//TK288787848.GetFolder

function TK288787848.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4E8ED6D1012B';
end;//TK288787848.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK288787848.Suite);
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)
end.
