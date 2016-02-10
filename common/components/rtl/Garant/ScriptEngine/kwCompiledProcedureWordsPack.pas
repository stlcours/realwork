unit kwCompiledProcedureWordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\kwCompiledProcedureWordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , kwCompiledProcedure
 , tfwRegisterableWord
 , tfwScriptingInterfaces
 , TypInfo
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , SysUtils
;

type
 TkwCompiledProcedureCreate = {final} class(TtfwRegisterableWord)
  {* ����� ������� CompiledProcedure:Create
*��� ����������:* TkwCompiledProcedure
*������:*
[code]
OBJECT VAR l_TkwCompiledProcedure
 CompiledProcedure:Create >>> l_TkwCompiledProcedure
[code]  }
  private
   function Create(const aCtx: TtfwContext): TkwCompiledProcedure;
    {* ���������� ����� ������� CompiledProcedure:Create }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwCompiledProcedureCreate

function TkwCompiledProcedureCreate.Create(const aCtx: TtfwContext): TkwCompiledProcedure;
 {* ���������� ����� ������� CompiledProcedure:Create }
//#UC START# *8C9C82BDE803_87E51971436F_var*
//#UC END# *8C9C82BDE803_87E51971436F_var*
begin
//#UC START# *8C9C82BDE803_87E51971436F_impl*
 Result := TkwCompiledProcedure.Create(nil{Prodicer}, Self{nil}{Finder}, aCtx.rTypeInfo, aCtx, {nil}Key);
//#UC END# *8C9C82BDE803_87E51971436F_impl*
end;//TkwCompiledProcedureCreate.Create

procedure TkwCompiledProcedureCreate.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushObj(Create(aCtx));
end;//TkwCompiledProcedureCreate.DoDoIt

class function TkwCompiledProcedureCreate.GetWordNameForRegister: AnsiString;
begin
 Result := 'CompiledProcedure:Create';
end;//TkwCompiledProcedureCreate.GetWordNameForRegister

function TkwCompiledProcedureCreate.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TkwCompiledProcedure);
end;//TkwCompiledProcedureCreate.GetResultTypeInfo

function TkwCompiledProcedureCreate.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 0;
end;//TkwCompiledProcedureCreate.GetAllParamsCount

function TkwCompiledProcedureCreate.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TkwCompiledProcedure)]);
end;//TkwCompiledProcedureCreate.ParamsTypes

initialization
 TkwCompiledProcedureCreate.RegisterInEngine;
 {* ����������� CompiledProcedure_Create }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TkwCompiledProcedure));
 {* ����������� ���� TkwCompiledProcedure }
{$IfEnd} // NOT Defined(NoScripts)

end.
