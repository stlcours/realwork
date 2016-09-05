unit K224788868;
 {* [RequestLink:224788868] }

// ������: "w:\common\components\rtl\Garant\Daily\K224788868.pas"
// ���������: "TestCase"
// ������� ������: "K224788868" MUID: (4C358BF70329)
// ��� ����: "TK224788868"

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
 TK224788868 = class({$If NOT Defined(NoVCM)}
 TSearchAndReplaceTest
 {$IfEnd} // NOT Defined(NoVCM)
 )
  {* [RequestLink:224788868] }
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
 end;//TK224788868
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
 //#UC START# *4C358BF70329impl_uses*
 //#UC END# *4C358BF70329impl_uses*
;

{$If NOT Defined(NoVCM)}
function TK224788868.StringForSearch: AnsiString;
 {* ������ ��� ������ }
//#UC START# *4BE051200169_4C358BF70329_var*
//#UC END# *4BE051200169_4C358BF70329_var*
begin
//#UC START# *4BE051200169_4C358BF70329_impl*
 Result := '����';
//#UC END# *4BE051200169_4C358BF70329_impl*
end;//TK224788868.StringForSearch

function TK224788868.StringForReplace: AnsiString;
 {* ������ ��� ������ }
//#UC START# *4BE0513800C9_4C358BF70329_var*
//#UC END# *4BE0513800C9_4C358BF70329_var*
begin
//#UC START# *4BE0513800C9_4C358BF70329_impl*
 Result := '��������';
//#UC END# *4BE0513800C9_4C358BF70329_impl*
end;//TK224788868.StringForReplace

function TK224788868.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK224788868.GetFolder

function TK224788868.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4C358BF70329';
end;//TK224788868.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK224788868.Suite);
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)
end.
