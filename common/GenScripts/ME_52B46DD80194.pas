unit kwValue;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\kwValue.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwScriptingInterfaces
 , tfwTypeInfo
 , l3Interfaces
;

type
 TkwValue = class(TtfwWord)
  private
   f_Value: TtfwStackValue;
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
  public
   constructor Create(const aValue: TtfwStackValue); reintroduce;
   function WordName: Il3CString; override;
 end;//TkwValue
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
;

constructor TkwValue.Create(const aValue: TtfwStackValue);
//#UC START# *52B46E1B0256_52B46DD80194_var*
//#UC END# *52B46E1B0256_52B46DD80194_var*
begin
//#UC START# *52B46E1B0256_52B46DD80194_impl*
 inherited Create;
 f_Value := aValue;
//#UC END# *52B46E1B0256_52B46DD80194_impl*
end;//TkwValue.Create

procedure TkwValue.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52B46DD80194_var*
//#UC END# *4DAEEDE10285_52B46DD80194_var*
begin
//#UC START# *4DAEEDE10285_52B46DD80194_impl*
 aCtx.rEngine.Push(f_Value);
//#UC END# *4DAEEDE10285_52B46DD80194_impl*
end;//TkwValue.DoDoIt

procedure TkwValue.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_52B46DD80194_var*
//#UC END# *479731C50290_52B46DD80194_var*
begin
//#UC START# *479731C50290_52B46DD80194_impl*
 Finalize(f_Value);
 inherited;
//#UC END# *479731C50290_52B46DD80194_impl*
end;//TkwValue.Cleanup

function TkwValue.WordName: Il3CString;
//#UC START# *55AFD7DA0258_52B46DD80194_var*
//#UC END# *55AFD7DA0258_52B46DD80194_var*
begin
//#UC START# *55AFD7DA0258_52B46DD80194_impl*
 if (f_Value.rType = tfw_vtObj) AND (f_Value.AsObject Is TtfwWord) then
  Result := TtfwWord(f_Value.AsObject).WordName
 else
  Result := f_Value.AsPrintable;
//#UC END# *55AFD7DA0258_52B46DD80194_impl*
end;//TkwValue.WordName

initialization
 TkwValue.RegisterClass;
 {* ����������� TkwValue }
{$IfEnd} // NOT Defined(NoScripts)

end.
