unit afwPreviewPageList;

// ������: "w:\common\components\gui\Garant\AFW\implementation\Visual\afwPreviewPageList.pas"
// ���������: "SimpleClass"
// ������� ������: "TafwPreviewPageList" MUID: (47E107E20191)

{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , afwInterfaces
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = IafwPreviewPage;
 _l3InterfaceRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}
 TafwPreviewPageList = class(_l3InterfaceRefList_)
 end;//TafwPreviewPageList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *47E107E20191impl_uses*
 //#UC END# *47E107E20191impl_uses*
;

type _Instance_R_ = TafwPreviewPageList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}

end.
