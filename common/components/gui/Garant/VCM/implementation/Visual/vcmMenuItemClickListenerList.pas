unit vcmMenuItemClickListenerList;

// ������: "w:\common\components\gui\Garant\VCM\implementation\Visual\vcmMenuItemClickListenerList.pas"
// ���������: "SimpleClass"
// ������� ������: "TvcmMenuItemClickListenerList" MUID: (53E9DCDF0259)

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If NOT Defined(NoVCM)}
uses
 l3IntfUses
 , l3SimpleDataContainer
 , vcmMenuManagerTypes
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = IvcmMenuItemClickListener;
 _l3InterfacePtrList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfacePtrList.imp.pas}
 TvcmMenuItemClickListenerList = class(_l3InterfacePtrList_)
 end;//TvcmMenuItemClickListenerList
{$IfEnd} // NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoVCM)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *53E9DCDF0259impl_uses*
 //#UC END# *53E9DCDF0259impl_uses*
;

type _Instance_R_ = TvcmMenuItemClickListenerList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfacePtrList.imp.pas}
{$IfEnd} // NOT Defined(NoVCM)

end.
