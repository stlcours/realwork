unit K592250384;
 {* [Requestlink:592250384] }

// ������: "w:\common\components\rtl\Garant\Daily\K592250384.pas"
// ���������: "TestCase"
// ������� ������: "K592250384" MUID: (5511490D00E0)
// ��� ����: "TK592250384"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK592250384 = class(TRTFtoEVDWriterTest)
  {* [Requestlink:592250384] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK592250384
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *5511490D00E0impl_uses*
 //#UC END# *5511490D00E0impl_uses*
;

function TK592250384.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.11';
end;//TK592250384.GetFolder

function TK592250384.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '5511490D00E0';
end;//TK592250384.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK592250384.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
