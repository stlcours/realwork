{$IfNDef msmTreeModel_imp}

// ������: "w:\common\components\gui\Garant\msm\msmTreeModel.imp.pas"
// ���������: "Impurity"
// ������� ������: "msmTreeModel" MUID: (57B198B401A7)
// ��� ����: "_msmTreeModel_"

{$Define msmTreeModel_imp}

 {$Include w:\common\components\gui\Garant\msm\msmListLikeModel.imp.pas}
 _msmTreeModel_ = {abstract} class(_msmListLikeModel_, ImsmTreeModel, ImsmListLikeModel)
  private
   f_Tree: ImsmModelElementTree;
  protected
   function As_ImsmListLikeModel: ImsmListLikeModel;
    {* ����� ���������� ������ ���������� � ImsmListLikeModel }
   function Get_Tree: ImsmModelElementTree;
   function Get_List: ImsmModelElementStringList;
   procedure ClearFields; override;
 end;//_msmTreeModel_

{$Else msmTreeModel_imp}

{$IfNDef msmTreeModel_imp_impl}

{$Define msmTreeModel_imp_impl}

{$Include w:\common\components\gui\Garant\msm\msmListLikeModel.imp.pas}

function _msmTreeModel_.As_ImsmListLikeModel: ImsmListLikeModel;
 {* ����� ���������� ������ ���������� � ImsmListLikeModel }
begin
 Result := Self;
end;//_msmTreeModel_.As_ImsmListLikeModel

function _msmTreeModel_.Get_Tree: ImsmModelElementTree;
//#UC START# *57ADC5D70104_57B198B401A7get_var*
//#UC END# *57ADC5D70104_57B198B401A7get_var*
begin
//#UC START# *57ADC5D70104_57B198B401A7get_impl*
 Result := f_Tree;
//#UC END# *57ADC5D70104_57B198B401A7get_impl*
end;//_msmTreeModel_.Get_Tree

function _msmTreeModel_.Get_List: ImsmModelElementStringList;
//#UC START# *57B6A4550271_57B198B401A7get_var*
//#UC END# *57B6A4550271_57B198B401A7get_var*
begin
//#UC START# *57B6A4550271_57B198B401A7get_impl*
 Result := f_Tree.As_ImsmModelElementStringList;
//#UC END# *57B6A4550271_57B198B401A7get_impl*
end;//_msmTreeModel_.Get_List

procedure _msmTreeModel_.ClearFields;
begin
 f_Tree := nil;
 inherited;
end;//_msmTreeModel_.ClearFields

{$EndIf msmTreeModel_imp_impl}

{$EndIf msmTreeModel_imp}

