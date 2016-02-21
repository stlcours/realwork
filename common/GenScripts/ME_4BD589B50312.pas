unit ListUserTypes_lftConsultation_UserType;
 {* ������������ }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\ListUserTypes_lftConsultation_UserType.pas"
// ���������: "UserType"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , ListUserTypes_lftUserCR2_UserType
 {$If NOT Defined(NoVCM)}
 , vcmUserControls
 {$IfEnd} // NOT Defined(NoVCM)
;

const
 {* ��������� ��� ���� ����� lftConsultation }
 lftConsultationName = 'lftConsultation';
  {* ��������� ������������� ����������������� ���� "������������" }
 lftConsultation = TvcmUserType(lftUserCR2 + 1);
  {* ������������ }
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
 Tkw_FormUserType_lftConsultation = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� lftConsultation }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetInteger: Integer; override;
 end;//Tkw_FormUserType_lftConsultation
 {$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
class function Tkw_FormUserType_lftConsultation.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::lftConsultation';
end;//Tkw_FormUserType_lftConsultation.GetWordNameForRegister

function Tkw_FormUserType_lftConsultation.GetInteger: Integer;
begin
 Result := lftConsultation;
end;//Tkw_FormUserType_lftConsultation.GetInteger
{$IfEnd} // NOT Defined(NoScripts)

initialization
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_lftConsultation.RegisterInEngine;
 {* ����������� Tkw_FormUserType_lftConsultation }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
