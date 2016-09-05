unit evdChildrenCountEliminator;
 {* ���������� ChildrenCount �� ������ ���������, ����� �� �������������� ������ ������ ��� ����������� �� ������� }

// ������: "w:\common\components\rtl\Garant\EVD\evdChildrenCountEliminator.pas"
// ���������: "SimpleClass"
// ������� ������: "TevdChildrenCountEliminator" MUID: (4E84542E03B5)

{$Include w:\common\components\rtl\Garant\EVD\evdDefine.inc}

interface

uses
 l3IntfUses
 , k2TagFilter
 , l3Variant
;

type
 TevdChildrenCountEliminator = class(Tk2TagFilter)
  {* ���������� ChildrenCount �� ������ ���������, ����� �� �������������� ������ ������ ��� ����������� �� ������� }
  protected
   procedure DoAddAtomEx(AtomIndex: Integer;
    const Value: Ik2Variant); override;
 end;//TevdChildrenCountEliminator

implementation

uses
 l3ImplUses
 , k2Tags
 //#UC START# *4E84542E03B5impl_uses*
 //#UC END# *4E84542E03B5impl_uses*
;

procedure TevdChildrenCountEliminator.DoAddAtomEx(AtomIndex: Integer;
 const Value: Ik2Variant);
//#UC START# *4A2D1634025B_4E84542E03B5_var*
//#UC END# *4A2D1634025B_4E84542E03B5_var*
begin
//#UC START# *4A2D1634025B_4E84542E03B5_impl*
 if (AtomIndex = k2_tiChildren) then
  Exit;
 inherited;
//#UC END# *4A2D1634025B_4E84542E03B5_impl*
end;//TevdChildrenCountEliminator.DoAddAtomEx

end.
