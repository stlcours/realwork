unit K177963362;
 {* [$177963362] }

// ������: "w:\common\components\rtl\Garant\Daily\K177963362.pas"
// ���������: "TestCase"
// ������� ������: "K177963362" MUID: (4B59DEB30238)
// ��� ����: "TK177963362"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoNSRCPlusWriterTest
;

type
 TK177963362 = class(TEVDtoNSRCPlusWriterTest)
  {* [$177963362] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK177963362
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4B59DEB30238impl_uses*
 //#UC END# *4B59DEB30238impl_uses*
;

function TK177963362.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'NSRCTests';
end;//TK177963362.GetFolder

function TK177963362.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4B59DEB30238';
end;//TK177963362.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK177963362.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
