unit daTabledQuery;

// ������: "w:\common\components\rtl\Garant\DA\daTabledQuery.pas"
// ���������: "SimpleClass"
// ������� ������: "TdaTabledQuery" MUID: (5600FA2301B9)

{$Include w:\common\components\rtl\Garant\DA\daDefine.inc}

interface

uses
 l3IntfUses
 , daQuery
 , daInterfaces
 , daSelectFieldList
 , daSortFieldList
;

type
 TdaTabledQuery = class(TdaQuery, IdaTabledQuery)
  private
   f_SelectFields: TdaSelectFieldList;
   f_WhereCondition: IdaCondition;
   f_FromClause: IdaFromClause;
   f_OrderBy: TdaSortFieldList;
  private
   function BuildFromClause: AnsiString;
   function BuildSelectClause: AnsiString;
   function BuildWhereClause(const aHelper: IdaParamListHelper): AnsiString;
   function BuildOrderByClause: AnsiString;
  protected
   procedure pm_SetWhereCondition(const aValue: IdaCondition); virtual;
   function MakeFromClause(const aTable: IdaTableDescription;
    const anAlias: AnsiString = ''): IdaFromClause; virtual; abstract;
   procedure PrepareTable; virtual; abstract;
   procedure UnPrepareTable; virtual; abstract;
   procedure AddSelectField(const aField: IdaSelectField);
   function MakeResultSet(Unidirectional: Boolean): IdaResultSet; override;
   procedure PrepareQuery; override;
   procedure UnprepareQuery; override;
   function Get_WhereCondition: IdaCondition;
   procedure Set_WhereCondition(const aValue: IdaCondition);
   function DoBuildSQLValue(const aHelper: IdaParamListHelper): AnsiString; override;
   procedure AddOrderBy(const aSortField: IdaSortField);
   function SelectFieldByName(const anAlias: AnsiString): IdaSelectField;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure ClearFields; override;
  public
   constructor Create(const aDataConverter: IdaDataConverter;
    const aTable: IdaTableDescription;
    const anAlias: AnsiString = ''); reintroduce;
  protected
   property SelectFields: TdaSelectFieldList
    read f_SelectFields;
   property WhereCondition: IdaCondition
    read f_WhereCondition
    write pm_SetWhereCondition;
   property FromClause: IdaFromClause
    read f_FromClause;
   property OrderBy: TdaSortFieldList
    read f_OrderBy;
 end;//TdaTabledQuery

implementation

uses
 l3ImplUses
 , SysUtils
 , daTypes
;

procedure TdaTabledQuery.pm_SetWhereCondition(const aValue: IdaCondition);
//#UC START# *5600FAC103DE_5600FA2301B9set_var*
//#UC END# *5600FAC103DE_5600FA2301B9set_var*
begin
//#UC START# *5600FAC103DE_5600FA2301B9set_impl*
 f_WhereCondition := aValue;
 UnPrepare;
//#UC END# *5600FAC103DE_5600FA2301B9set_impl*
end;//TdaTabledQuery.pm_SetWhereCondition

constructor TdaTabledQuery.Create(const aDataConverter: IdaDataConverter;
 const aTable: IdaTableDescription;
 const anAlias: AnsiString = '');
//#UC START# *5600FB3903DE_5600FA2301B9_var*
//#UC END# *5600FB3903DE_5600FA2301B9_var*
begin
//#UC START# *5600FB3903DE_5600FA2301B9_impl*
 inherited Create(aDataConverter);
 f_Table := MakeFromTable(aTable, anAlias);
 UnPrepare;
 f_SelectFields := TdaSelectFieldList.Make;
 f_OrderBy := TdaSortFieldList.Create;
//#UC END# *5600FB3903DE_5600FA2301B9_impl*
end;//TdaTabledQuery.Create

function TdaTabledQuery.BuildFromClause: AnsiString;
//#UC START# *56050F450363_5600FA2301B9_var*
//#UC END# *56050F450363_5600FA2301B9_var*
begin
//#UC START# *56050F450363_5600FA2301B9_impl*
 Result := '  from '#13#10'       ' + Table.BuildSQLValue;
//#UC END# *56050F450363_5600FA2301B9_impl*
end;//TdaTabledQuery.BuildFromClause

