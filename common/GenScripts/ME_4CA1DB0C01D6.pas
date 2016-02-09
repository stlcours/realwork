unit K235060094;
 {* [$235060094] }

// ������: "w:\common\components\rtl\Garant\Daily\K235060094.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , ScrollBackByLineTest
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TK235060094 = class(TScrollBackByLineTest)
  {* [$235060094] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK235060094
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

function TK235060094.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK235060094.GetFolder

function TK235060094.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4CA1DB0C01D6';
end;//TK235060094.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK235060094.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
