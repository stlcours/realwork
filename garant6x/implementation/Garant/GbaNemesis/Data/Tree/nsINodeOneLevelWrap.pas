unit nsINodeOneLevelWrap;
 {* ������� �������������� ������ }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\nsINodeOneLevelWrap.pas"
// ���������: "SimpleClass"
// ������� ������: "TnsINodeOneLevelWrap" MUID: (468275E600B1)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
 l3IntfUses
 , nsINodeWrap
 , l3TreeInterfaces
;

type
 TnsINodeOneLevelWrap = class(TnsINodeWrap)
  {* ������� �������������� ������ }
  protected
   function DoGetChild: Il3SimpleNode; override;
    {* ���������� ������� ��������� ������� ������ }
   function GetHasChild: Boolean; override;
    {* ���������� ������� ����������� ���� ���� �� �������� ���� }
   function GetMaybeChild: Boolean; override;
    {* ���������� ������� ����������� ����� �� ���� ����� �������� ���� }
 end;//TnsINodeOneLevelWrap

implementation

uses
 l3ImplUses
 //#UC START# *468275E600B1impl_uses*
 //#UC END# *468275E600B1impl_uses*
;

function TnsINodeOneLevelWrap.DoGetChild: Il3SimpleNode;
 {* ���������� ������� ��������� ������� ������ }
//#UC START# *4909A13402E2_468275E600B1_var*
//#UC END# *4909A13402E2_468275E600B1_var*
begin
//#UC START# *4909A13402E2_468275E600B1_impl*
 Result := nil;
//#UC END# *4909A13402E2_468275E600B1_impl*
end;//TnsINodeOneLevelWrap.DoGetChild

function TnsINodeOneLevelWrap.GetHasChild: Boolean;
 {* ���������� ������� ����������� ���� ���� �� �������� ���� }
//#UC START# *4909A1790056_468275E600B1_var*
//#UC END# *4909A1790056_468275E600B1_var*
begin
//#UC START# *4909A1790056_468275E600B1_impl*
 Result := False;
//#UC END# *4909A1790056_468275E600B1_impl*
end;//TnsINodeOneLevelWrap.GetHasChild

function TnsINodeOneLevelWrap.GetMaybeChild: Boolean;
 {* ���������� ������� ����������� ����� �� ���� ����� �������� ���� }
//#UC START# *4909A1AA0089_468275E600B1_var*
//#UC END# *4909A1AA0089_468275E600B1_var*
begin
//#UC START# *4909A1AA0089_468275E600B1_impl*
 Result := False;
//#UC END# *4909A1AA0089_468275E600B1_impl*
end;//TnsINodeOneLevelWrap.GetMaybeChild

end.
