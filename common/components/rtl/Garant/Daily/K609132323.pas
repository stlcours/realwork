unit K609132323;
 {* [Requestlink:609132323] }

// ������: "w:\common\components\rtl\Garant\Daily\K609132323.pas"
// ���������: "TestCase"
// ������� ������: "K609132323" MUID: (5628F8C0018F)
// ��� ����: "TK609132323"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK609132323 = class(TRTFtoEVDWriterTest)
  {* [Requestlink:609132323] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK609132323
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *5628F8C0018Fimpl_uses*
 //#UC END# *5628F8C0018Fimpl_uses*
;

function TK609132323.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.12';
end;//TK609132323.GetFolder

function TK609132323.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '5628F8C0018F';
end;//TK609132323.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK609132323.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
