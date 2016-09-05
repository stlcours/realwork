unit ncsServerTransporterPool;

// ������: "w:\common\components\rtl\Garant\cs\ncsServerTransporterPool.pas"
// ���������: "SimpleClass"
// ������� ������: "TncsServerTransporterPool" MUID: (545CBED90193)

{$Include w:\common\components\rtl\Garant\cs\CsDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , l3ProtoObject
 , ncsServerTransporterList
 , ncsMessageInterfaces
 , SyncObjs
;

type
 _l3CriticalSectionHolder_Parent_ = Tl3ProtoObject;
 {$Include w:\common\components\rtl\Garant\L3\l3CriticalSectionHolder.imp.pas}
 TncsServerTransporterPool = class(_l3CriticalSectionHolder_)
  private
   f_Data: TncsServerTransporterList;
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure InitFields; override;
  public
   procedure Register(const aTransporter: IncsServerTransporter);
   procedure UnRegister(const aTransporter: IncsServerTransporter);
   procedure TerminateAll;
 end;//TncsServerTransporterPool
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
 , SysUtils
 //#UC START# *545CBED90193impl_uses*
 //#UC END# *545CBED90193impl_uses*
;

{$Include w:\common\components\rtl\Garant\L3\l3CriticalSectionHolder.imp.pas}

procedure TncsServerTransporterPool.Register(const aTransporter: IncsServerTransporter);
//#UC START# *545CBF760027_545CBED90193_var*
//#UC END# *545CBF760027_545CBED90193_var*
begin
//#UC START# *545CBF760027_545CBED90193_impl*
 Lock;
 try
  if f_Data.IndexOf(aTransporter) = -1 then
   f_Data.Add(aTransporter);
 finally
  Unlock;
 end;
//#UC END# *545CBF760027_545CBED90193_impl*
end;//TncsServerTransporterPool.Register

procedure TncsServerTransporterPool.UnRegister(const aTransporter: IncsServerTransporter);
//#UC START# *545CBF9602E1_545CBED90193_var*
//#UC END# *545CBF9602E1_545CBED90193_var*
begin
//#UC START# *545CBF9602E1_545CBED90193_impl*
 Lock;
 try
  f_Data.Remove(aTransporter);
 finally
  Unlock;
 end;
//#UC END# *545CBF9602E1_545CBED90193_impl*
end;//TncsServerTransporterPool.UnRegister

procedure TncsServerTransporterPool.TerminateAll;
//#UC START# *545CBFA2006D_545CBED90193_var*
var
 l_IDX: Integer;
//#UC END# *545CBFA2006D_545CBED90193_var*
begin
//#UC START# *545CBFA2006D_545CBED90193_impl*
 Lock;
 try
  for l_IDX := f_Data.Count - 1 downto 0 do
   f_Data[l_IDX].Terminate;
 finally
  Unlock;
 end;
//#UC END# *545CBFA2006D_545CBED90193_impl*
end;//TncsServerTransporterPool.TerminateAll

procedure TncsServerTransporterPool.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_545CBED90193_var*
//#UC END# *479731C50290_545CBED90193_var*
begin
//#UC START# *479731C50290_545CBED90193_impl*
 FreeAndNil(f_Data);
 inherited;
//#UC END# *479731C50290_545CBED90193_impl*
end;//TncsServerTransporterPool.Cleanup

procedure TncsServerTransporterPool.InitFields;
//#UC START# *47A042E100E2_545CBED90193_var*
//#UC END# *47A042E100E2_545CBED90193_var*
begin
//#UC START# *47A042E100E2_545CBED90193_impl*
 inherited;
 f_Data := TncsServerTransporterList.Make;
//#UC END# *47A042E100E2_545CBED90193_impl*
end;//TncsServerTransporterPool.InitFields
{$IfEnd} // NOT Defined(Nemesis)

end.