function TdaTabledQuery.BuildSelectClause: AnsiString;
//#UC START# *56050F3E0081_5600FA2301B9_var*
var
 l_IDX: Integer;
 l_Count: Integer;
//#UC END# *56050F3E0081_5600FA2301B9_var*
begin
//#UC START# *56050F3E0081_5600FA2301B9_impl*
 Assert(SelectFields.Count > 0);
 Result := 'select ';
 for l_IDX := 0 to SelectFields.Count - 1 do
 begin
  if l_IDX > 0 then
   Result := Result + ', '#13#10+'       ';
  Result := Result + SelectFields[l_IDX].BuildSQLValue;
 end;
//#UC END# *56050F3E0081_5600FA2301B9_impl*
end;//TdaTabledQuery.BuildSelectClause

function TdaTabledQuery.BuildWhereClause(const aHelper: IdaParamListHelper): AnsiString;
//#UC START# *56050F510228_5600FA2301B9_var*
//#UC END# *56050F510228_5600FA2301B9_var*
begin
//#UC START# *56050F510228_5600FA2301B9_impl*
 if WhereCondition <> nil then
  Result := #13#10'   where ' + WhereCondition.BuildSQLValue(aHelper)
 else
  Result := '';
//#UC END# *56050F510228_5600FA2301B9_impl*
end;//TdaTabledQuery.BuildWhereClause

function TdaTabledQuery.BuildOrderByClause: AnsiString;
//#UC START# *5680E19E003D_5600FA2301B9_var*
var
 l_IDX: Integer;
const
 cMap: array [TdaSortOrder] of AnsiString = ('ASC', 'DESC');
//#UC END# *5680E19E003D_5600FA2301B9_var*
begin
//#UC START# *5680E19E003D_5600FA2301B9_impl*
 if OrderBy.Count > 0 then
 begin
  Result := #13#10' order by ';
  for l_IDX := 0 to OrderBy.Count - 1 do
   if l_IDX <> 0 then
    Result := Result + ', ';
   Result := Format('%s %d %s', [Result, IntToStr(SelectFields.IndexOf(OrderBy[l_IDX].SelectField) + 1), cMap[OrderBy[l_IDX].SortOrder]]);
 end
 else
  Result := '';
//#UC END# *5680E19E003D_5600FA2301B9_impl*
end;//TdaTabledQuery.BuildOrderByClause

procedure TdaTabledQuery.AddSelectField(const aField: IdaSelectField);
//#UC START# *5551DC42038C_5600FA2301B9_var*
//#UC END# *5551DC42038C_5600FA2301B9_var*
begin
//#UC START# *5551DC42038C_5600FA2301B9_impl*
 f_SelectFields.Add(aField);
 UnPrepare;
//#UC END# *5551DC42038C_5600FA2301B9_impl*
end;//TdaTabledQuery.AddSelectField

function TdaTabledQuery.MakeResultSet(Unidirectional: Boolean): IdaResultSet;
//#UC START# *56010A7801F2_5600FA2301B9_var*
//#UC END# *56010A7801F2_5600FA2301B9_var*
begin
//#UC START# *56010A7801F2_5600FA2301B9_impl*
 Result := nil;
//#UC END# *56010A7801F2_5600FA2301B9_impl*
end;//TdaTabledQuery.MakeResultSet

procedure TdaTabledQuery.PrepareQuery;
//#UC START# *56010AB70258_5600FA2301B9_var*
var
 l_Field: IdaFieldFromTable;
 l_ParamDescription: IdaParamDescription;
 l_IDX: Integer;
 l_Dummy: Integer;

 function lp_ProcessCondition(const anItem: IdaCondition): Boolean;
 var
  l_Field: IdaFieldFromTable;
  l_ParamDescription: IdaParamDescription;
 begin
  Result := True;
  if Supports(anItem, IdaFieldFromTable, l_Field) then
   Assert(l_Field.Field.Table = f_Table.Table);
  if Supports(anItem, IdaParamDescription, l_ParamDescription) then
   AddParam(l_ParamDescription);
 end;
