unit dsAACContainer;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\AAC\dsAACContainer.pas"
// ���������: "ViewAreaControllerImp"
// ������� ������: "TdsAACContainer" MUID: (4FF2EEF80072)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , DocumentAndListInterfaces
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3ProtoObjectWithCOMQI
 {$If NOT Defined(NoVCM)}
 , vcmLocalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3Interfaces
 , l3NotifyPtrList
;

type
 _FormDataSourceType_ = IdsAACContainer;
 {$Include w:\common\components\gui\Garant\VCM\implementation\vcmFormDataSourcePrim.imp.pas}
 TdsAACContainer = {final} class(_vcmFormDataSourcePrim_, IdsAACContainer)
 end;//TdsAACContainer
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , l3InterfacesMisc
 , SysUtils
 , l3Base
 //#UC START# *4FF2EEF80072impl_uses*
 //#UC END# *4FF2EEF80072impl_uses*
;

type _Instance_R_ = TdsAACContainer;

{$Include w:\common\components\gui\Garant\VCM\implementation\vcmFormDataSourcePrim.imp.pas}
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
