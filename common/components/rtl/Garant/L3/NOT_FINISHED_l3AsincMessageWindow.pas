unit NOT_FINISHED_l3AsincMessageWindow;
 {* ����� ������������� ���� � ���������� � ��������� ������ }

// ������: "w:\common\components\rtl\Garant\L3\NOT_FINISHED_l3AsincMessageWindow.pas"
// ���������: "UtilityPack"
// ������� ������: "l3AsincMessageWindow" MUID: (4787FCE9024A)

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
 , Classes
;

type
 Tl3AsincMessageWindow = class(TThread)
  protected
   procedure Execute; override;
 end;//Tl3AsincMessageWindow

implementation

uses
 l3ImplUses
 , l3AsincMessageWindowRes
 //#UC START# *4787FCE9024Aimpl_uses*
 //#UC END# *4787FCE9024Aimpl_uses*
;

procedure Tl3AsincMessageWindow.Execute;
//#UC START# *499D3BE0004D_4787FD4002B4_var*
//#UC END# *499D3BE0004D_4787FD4002B4_var*
begin
//#UC START# *499D3BE0004D_4787FD4002B4_impl*
 !!! Needs to be implemented !!!
//#UC END# *499D3BE0004D_4787FD4002B4_impl*
end;//Tl3AsincMessageWindow.Execute

end.
