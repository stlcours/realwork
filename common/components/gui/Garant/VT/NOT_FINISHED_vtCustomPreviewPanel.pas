unit NOT_FINISHED_vtCustomPreviewPanel;

// ������: "w:\common\components\gui\Garant\VT\NOT_FINISHED_vtCustomPreviewPanel.pas"
// ���������: "GuiControl"
// ������� ������: "TvtCustomPreviewPanel" MUID: (4C2238D10107)

{$Include w:\common\components\gui\Garant\VT\vtDefine.inc}

interface

uses
 l3IntfUses
 , afwCustomCommonControl
;

type
 TvtCustomPreviewPanel = class(TafwCustomCommonControl)
 end;//TvtCustomPreviewPanel

implementation

uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *4C2238D10107impl_uses*
 //#UC END# *4C2238D10107impl_uses*
;

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TvtCustomPreviewPanel);
 {* ����������� TvtCustomPreviewPanel }
{$IfEnd} // NOT Defined(NoScripts)

end.
