unit toKT;

// ������: "w:\archi\source\projects\Everest\Lite\7.0\Express\toKT.pas"
// ���������: "TestResults"
// ������� ������: "toKT" MUID: (53F312A7027C)
// ��� ����: "TtoKT"

{$Include w:\archi\source\projects\Everest\Lite\7.0\Express\EverestLite.inc}

interface

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3IntfUses
 {$If NOT Defined(NotTunedDUnit)}
 , KTestRunner
 {$IfEnd} // NOT Defined(NotTunedDUnit)
;

type
 TtoKT = class({$If NOT Defined(NotTunedDUnit)}
 TTestResultsPlace
 {$IfEnd} // NOT Defined(NotTunedDUnit)
 )
  public
   {$If NOT Defined(NotTunedDUnit)}
   class function CommandLineKey: AnsiString; override;
    {* ���� ��������� ������ ��� �������� �������� ����� ������� ������ ����� ������������ ����������� }
   {$IfEnd} // NOT Defined(NotTunedDUnit)
   {$If NOT Defined(NotTunedDUnit)}
   class function TimesPage: Integer; override;
    {* �������� ��� ������ ������� ������� }
   {$IfEnd} // NOT Defined(NotTunedDUnit)
   {$If NOT Defined(NotTunedDUnit)}
   class function ResultsPage: Integer; override;
    {* �������� ��� ������ ����������� ������ }
   {$IfEnd} // NOT Defined(NotTunedDUnit)
 end;//TtoKT
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 //#UC START# *53F312A7027Cimpl_uses*
 //#UC END# *53F312A7027Cimpl_uses*
;

{$If NOT Defined(NotTunedDUnit)}
class function TtoKT.CommandLineKey: AnsiString;
 {* ���� ��������� ������ ��� �������� �������� ����� ������� ������ ����� ������������ ����������� }
begin
 Result := '-toKT';
end;//TtoKT.CommandLineKey

class function TtoKT.TimesPage: Integer;
 {* �������� ��� ������ ������� ������� }
//#UC START# *4B7C0B43005B_53F312A7027C_var*
//#UC END# *4B7C0B43005B_53F312A7027C_var*
begin
//#UC START# *4B7C0B43005B_53F312A7027C_impl*
 Result := 562617404;
//#UC END# *4B7C0B43005B_53F312A7027C_impl*
end;//TtoKT.TimesPage

class function TtoKT.ResultsPage: Integer;
 {* �������� ��� ������ ����������� ������ }
//#UC START# *4B7C0B670215_53F312A7027C_var*
//#UC END# *4B7C0B670215_53F312A7027C_var*
begin
//#UC START# *4B7C0B670215_53F312A7027C_impl*
 Result := 562617393;
//#UC END# *4B7C0B670215_53F312A7027C_impl*
end;//TtoKT.ResultsPage
{$IfEnd} // NOT Defined(NotTunedDUnit)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
