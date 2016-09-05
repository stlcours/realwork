unit K590774242;
 {* [Requestlink:590774242] }

// ������: "w:\common\components\rtl\Garant\Daily\K590774242.pas"
// ���������: "TestCase"
// ������� ������: "K590774242" MUID: (5509207E0200)
// ��� ����: "TK590774242"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK590774242 = class(TRTFtoEVDWriterTest)
  {* [Requestlink:590774242] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK590774242
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *5509207E0200impl_uses*
 //#UC END# *5509207E0200impl_uses*
;

function TK590774242.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.11';
end;//TK590774242.GetFolder

function TK590774242.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '5509207E0200';
end;//TK590774242.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK590774242.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
