unit l3WndProcListenersList;

// ������: "w:\common\components\rtl\Garant\L3\l3WndProcListenersList.pas"
// ���������: "SimpleClass"
// ������� ������: "Tl3WndProcListenersList" MUID: (4F66F8AD025C)

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , l3Interfaces
 , l3Memory
 , l3Types
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = Il3WndProcListener;
 _l3InterfacePtrList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfacePtrList.imp.pas}
 Tl3WndProcListenersList = class(_l3InterfacePtrList_)
 end;//Tl3WndProcListenersList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *4F66F8AD025Cimpl_uses*
 //#UC END# *4F66F8AD025Cimpl_uses*
;

type _Instance_R_ = Tl3WndProcListenersList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfacePtrList.imp.pas}

end.
