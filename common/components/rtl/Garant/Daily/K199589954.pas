unit K199589954;
 {* [$199590833] }

// ������: "w:\common\components\rtl\Garant\Daily\K199589954.pas"
// ���������: "TestCase"
// ������� ������: "K199589954" MUID: (4BAC93DD0328)
// ��� ����: "TK199589954"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoBothNSRCWriterTest
;

type
 TK199589954 = class(TEVDtoBothNSRCWriterTest)
  {* [$199590833] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK199589954
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4BAC93DD0328impl_uses*
 //#UC END# *4BAC93DD0328impl_uses*
;

function TK199589954.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.5';
end;//TK199589954.GetFolder

function TK199589954.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4BAC93DD0328';
end;//TK199589954.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK199589954.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
