unit pgPriorityCalculator;

// ������: "w:\common\components\rtl\Garant\PG\pgPriorityCalculator.pas"
// ���������: "SimpleClass"
// ������� ������: "TpgPriorityCalculator" MUID: (5751377C006E)

{$Include w:\common\components\rtl\Garant\PG\pgDefine.inc}

interface

{$If Defined(UsePostgres)}
uses
 l3IntfUses
 , l3ProtoObject
 , daInterfaces
 , daTypes
;

type
 TpgPriorityCalculator = class(Tl3ProtoObject, IdaPriorityCalculator)
  private
   f_PriorityQuery: IdaTabledQuery;
   f_Factory: IdaTableQueryFactory;
  private
   function PriorityQuery: IdaTabledQuery;
  protected
   function Calc(aUserId: TdaUserID;
    out aImportPriority: TdaPriority;
    out aExportPriority: TdaPriority): Boolean;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
  public
   constructor Create(const aFactory: IdaTableQueryFactory); reintroduce;
   class function Make(const aFactory: IdaTableQueryFactory): IdaPriorityCalculator; reintroduce;
 end;//TpgPriorityCalculator
{$IfEnd} // Defined(UsePostgres)

implementation

{$If Defined(UsePostgres)}
uses
 l3ImplUses
 , daScheme
 //#UC START# *5751377C006Eimpl_uses*
 //#UC END# *5751377C006Eimpl_uses*
;

constructor TpgPriorityCalculator.Create(const aFactory: IdaTableQueryFactory);
//#UC START# *575137CF01E2_5751377C006E_var*
//#UC END# *575137CF01E2_5751377C006E_var*
begin
//#UC START# *575137CF01E2_5751377C006E_impl*
 inherited Create;
 f_Factory := aFactory;
//#UC END# *575137CF01E2_5751377C006E_impl*
end;//TpgPriorityCalculator.Create

class function TpgPriorityCalculator.Make(const aFactory: IdaTableQueryFactory): IdaPriorityCalculator;
var
 l_Inst : TpgPriorityCalculator;
begin
 l_Inst := Create(aFactory);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TpgPriorityCalculator.Make

function TpgPriorityCalculator.PriorityQuery: IdaTabledQuery;
//#UC START# *57513C4C02C0_5751377C006E_var*
//#UC END# *57513C4C02C0_5751377C006E_var*
begin
//#UC START# *57513C4C02C0_5751377C006E_impl*
 if f_PriorityQuery = nil then
 begin
  f_PriorityQuery := f_Factory.MakeTabledQuery(
   f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtGroupMembers), 'ugm').Join(
    f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtGroups), 'ug'),
    da_jkInner).SetCondition(f_Factory.MakeLogicCondition(
      f_Factory.MakeParamsCondition('ugm', TdaScheme.Instance.Table(da_mtGroupMembers)['user_id'], da_copEqual, 'p_userID'),
      da_loAnd,
      f_Factory.MakeJoinCondition('ugm', TdaScheme.Instance.Table(da_mtGroupMembers)['group_id'], 'ug', TdaScheme.Instance.Table(da_mtGroups)['id'])))
  );
  f_PriorityQuery.AddSelectField(f_Factory.MakeAggregateField(da_aopMax, f_Factory.MakeSelectField('ug', TdaScheme.Instance.Table(da_mtGroups)['import_priority']), 'max_import_priority'));
  f_PriorityQuery.AddSelectField(f_Factory.MakeAggregateField(da_aopMax, f_Factory.MakeSelectField('ug', TdaScheme.Instance.Table(da_mtGroups)['export_priority']), 'max_export_priority'));
  f_PriorityQuery.Prepare;
 end;
 Result := f_PriorityQuery;
//#UC END# *57513C4C02C0_5751377C006E_impl*
end;//TpgPriorityCalculator.PriorityQuery

function TpgPriorityCalculator.Calc(aUserId: TdaUserID;
 out aImportPriority: TdaPriority;
 out aExportPriority: TdaPriority): Boolean;
//#UC START# *575000000164_5751377C006E_var*
var
 l_ResultSet: IdaResultSet;
//#UC END# *575000000164_5751377C006E_var*
begin
//#UC START# *575000000164_5751377C006E_impl*
 PriorityQuery.Param['p_userID'].AsLargeInt := aUserID;
 l_ResultSet := PriorityQuery.OpenResultSet;
 try
  Result := not l_ResultSet.IsEmpty;
  if Result then
  begin
   aImportPriority := TdaPriority(l_ResultSet.Field['max_import_priority'].AsInteger);
   aExportPriority := TdaPriority(l_ResultSet.Field['max_export_priority'].AsInteger);
  end;
 finally
  l_ResultSet := nil;
 end;
//#UC END# *575000000164_5751377C006E_impl*
end;//TpgPriorityCalculator.Calc

procedure TpgPriorityCalculator.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_5751377C006E_var*
//#UC END# *479731C50290_5751377C006E_var*
begin
//#UC START# *479731C50290_5751377C006E_impl*
 f_PriorityQuery := nil;
 inherited;
//#UC END# *479731C50290_5751377C006E_impl*
end;//TpgPriorityCalculator.Cleanup
{$IfEnd} // Defined(UsePostgres)

end.
