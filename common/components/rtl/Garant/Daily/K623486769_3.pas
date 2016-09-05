unit K623486769_3;
 {* [Requestlink:623486769] }

// ������: "w:\common\components\rtl\Garant\Daily\K623486769_3.pas"
// ���������: "TestCase"
// ������� ������: "K623486769_3" MUID: (574EAF960308)
// ��� ����: "TK623486769_3"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoHTMLWithExternalHyperlinks
;

type
 TK623486769_3 = class(TEVDtoHTMLWithExternalHyperlinks)
  {* [Requestlink:623486769] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK623486769_3
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *574EAF960308impl_uses*
 //#UC END# *574EAF960308impl_uses*
;

function TK623486769_3.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '8.0';
end;//TK623486769_3.GetFolder

function TK623486769_3.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '574EAF960308';
end;//TK623486769_3.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK623486769_3.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
