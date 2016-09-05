unit vcmUserTypeDefList;

// ������: "w:\common\components\gui\Garant\VCM\implementation\vcmUserTypeDefList.pas"
// ���������: "SimpleClass"
// ������� ������: "TvcmUserTypeDefList" MUID: (559CEE5A000E)

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If NOT Defined(NoVCM)}
uses
 l3IntfUses
 , l3ProtoDataContainer
 , vcmInterfaces
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = IvcmUserTypeDef;
 _l3InterfaceRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}
 TvcmUserTypeDefList = {final} class(_l3InterfaceRefList_)
 end;//TvcmUserTypeDefList
{$IfEnd} // NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoVCM)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *559CEE5A000Eimpl_uses*
 //#UC END# *559CEE5A000Eimpl_uses*
;

type _Instance_R_ = TvcmUserTypeDefList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}
{$IfEnd} // NOT Defined(NoVCM)

end.
