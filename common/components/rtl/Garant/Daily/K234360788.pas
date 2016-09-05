unit K234360788;
 {* [RequestLink:234360788] }

// ������: "w:\common\components\rtl\Garant\Daily\K234360788.pas"
// ���������: "TestCase"
// ������� ������: "K234360788" MUID: (4CA30BDC0246)
// ��� ����: "TK234360788"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , DeleteCharTest
;

type
 TK234360788 = class(TDeleteCharTest)
  {* [RequestLink:234360788] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK234360788
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
 //#UC START# *4CA30BDC0246impl_uses*
 //#UC END# *4CA30BDC0246impl_uses*
;

function TK234360788.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK234360788.GetFolder

function TK234360788.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4CA30BDC0246';
end;//TK234360788.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK234360788.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
