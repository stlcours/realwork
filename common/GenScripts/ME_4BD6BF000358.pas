unit RedactionsUserTypes_utRedaction_UserType;
 {* �������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\RedactionsUserTypes_utRedaction_UserType.pas"
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
 {* ��������� ��� ���� ����� utRedaction }
 utRedactionName = 'utRedaction';
  {* ��������� ������������� ����������������� ���� "��������" }
 utRedaction = TvcmUserType(0);
  {* �������� }
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
 Tkw_FormUserType_utRedaction = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� utRedaction }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetInteger: Integer; override;
 end;//Tkw_FormUserType_utRedaction
 {$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
class function Tkw_FormUserType_utRedaction.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::utRedaction';
end;//Tkw_FormUserType_utRedaction.GetWordNameForRegister

function Tkw_FormUserType_utRedaction.GetInteger: Integer;
begin
 Result := utRedaction;
end;//Tkw_FormUserType_utRedaction.GetInteger
{$IfEnd} // NOT Defined(NoScripts)

initialization
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_utRedaction.RegisterInEngine;
 {* ����������� Tkw_FormUserType_utRedaction }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
