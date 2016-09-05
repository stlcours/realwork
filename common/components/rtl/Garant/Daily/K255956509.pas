unit K255956509;
 {* [$255956509] }

// ������: "w:\common\components\rtl\Garant\Daily\K255956509.pas"
// ���������: "TestCase"
// ������� ������: "K255956509" MUID: (4D720C39027F)
// ��� ����: "TK255956509"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , ScrollParamsTest
;

type
 TK255956509 = class(TScrollParamsTest)
  {* [$255956509] }
  protected
   function GetSubNumber: Integer; override;
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK255956509
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
 //#UC START# *4D720C39027Fimpl_uses*
 //#UC END# *4D720C39027Fimpl_uses*
;

function TK255956509.GetSubNumber: Integer;
//#UC START# *4D7211F7018C_4D720C39027F_var*
//#UC END# *4D7211F7018C_4D720C39027F_var*
begin
//#UC START# *4D7211F7018C_4D720C39027F_impl*
 Result := 20021;
//#UC END# *4D7211F7018C_4D720C39027F_impl*
end;//TK255956509.GetSubNumber

function TK255956509.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.7';
end;//TK255956509.GetFolder

function TK255956509.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4D720C39027F';
end;//TK255956509.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK255956509.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
