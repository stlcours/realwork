unit PrimSettings_cutSettings_UserType;
 {* ��������� ������������ }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Settings\Forms\PrimSettings_cutSettings_UserType.pas"
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
 {* ��������� ��� ���� ����� cutSettings }
 cutSettingsName = 'cutSettings';
  {* ��������� ������������� ����������������� ���� "��������� ������������" }
 cutSettings = TvcmUserType(0);
  {* ��������� ������������ }
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
 Tkw_FormUserType_cutSettings = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� cutSettings }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetInteger: Integer; override;
 end;//Tkw_FormUserType_cutSettings
 {$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
class function Tkw_FormUserType_cutSettings.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::cutSettings';
end;//Tkw_FormUserType_cutSettings.GetWordNameForRegister

function Tkw_FormUserType_cutSettings.GetInteger: Integer;
begin
 Result := cutSettings;
end;//Tkw_FormUserType_cutSettings.GetInteger
{$IfEnd} // NOT Defined(NoScripts)

initialization
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_cutSettings.RegisterInEngine;
 {* ����������� Tkw_FormUserType_cutSettings }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
