unit NOT_FINISHED_vtButton;

// ������: "w:\common\components\gui\Garant\VT\NOT_FINISHED_vtButton.pas"
// ���������: "GuiControl"
// ������� ������: "TvtButton" MUID: (517941310082)

{$Include w:\common\components\gui\Garant\VT\vtDefine.inc}

interface

uses
 l3IntfUses
 , eeButton
;

type
 _vtUnicodeButtonControl_Parent_ = TeeButton;
 {$Include w:\common\components\gui\Garant\VT\vtUnicodeButtonControl.imp.pas}
 TvtButton = class(_vtUnicodeButtonControl_)
 end;//TvtButton

implementation

uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *517941310082impl_uses*
 //#UC END# *517941310082impl_uses*
;

{$Include w:\common\components\gui\Garant\VT\vtUnicodeButtonControl.imp.pas}

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TvtButton);
 {* ����������� TvtButton }
{$IfEnd} // NOT Defined(NoScripts)

end.
