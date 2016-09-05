unit evdAllDocumentSubsEliminator;
 {* ������, ������������ ��� ���� ��������� �� ��������� ������� }

// ������: "w:\common\components\rtl\Garant\EVD\evdAllDocumentSubsEliminator.pas"
// ���������: "SimpleClass"
// ������� ������: "TevdAllDocumentSubsEliminator" MUID: (4E8478090254)

{$Include w:\common\components\rtl\Garant\EVD\evdDefine.inc}

interface

uses
 l3IntfUses
 , k2TagFilter
;

type
 TevdAllDocumentSubsEliminator = class(Tk2TagFilter)
  {* ������, ������������ ��� ���� ��������� �� ��������� ������� }
  protected
   function NeedTranslateChildToNextPrim(anOpenMode: Tk2TagFilterOpenMode): Boolean; override;
 end;//TevdAllDocumentSubsEliminator

implementation

uses
 l3ImplUses
 , DocSubLayer_Const
 , DocumentSub_Const
 //#UC START# *4E8478090254impl_uses*
 //#UC END# *4E8478090254impl_uses*
;

function TevdAllDocumentSubsEliminator.NeedTranslateChildToNextPrim(anOpenMode: Tk2TagFilterOpenMode): Boolean;
//#UC START# *4E15CBD5018B_4E8478090254_var*
//#UC END# *4E15CBD5018B_4E8478090254_var*
begin
//#UC START# *4E15CBD5018B_4E8478090254_impl*
 Result := not CurrentType.IsKindOf(k2_typDocSubLayer) AND
           not CurrentType.IsKindOf(k2_typDocumentSub);
//#UC END# *4E15CBD5018B_4E8478090254_impl*
end;//TevdAllDocumentSubsEliminator.NeedTranslateChildToNextPrim

end.
