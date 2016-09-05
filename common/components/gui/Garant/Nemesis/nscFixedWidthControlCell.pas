unit nscFixedWidthControlCell;
 {* ������ ���������� ������� � ������ ������� ������ ����� ������ �������� }

// ������: "w:\common\components\gui\Garant\Nemesis\nscFixedWidthControlCell.pas"
// ���������: "SimpleClass"
// ������� ������: "TnscFixedWidthControlCell" MUID: (4ACA39B902E9)

{$Include w:\common\components\gui\Garant\Nemesis\nscDefine.inc}

interface

{$If Defined(Nemesis)}
uses
 l3IntfUses
 , nscArrangeGridCell
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
;

type
 TnscFixedWidthControlCell = class(TagControlCell)
  {* ������ ���������� ������� � ������ ������� ������ ����� ������ �������� }
  public
   constructor Create(aControl: TControl); override;
 end;//TnscFixedWidthControlCell
{$IfEnd} // Defined(Nemesis)

implementation

{$If Defined(Nemesis)}
uses
 l3ImplUses
 //#UC START# *4ACA39B902E9impl_uses*
 //#UC END# *4ACA39B902E9impl_uses*
;

constructor TnscFixedWidthControlCell.Create(aControl: TControl);
//#UC START# *4ACA31830369_4ACA39B902E9_var*
//#UC END# *4ACA31830369_4ACA39B902E9_var*
begin
//#UC START# *4ACA31830369_4ACA39B902E9_impl*
 inherited;
 MinWidth := aControl.Width;
 FullWidth := aControl.Width;
//#UC END# *4ACA31830369_4ACA39B902E9_impl*
end;//TnscFixedWidthControlCell.Create
{$IfEnd} // Defined(Nemesis)

end.
