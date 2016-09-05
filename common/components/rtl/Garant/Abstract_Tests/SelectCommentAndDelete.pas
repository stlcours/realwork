unit SelectCommentAndDelete;
 {* �������� ����������� � �������. }

// ������: "w:\common\components\rtl\Garant\Abstract_Tests\SelectCommentAndDelete.pas"
// ���������: "TestCase"
// ������� ������: "TSelectCommentAndDelete" MUID: (4DD5FF50028A)

{$Include w:\common\components\rtl\Garant\Abstract_Tests\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , TextViaEditorProcessor
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , PrimTextLoad_Form
 {$IfEnd} // NOT Defined(NoVCM)
 , evCustomEditorWindow
;

type
 _SelectOperation_Parent_ = TTextViaEditorProcessor;
 {$Include w:\common\components\gui\Garant\Everest\EditorUsers\SelectOperation.imp.pas}
 TSelectCommentAndDelete = {abstract} class(_SelectOperation_)
  {* �������� ����������� � �������. }
  protected
   {$If NOT Defined(NoVCM)}
   procedure Process(aForm: TPrimTextLoadForm); override;
    {* ���������� ������� ��������� ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TSelectCommentAndDelete
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , evTypes
 , TestFrameWork
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 , SysUtils
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 , l3Base
 //#UC START# *4DD5FF50028Aimpl_uses*
 //#UC END# *4DD5FF50028Aimpl_uses*
;

{$If NOT Defined(NoVCM)}
{$Include w:\common\components\gui\Garant\Everest\EditorUsers\SelectOperation.imp.pas}

procedure TSelectCommentAndDelete.Process(aForm: TPrimTextLoadForm);
 {* ���������� ������� ��������� ������ }
//#UC START# *4BE13147032C_4DD5FF50028A_var*
//#UC END# *4BE13147032C_4DD5FF50028A_var*
begin
//#UC START# *4BE13147032C_4DD5FF50028A_impl*
 SelectPara(aForm.Text);
 aForm.Text.Range.Delete;
//#UC END# *4BE13147032C_4DD5FF50028A_impl*
end;//TSelectCommentAndDelete.Process

function TSelectCommentAndDelete.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'EditorTests';
end;//TSelectCommentAndDelete.GetFolder

function TSelectCommentAndDelete.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4DD5FF50028A';
end;//TSelectCommentAndDelete.GetModelElementGUID
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)
end.
