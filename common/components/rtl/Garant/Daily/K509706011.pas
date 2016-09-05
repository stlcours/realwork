unit K509706011;
 {* [RequestLink:509706011] }

// ������: "w:\common\components\rtl\Garant\Daily\K509706011.pas"
// ���������: "TestCase"
// ������� ������: "K509706011" MUID: (52BABA7D0004)
// ��� ����: "TK509706011"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoRTFRender
;

type
 TK509706011 = class(TEVDtoRTFRender)
  {* [RequestLink:509706011] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK509706011
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *52BABA7D0004impl_uses*
 //#UC END# *52BABA7D0004impl_uses*
;

function TK509706011.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.10';
end;//TK509706011.GetFolder

function TK509706011.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '52BABA7D0004';
end;//TK509706011.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK509706011.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
