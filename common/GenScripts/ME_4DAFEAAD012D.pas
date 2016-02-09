unit InsertFormulaTest;
 {* ���� �� ������� �������. }

// ������: "w:\common\components\rtl\Garant\Abstract_Tests\InsertFormulaTest.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

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
;

type
 TInsertFormulaTest = {abstract} class(TTextViaEditorProcessor)
  {* ���� �� ������� �������. }
  protected
   function GetFormulaText: AnsiString; virtual; abstract;
   {$If NOT Defined(NoVCM)}
   procedure Process(aForm: TPrimTextLoadForm); override;
    {* ���������� ������� ��������� ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TInsertFormulaTest
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

{$If NOT Defined(NoVCM)}
procedure TInsertFormulaTest.Process(aForm: TPrimTextLoadForm);
 {* ���������� ������� ��������� ������ }
//#UC START# *4BE13147032C_4DAFEAAD012D_var*
//#UC END# *4BE13147032C_4DAFEAAD012D_var*
begin
//#UC START# *4BE13147032C_4DAFEAAD012D_impl*
 aForm.Text.InsertFormula(GetFormulaText);
//#UC END# *4BE13147032C_4DAFEAAD012D_impl*
end;//TInsertFormulaTest.Process
{$IfEnd} // NOT Defined(NoVCM)

function TInsertFormulaTest.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'EditorTests';
end;//TInsertFormulaTest.GetFolder

function TInsertFormulaTest.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4DAFEAAD012D';
end;//TInsertFormulaTest.GetModelElementGUID
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
