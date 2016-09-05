unit K210438353;
 {* [RequestLink:210438353] }

// ������: "w:\common\components\rtl\Garant\Daily\K210438353.pas"
// ���������: "TestCase"
// ������� ������: "K210438353" MUID: (4BE941A70019)
// ��� ����: "TK210438353"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoNSRCPlusWriterTest
;

type
 TK210438353 = class(TEVDtoNSRCPlusWriterTest)
  {* [RequestLink:210438353] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK210438353
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4BE941A70019impl_uses*
 //#UC END# *4BE941A70019impl_uses*
;

function TK210438353.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.5';
end;//TK210438353.GetFolder

function TK210438353.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4BE941A70019';
end;//TK210438353.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK210438353.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
