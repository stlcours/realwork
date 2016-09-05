unit toK3;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\toK3.pas"
// ���������: "TestResults"
// ������� ������: "toK3" MUID: (552299AD006B)
// ��� ����: "TtoK3"

{$Include w:\garant6x\implementation\Garant\GbaNemesis\nsDefine.inc}

interface

{$If Defined(nsTest) AND Defined(InsiderTest) AND NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 {$If NOT Defined(NotTunedDUnit)}
 , KTestRunner
 {$IfEnd} // NOT Defined(NotTunedDUnit)
;

type
 TtoK3 = class({$If NOT Defined(NotTunedDUnit)}
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
 end;//TtoK3
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest) AND NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest) AND NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 //#UC START# *552299AD006Bimpl_uses*
 //#UC END# *552299AD006Bimpl_uses*
;

{$If NOT Defined(NotTunedDUnit)}
class function TtoK3.CommandLineKey: AnsiString;
 {* ���� ��������� ������ ��� �������� �������� ����� ������� ������ ����� ������������ ����������� }
begin
 Result := '-toK3';
end;//TtoK3.CommandLineKey

class function TtoK3.TimesPage: Integer;
 {* �������� ��� ������ ������� ������� }
//#UC START# *4B7C0B43005B_552299AD006B_var*
//#UC END# *4B7C0B43005B_552299AD006B_var*
begin
//#UC START# *4B7C0B43005B_552299AD006B_impl*
 Result := 596177470;
//#UC END# *4B7C0B43005B_552299AD006B_impl*
end;//TtoK3.TimesPage

class function TtoK3.ResultsPage: Integer;
 {* �������� ��� ������ ����������� ������ }
//#UC START# *4B7C0B670215_552299AD006B_var*
//#UC END# *4B7C0B670215_552299AD006B_var*
begin
//#UC START# *4B7C0B670215_552299AD006B_impl*
 Result := 596177465;
//#UC END# *4B7C0B670215_552299AD006B_impl*
end;//TtoK3.ResultsPage
{$IfEnd} // NOT Defined(NotTunedDUnit)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest) AND NOT Defined(Admin) AND NOT Defined(Monitorings)
end.
