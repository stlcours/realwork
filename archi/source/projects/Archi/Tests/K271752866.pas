unit K271752866;
 {* [$271752866] }

// ������: "w:\archi\source\projects\Archi\Tests\K271752866.pas"
// ���������: "TestCase"
// ������� ������: "K271752866" MUID: (4E0B1450017E)
// ��� ����: "TK271752866"

{$Include w:\archi\source\projects\Archi\arDefine.inc}

interface

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3IntfUses
 {$If NOT Defined(NoScripts)}
 , ArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
;

type
 TK271752866 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [$271752866] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK271752866
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4E0B1450017Eimpl_uses*
 //#UC END# *4E0B1450017Eimpl_uses*
;

{$If NOT Defined(NoScripts)}
function TK271752866.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'ContentsTree';
end;//TK271752866.GetFolder

function TK271752866.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4E0B1450017E';
end;//TK271752866.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK271752866.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
