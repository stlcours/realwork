unit evdDocumentSubsEliminator;

// ������: "w:\common\components\rtl\Garant\EVD\evdDocumentSubsEliminator.pas"
// ���������: "SimpleClass"
// ������� ������: "TevdDocumentSubsEliminator" MUID: (4E6756B3015E)

{$Include w:\common\components\rtl\Garant\EVD\evdDefine.inc}

interface

uses
 l3IntfUses
 , evdDocumentMarksEliminator
 , l3Variant
;

type
 TevdDocumentSubsEliminator = class(TevdDocumentMarksEliminator)
  protected
   function NeedWritePara(aLeaf: Tl3Variant): Boolean; override;
    {* ���������� ����� �� ����������� ���������� ����� }
 end;//TevdDocumentSubsEliminator

implementation

uses
 l3ImplUses
 , evdTypes
 , k2Tags
 //#UC START# *4E6756B3015Eimpl_uses*
 //#UC END# *4E6756B3015Eimpl_uses*
;

function TevdDocumentSubsEliminator.NeedWritePara(aLeaf: Tl3Variant): Boolean;
 {* ���������� ����� �� ����������� ���������� ����� }
//#UC START# *49E48829016F_4E6756B3015E_var*
//#UC END# *49E48829016F_4E6756B3015E_var*
begin
//#UC START# *49E48829016F_4E6756B3015E_impl*
 Result := aLeaf.IntA[k2_tiHandle] <> Ord(ev_sbtSub);
//#UC END# *49E48829016F_4E6756B3015E_impl*
end;//TevdDocumentSubsEliminator.NeedWritePara

end.
