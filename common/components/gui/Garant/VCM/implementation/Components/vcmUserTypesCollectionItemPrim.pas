unit vcmUserTypesCollectionItemPrim;

// ������: "w:\common\components\gui\Garant\VCM\implementation\Components\vcmUserTypesCollectionItemPrim.pas"
// ���������: "SimpleClass"
// ������� ������: "TvcmUserTypesCollectionItemPrim" MUID: (5006A4A6003D)

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If NOT Defined(NoVCM)}
uses
 l3IntfUses
 , vcmBaseCollectionItem
;

type
 TvcmUserTypesCollectionItemPrim = class(TvcmBaseCollectionItem)
  private
   f_CanHaveToolbars: Boolean;
  protected
   procedure InitFields; override;
  public
   property CanHaveToolbars: Boolean
    read f_CanHaveToolbars
    write f_CanHaveToolbars;
 end;//TvcmUserTypesCollectionItemPrim
{$IfEnd} // NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoVCM)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *5006A4A6003Dimpl_uses*
 //#UC END# *5006A4A6003Dimpl_uses*
;

procedure TvcmUserTypesCollectionItemPrim.InitFields;
//#UC START# *47A042E100E2_5006A4A6003D_var*
//#UC END# *47A042E100E2_5006A4A6003D_var*
begin
//#UC START# *47A042E100E2_5006A4A6003D_impl*
 inherited;
 f_CanHaveToolbars := true;
//#UC END# *47A042E100E2_5006A4A6003D_impl*
end;//TvcmUserTypesCollectionItemPrim.InitFields

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TvcmUserTypesCollectionItemPrim);
 {* ����������� TvcmUserTypesCollectionItemPrim }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(NoVCM)

end.
