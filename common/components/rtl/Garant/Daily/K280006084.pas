unit K280006084;
 {* [RequestLink:280006084] }

// ������: "w:\common\components\rtl\Garant\Daily\K280006084.pas"
// ���������: "TestCase"
// ������� ������: "K280006084" MUID: (4E5CF4110320)
// ��� ����: "TK280006084"

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
 TK280006084 = class({$If NOT Defined(NoVCM)}
 TPreviewTest
 {$IfEnd} // NOT Defined(NoVCM)
 )
  {* [RequestLink:280006084] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK280006084
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
 //#UC START# *4E5CF4110320impl_uses*
 //#UC END# *4E5CF4110320impl_uses*
;

{$If NOT Defined(NoVCM)}
function TK280006084.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.7 Lulin';
end;//TK280006084.GetFolder

function TK280006084.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4E5CF4110320';
end;//TK280006084.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK280006084.Suite);
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)
end.
