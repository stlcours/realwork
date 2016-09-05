unit vtDblClickDateEdit;

// ������: "w:\common\components\gui\Garant\VT\vtDblClickDateEdit.pas"
// ���������: "GuiControl"
// ������� ������: "TvtDblClickDateEdit" MUID: (4AC5DAE50246)

{$Include w:\common\components\gui\Garant\VT\vtDefine.inc}

interface

uses
 l3IntfUses
 , vtDateEdit
;

type
 TvtDblClickDateEdit = class(TvtDateEdit)
  protected
   procedure MakeCalendar; override;
 end;//TvtDblClickDateEdit

implementation

uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *4AC5DAE50246impl_uses*
 //#UC END# *4AC5DAE50246impl_uses*
;

procedure TvtDblClickDateEdit.MakeCalendar;
//#UC START# *554CA3BF011D_4AC5DAE50246_var*
//#UC END# *554CA3BF011D_4AC5DAE50246_var*
begin
//#UC START# *554CA3BF011D_4AC5DAE50246_impl*
 if f_CalendarPanel <> nil then
  Exit;
 f_CalendarPanel := TDblClickPopupCalendar.Create(Self);
//#UC END# *554CA3BF011D_4AC5DAE50246_impl*
end;//TvtDblClickDateEdit.MakeCalendar

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TvtDblClickDateEdit);
 {* ����������� TvtDblClickDateEdit }
{$IfEnd} // NOT Defined(NoScripts)

end.
