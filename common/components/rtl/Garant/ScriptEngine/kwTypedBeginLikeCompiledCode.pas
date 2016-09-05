unit kwTypedBeginLikeCompiledCode;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\kwTypedBeginLikeCompiledCode.pas"
// ���������: "SimpleClass"
// ������� ������: "TkwTypedBeginLikeCompiledCode" MUID: (560937350073)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , kwBeginLikeCompiledCode
 , tfwScriptingInterfaces
;

type
 TkwTypedBeginLikeCompiledCode = class(TkwBeginLikeCompiledCode)
  private
   f_WordInfo: TtfwWordInfo;
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
  public
   procedure SetResultTypeInfo(aValue: TtfwWordInfo;
    const aCtx: TtfwContext); override;
 end;//TkwTypedBeginLikeCompiledCode
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , SysUtils
 //#UC START# *560937350073impl_uses*
 //#UC END# *560937350073impl_uses*
;

procedure TkwTypedBeginLikeCompiledCode.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_560937350073_var*
var
 l_StackCount : Integer;
 l_PrevStackCount : Integer;
//#UC END# *4DAEEDE10285_560937350073_var*
begin
//#UC START# *4DAEEDE10285_560937350073_impl*
 if f_WordInfo.ValueTypes.Empty then
  inherited
 else
 begin
  l_StackCount := aCtx.rEngine.ValuesCount - Self.GetAllParamsCount(aCtx);
  inherited;
  l_StackCount := aCtx.rEngine.ValuesCount - l_StackCount;
  l_PrevStackCount := l_StackCount;
  if f_WordInfo.Has(tfw_vtVoid) then
  begin
   if (l_StackCount <> 0) then
    RunnerError('��������� �� ����� ���������� �������� ����� ����, � ������������ ' + IntToStr(l_PrevStackCount) + ' ��������', aCtx);
  end//f_WordInfo.Has(tfw_vtVoid)
  else
  begin
   if (l_StackCount <> 1) then
   begin
    while (l_StackCount > 0) do
    begin
     aCtx.rEngine.Drop;
     Dec(l_StackCount);
    end;//l_StackCount > 0
    RunnerError('����� ������� ������ ���� ��������, � ������������ ' + IntToStr(l_PrevStackCount) + ' ��������', aCtx);
   end;//l_StackCount <> 1
   if not f_WordInfo.AcceptsValue(aCtx.rEngine.Top^) then
   begin
    aCtx.rEngine.Drop;
    RunnerError('�������� ������������ ��������', aCtx);
   end;//not f_WordInfo.AcceptsValue(aCtx.rEngine.Top^)
  end;//f_WordInfo.Has(tfw_vtVoid)
 end;//f_WordInfo.ValueTypes.Empty
//#UC END# *4DAEEDE10285_560937350073_impl*
end;//TkwTypedBeginLikeCompiledCode.DoDoIt

function TkwTypedBeginLikeCompiledCode.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_560937350073get_var*
//#UC END# *52CFC11603C8_560937350073get_var*
begin
//#UC START# *52CFC11603C8_560937350073get_impl*
 Result := f_WordInfo;
//#UC END# *52CFC11603C8_560937350073get_impl*
end;//TkwTypedBeginLikeCompiledCode.pm_GetResultTypeInfo

procedure TkwTypedBeginLikeCompiledCode.SetResultTypeInfo(aValue: TtfwWordInfo;
 const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_560937350073_var*
//#UC END# *52EA6A2C0111_560937350073_var*
begin
//#UC START# *52EA6A2C0111_560937350073_impl*
 f_WordInfo := aValue;
//#UC END# *52EA6A2C0111_560937350073_impl*
end;//TkwTypedBeginLikeCompiledCode.SetResultTypeInfo

initialization
 TkwTypedBeginLikeCompiledCode.RegisterClass;
 {* ����������� TkwTypedBeginLikeCompiledCode }
{$IfEnd} // NOT Defined(NoScripts)

end.
