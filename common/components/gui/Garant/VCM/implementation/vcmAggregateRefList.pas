unit vcmAggregateRefList;

// ������: "w:\common\components\gui\Garant\VCM\implementation\vcmAggregateRefList.pas"
// ���������: "SimpleClass"
// ������� ������: "TvcmAggregateRefList" MUID: (55E6ABBA0293)

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
 _ItemType_ = IvcmAggregate;
 _l3InterfacePtrList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfacePtrList.imp.pas}
 TvcmAggregateRefList = class(_l3InterfacePtrList_)
 end;//TvcmAggregateRefList
{$IfEnd} // NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoVCM)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *55E6ABBA0293impl_uses*
 //#UC END# *55E6ABBA0293impl_uses*
;

type _Instance_R_ = TvcmAggregateRefList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfacePtrList.imp.pas}
{$IfEnd} // NOT Defined(NoVCM)

end.
