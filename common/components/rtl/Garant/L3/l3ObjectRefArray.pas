unit l3ObjectRefArray;
 {* "�������� ������". ������, ������� ������������� ����������� ��� ���������� �������� �� �������� ��������� }

// ������: "w:\common\components\rtl\Garant\L3\l3ObjectRefArray.pas"
// ���������: "SimpleClass"
// ������� ������: "Tl3ObjectRefArray" MUID: (4773DD5501E3)

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoObjectRefList
;

type
 _l3OpenArray_Parent_ = Tl3ProtoObjectRefList;
 {$Include w:\common\components\rtl\Garant\L3\l3OpenArray.imp.pas}
 Tl3ObjectRefArray = class(_l3OpenArray_)
  {* "�������� ������". ������, ������� ������������� ����������� ��� ���������� �������� �� �������� ��������� }
 end;//Tl3ObjectRefArray

implementation

uses
 l3ImplUses
 , l3Base
 , l3ProtoObject
 , l3Memory
 //#UC START# *4773DD5501E3impl_uses*
 //#UC END# *4773DD5501E3impl_uses*
;

type _Instance_R_ = Tl3ObjectRefArray;

{$Include w:\common\components\rtl\Garant\L3\l3OpenArray.imp.pas}

end.