//#UC END# *56010AB70258_5600FA2301B9_var*
begin
//#UC START# *56010AB70258_5600FA2301B9_impl*
 Assert(f_SelectFields.Count > 0);
 for l_IDX := 0 to f_SelectFields.Count - 1 do
  if Supports(f_SelectFields[l_IDX], IdaFieldFromTable, l_Field) then
   Assert(l_Field.Field.Table = f_Table.Table);
 if Assigned(f_WhereCondition) then
  f_WhereCondition.IterateF(L2DaConditionIteratorIterateAction(@lp_ProcessCondition));
 for l_IDX := 0 to f_OrderBy.Count - 1 do
  Assert(f_SelectFields.IndexOf(f_OrderBy[l_IDX].SelectField) <> -1);
 PrepareTable;
//#UC END# *56010AB70258_5600FA2301B9_impl*
end;//TdaTabledQuery.PrepareQuery

procedure TdaTabledQuery.UnprepareQuery;
//#UC START# *56010ACB00F0_5600FA2301B9_var*
//#UC END# *56010ACB00F0_5600FA2301B9_var*
begin
//#UC START# *56010ACB00F0_5600FA2301B9_impl*
 UnprepareTable;
//#UC END# *56010ACB00F0_5600FA2301B9_impl*
end;//TdaTabledQuery.UnprepareQuery

function TdaTabledQuery.Get_WhereCondition: IdaCondition;
//#UC START# *563B18FB0212_5600FA2301B9get_var*
//#UC END# *563B18FB0212_5600FA2301B9get_var*
begin
//#UC START# *563B18FB0212_5600FA2301B9get_impl*
 Result := f_WhereCondition;
//#UC END# *563B18FB0212_5600FA2301B9get_impl*
end;//TdaTabledQuery.Get_WhereCondition

procedure TdaTabledQuery.Set_WhereCondition(const aValue: IdaCondition);
//#UC START# *563B18FB0212_5600FA2301B9set_var*
//#UC END# *563B18FB0212_5600FA2301B9set_var*
begin
//#UC START# *563B18FB0212_5600FA2301B9set_impl*
 WhereCondition := aValue;
//#UC END# *563B18FB0212_5600FA2301B9set_impl*
end;//TdaTabledQuery.Set_WhereCondition

function TdaTabledQuery.DoBuildSQLValue(const aHelper: IdaParamListHelper): AnsiString;
//#UC START# *566A850001E5_5600FA2301B9_var*
//#UC END# *566A850001E5_5600FA2301B9_var*
begin
//#UC START# *566A850001E5_5600FA2301B9_impl*
 Result := Format('%s'#13#10+'  %s%s%s', [BuildSelectClause, BuildFromClause, BuildWhereClause(aHelper), BuildOrderByClause]);
//#UC END# *566A850001E5_5600FA2301B9_impl*
end;//TdaTabledQuery.DoBuildSQLValue

procedure TdaTabledQuery.AddOrderBy(const aSortField: IdaSortField);
//#UC START# *567D12D00384_5600FA2301B9_var*
//#UC END# *567D12D00384_5600FA2301B9_var*
begin
//#UC START# *567D12D00384_5600FA2301B9_impl*
 f_OrderBy.Add(aSortField);
//#UC END# *567D12D00384_5600FA2301B9_impl*
end;//TdaTabledQuery.AddOrderBy

function TdaTabledQuery.SelectFieldByName(const anAlias: AnsiString): IdaSelectField;
//#UC START# *56F3D89F01C8_5600FA2301B9_var*
var
 l_IDX: Integer;
//#UC END# *56F3D89F01C8_5600FA2301B9_var*
begin
//#UC START# *56F3D89F01C8_5600FA2301B9_impl*
 if f_SelectFields.FindData(anAlias, l_IDX) then
  Result := f_SelectFields[l_IDX]
 else
  Result := nil;
//#UC END# *56F3D89F01C8_5600FA2301B9_impl*
end;//TdaTabledQuery.SelectFieldByName

procedure TdaTabledQuery.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_5600FA2301B9_var*
//#UC END# *479731C50290_5600FA2301B9_var*
begin
//#UC START# *479731C50290_5600FA2301B9_impl*
 f_Table := nil;
 f_WhereCondition := nil;
 FreeAndNil(f_SelectFields);
 FreeAndNil(f_OrderBy);
 inherited;
//#UC END# *479731C50290_5600FA2301B9_impl*
end;//TdaTabledQuery.Cleanup

procedure TdaTabledQuery.ClearFields;
begin
 WhereCondition := nil;
 f_FromClause := nil;
 inherited;
end;//TdaTabledQuery.ClearFields

end.
