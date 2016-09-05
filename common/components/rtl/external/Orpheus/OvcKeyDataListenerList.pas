unit OvcKeyDataListenerList;

// ������: "w:\common\components\rtl\external\Orpheus\OvcKeyDataListenerList.pas"
// ���������: "SimpleClass"
// ������� ������: "TOvcKeyDataListenerList" MUID: (53B23EFD0347)

{$Include w:\common\components\rtl\external\Orpheus\OVC.INC}

interface

uses
 l3IntfUses
 , l3SimpleDataContainer
 , l3InternalInterfaces
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = Il3KeyDataListener;
 _l3InterfacePtrList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfacePtrList.imp.pas}
 TOvcKeyDataListenerList = class(_l3InterfacePtrList_)
 end;//TOvcKeyDataListenerList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *53B23EFD0347impl_uses*
 //#UC END# *53B23EFD0347impl_uses*
;

type _Instance_R_ = TOvcKeyDataListenerList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfacePtrList.imp.pas}

end.
