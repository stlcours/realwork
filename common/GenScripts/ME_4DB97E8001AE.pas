unit BaloonWarningUserTypes_remListFiltered_UserType;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\BaloonWarningUserTypes_remListFiltered_UserType.pas"
// ���������: "UserType"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , BaloonWarningUserTypes_remListModified_UserType
 , BaloonWarningUserTypes_Fake_UserType
 {$If NOT Defined(NoVCM)}
 , vcmUserControls
 {$IfEnd} // NOT Defined(NoVCM)
;

const
 {* ��������� ��� ���� ����� remListFiltered }
 remListFilteredName = 'remListFiltered';
  {* ��������� ������������� ����������������� ���� "" }
 remListFiltered = TvcmUserType(remListModified + 1);
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
 Tkw_FormUserType_remListFiltered = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� remListFiltered }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetInteger: Integer; override;
 end;//Tkw_FormUserType_remListFiltered
 {$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
class function Tkw_FormUserType_remListFiltered.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::remListFiltered';
end;//Tkw_FormUserType_remListFiltered.GetWordNameForRegister

function Tkw_FormUserType_remListFiltered.GetInteger: Integer;
begin
 Result := remListFiltered;
end;//Tkw_FormUserType_remListFiltered.GetInteger
{$IfEnd} // NOT Defined(NoScripts)

initialization
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_remListFiltered.RegisterInEngine;
 {* ����������� Tkw_FormUserType_remListFiltered }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
