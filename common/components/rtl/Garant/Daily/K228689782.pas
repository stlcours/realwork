unit K228689782;
 {* [$228689782] }

// ������: "w:\common\components\rtl\Garant\Daily\K228689782.pas"
// ���������: "TestCase"
// ������� ������: "K228689782" MUID: (4C5FAB6C00EE)
// ��� ����: "TK228689782"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , PreviewTestBefore235875079
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TK228689782 = class({$If NOT Defined(NoVCM)}
 TPreviewTestBefore235875079
 {$IfEnd} // NOT Defined(NoVCM)
 )
  {* [$228689782] }
  protected
   {$If NOT Defined(NoVCM)}
   function GetNormalFontSize: Integer; override;
    {* ���������� ������ ������ ����� "����������". 0 - ��-��������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If Defined(XE) AND NOT Defined(NotTunedDUnit)}
   function EtalonNeedsXE: Boolean; override;
   {$IfEnd} // Defined(XE) AND NOT Defined(NotTunedDUnit)
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK228689782
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
 //#UC START# *4C5FAB6C00EEimpl_uses*
 //#UC END# *4C5FAB6C00EEimpl_uses*
;

{$If NOT Defined(NoVCM)}
function TK228689782.GetNormalFontSize: Integer;
 {* ���������� ������ ������ ����� "����������". 0 - ��-��������� }
//#UC START# *4C07AC6F036D_4C5FAB6C00EE_var*
//#UC END# *4C07AC6F036D_4C5FAB6C00EE_var*
begin
//#UC START# *4C07AC6F036D_4C5FAB6C00EE_impl*
 Result := 12;
//#UC END# *4C07AC6F036D_4C5FAB6C00EE_impl*
end;//TK228689782.GetNormalFontSize

{$If Defined(XE) AND NOT Defined(NotTunedDUnit)}
function TK228689782.EtalonNeedsXE: Boolean;
//#UC START# *51AF49E5001B_4C5FAB6C00EE_var*
//#UC END# *51AF49E5001B_4C5FAB6C00EE_var*
begin
//#UC START# *51AF49E5001B_4C5FAB6C00EE_impl*
 Result := true;
//#UC END# *51AF49E5001B_4C5FAB6C00EE_impl*
end;//TK228689782.EtalonNeedsXE
{$IfEnd} // Defined(XE) AND NOT Defined(NotTunedDUnit)

function TK228689782.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK228689782.GetFolder

function TK228689782.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4C5FAB6C00EE';
end;//TK228689782.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK228689782.Suite);
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)
end.
