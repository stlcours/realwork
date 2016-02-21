unit nsConfigurationProperties;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Config\nsConfigurationProperties.pas"
// ���������: "SimpleClass"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , vcmStringList
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TnsConfigurationProperties = class(TvcmStringList{$If NOT Defined(NoVCM)}
 , IvcmStrings
 {$IfEnd} // NOT Defined(NoVCM)
 )
  public
   class function HasInstance: Boolean;
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
   class function Instance: TnsConfigurationProperties;
    {* ����� ��������� ���������� ���������� TnsConfigurationProperties }
 end;//TnsConfigurationProperties
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , SysUtils
 , l3Base
;

var g_TnsConfigurationProperties: TnsConfigurationProperties = nil;
 {* ��������� ���������� TnsConfigurationProperties }

procedure TnsConfigurationPropertiesFree;
 {* ����� ������������ ���������� ���������� TnsConfigurationProperties }
begin
 l3Free(g_TnsConfigurationProperties);
end;//TnsConfigurationPropertiesFree

class function TnsConfigurationProperties.HasInstance: Boolean;
//#UC START# *5231A23D03D2_5231A17601FD_var*
//#UC END# *5231A23D03D2_5231A17601FD_var*
begin
//#UC START# *5231A23D03D2_5231A17601FD_impl*
 Result := Assigned(g_TnsConfigurationProperties);
//#UC END# *5231A23D03D2_5231A17601FD_impl*
end;//TnsConfigurationProperties.HasInstance

class function TnsConfigurationProperties.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TnsConfigurationProperties <> nil;
end;//TnsConfigurationProperties.Exists

class function TnsConfigurationProperties.Instance: TnsConfigurationProperties;
 {* ����� ��������� ���������� ���������� TnsConfigurationProperties }
begin
 if (g_TnsConfigurationProperties = nil) then
 begin
  l3System.AddExitProc(TnsConfigurationPropertiesFree);
  g_TnsConfigurationProperties := Create;
 end;
 Result := g_TnsConfigurationProperties;
end;//TnsConfigurationProperties.Instance
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
