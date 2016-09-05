unit K209584437;
 {* [RequestLink:209584437] }

// ������: "w:\common\components\rtl\Garant\Daily\K209584437.pas"
// ���������: "TestCase"
// ������� ������: "K209584437" MUID: (4BE122870343)
// ��� ����: "TK209584437"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , SearchAndReplaceTest
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TK209584437 = class({$If NOT Defined(NoVCM)}
 TSearchAndReplaceTest
 {$IfEnd} // NOT Defined(NoVCM)
 )
  {* [RequestLink:209584437] }
  protected
   {$If NOT Defined(NoVCM)}
   function StringForSearch: AnsiString; override;
    {* ������ ��� ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function StringForReplace: AnsiString; override;
    {* ������ ��� ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK209584437
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
 //#UC START# *4BE122870343impl_uses*
 //#UC END# *4BE122870343impl_uses*
;

{$If NOT Defined(NoVCM)}
function TK209584437.StringForSearch: AnsiString;
 {* ������ ��� ������ }
//#UC START# *4BE051200169_4BE122870343_var*
//#UC END# *4BE051200169_4BE122870343_var*
begin
//#UC START# *4BE051200169_4BE122870343_impl*
 Result := '�������������';
//#UC END# *4BE051200169_4BE122870343_impl*
end;//TK209584437.StringForSearch

function TK209584437.StringForReplace: AnsiString;
 {* ������ ��� ������ }
//#UC START# *4BE0513800C9_4BE122870343_var*
//#UC END# *4BE0513800C9_4BE122870343_var*
begin
//#UC START# *4BE0513800C9_4BE122870343_impl*
 Result := 'XXX';
//#UC END# *4BE0513800C9_4BE122870343_impl*
end;//TK209584437.StringForReplace

function TK209584437.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.5';
end;//TK209584437.GetFolder

function TK209584437.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4BE122870343';
end;//TK209584437.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK209584437.Suite);
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)
end.
