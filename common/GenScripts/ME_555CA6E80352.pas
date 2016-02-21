unit daFromTableList;

// ������: "w:\common\components\rtl\Garant\DA\daFromTableList.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\rtl\Garant\DA\daDefine.inc}

interface

uses
 l3IntfUses
 , daFromTableListPrim
 , l3Types
;

type
 _FindDataType_ = AnsiString;
 _l3Searcher_Parent_ = TdaFromTableListPrim;
 {$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}
 TdaFromTableList = class(_l3Searcher_)
 end;//TdaFromTableList

implementation

uses
 l3ImplUses
 , SysUtils
 , daInterfaces
;

{$If not Declared(_ItemType_)}type _ItemType_ = IdaFromTable;{$IfEnd}

function CompareItemWithData(const anItem: _ItemType_;
 const aData: _FindDataType_;
 aSortIndex: Tl3SortIndex;
 aList: _l3Searcher_): Integer;
 {* ���������� ������������ ������� � �������. }
//#UC START# *47B9BAFD01F4_555CA6E80352_var*
//#UC END# *47B9BAFD01F4_555CA6E80352_var*
begin
//#UC START# *47B9BAFD01F4_555CA6E80352_impl*
 Result := AnsiCompareText(anItem.TableAlias, aData);
//#UC END# *47B9BAFD01F4_555CA6E80352_impl*
end;//CompareItemWithData

type _Instance_R_ = TdaFromTableList;

{$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}

end.
