unit PrimStyleEditorContainer_utStyleEditorContainer_UserType;
 {* �������� ������ }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Settings\Forms\PrimStyleEditorContainer_utStyleEditorContainer_UserType.pas"
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
 {* ��������� ��� ���� ����� utStyleEditorContainer }
 utStyleEditorContainerName = 'utStyleEditorContainer';
  {* ��������� ������������� ����������������� ���� "�������� ������" }
 utStyleEditorContainer = TvcmUserType(0);
  {* �������� ������ }
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
 Tkw_FormUserType_utStyleEditorContainer = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� utStyleEditorContainer }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetInteger: Integer; override;
 end;//Tkw_FormUserType_utStyleEditorContainer
 {$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
class function Tkw_FormUserType_utStyleEditorContainer.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::utStyleEditorContainer';
end;//Tkw_FormUserType_utStyleEditorContainer.GetWordNameForRegister

function Tkw_FormUserType_utStyleEditorContainer.GetInteger: Integer;
begin
 Result := utStyleEditorContainer;
end;//Tkw_FormUserType_utStyleEditorContainer.GetInteger
{$IfEnd} // NOT Defined(NoScripts)

initialization
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_utStyleEditorContainer.RegisterInEngine;
 {* ����������� Tkw_FormUserType_utStyleEditorContainer }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
