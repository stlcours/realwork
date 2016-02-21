unit StartupTips_ut_StartupTips_UserType;
 {* ����� ��� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\DayTips\Forms\StartupTips_ut_StartupTips_UserType.pas"
// ���������: "UserType"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , vcmUserControls
 {$IfEnd} // NOT Defined(NoVCM)
;

const
 {* ��������� ��� ���� ����� ut_StartupTips }
 ut_StartupTipsName = 'ut_StartupTips';
  {* ��������� ������������� ����������������� ���� "����� ���" }
 ut_StartupTips = TvcmUserType(0);
  {* ����� ��� }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , tfwInteger
 {$IfEnd} // NOT Defined(NoScripts)
;

type
 {$If NOT Defined(NoScripts)}
 Tkw_FormUserType_ut_StartupTips = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� ut_StartupTips }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetInteger: Integer; override;
 end;//Tkw_FormUserType_ut_StartupTips
 {$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
class function Tkw_FormUserType_ut_StartupTips.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::ut_StartupTips';
end;//Tkw_FormUserType_ut_StartupTips.GetWordNameForRegister

function Tkw_FormUserType_ut_StartupTips.GetInteger: Integer;
begin
 Result := ut_StartupTips;
end;//Tkw_FormUserType_ut_StartupTips.GetInteger
{$IfEnd} // NOT Defined(NoScripts)

initialization
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_ut_StartupTips.RegisterInEngine;
 {* ����������� Tkw_FormUserType_ut_StartupTips }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
