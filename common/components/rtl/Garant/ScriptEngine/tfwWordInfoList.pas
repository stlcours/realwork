unit tfwWordInfoList;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\tfwWordInfoList.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwWordInfoListPrim
 , tfwScriptingTypes
 , l3Types
;

type
 _FindDataType_ = TtfwWordInfoRec;
 _l3Searcher_Parent_ = TtfwWordInfoListPrim;
 {$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}
 TtfwWordInfoList = class(_l3Searcher_)
 end;//TtfwWordInfoList
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwScriptingInterfaces
 , l3Memory
;

{$If not Declared(_ItemType_)}type _ItemType_ = TtfwWordInfoF;{$IfEnd}

{$If not Declared(_DataType_)}type _DataType_ = Tl3Ptr;{$IfEnd}

function CompareItemWithData(const anItem: _ItemType_;
 const aData: _FindDataType_;
 aSortIndex: Tl3SortIndex;
 aList: _l3Searcher_): Integer;
 {* ���������� ������������ ������� � �������. }
//#UC START# *47B9BAFD01F4_559F840D0179_var*
//#UC END# *47B9BAFD01F4_559F840D0179_var*
begin
//#UC START# *47B9BAFD01F4_559F840D0179_impl*
 Result := anItem.pRec^.Compare(aData);
//#UC END# *47B9BAFD01F4_559F840D0179_impl*
end;//CompareItemWithData

type _Instance_R_ = TtfwWordInfoList;

{$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}
{$IfEnd} // NOT Defined(NoScripts)

end.
