unit RadioGroupWordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\RadioGroupWordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3IntfUses
 , ExtCtrls
 , tfwPropertyLike
 , tfwScriptingInterfaces
 , tfwTypeInfo
 , TypInfo
;
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

implementation

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3ImplUses
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , SysUtils
;

type
 TkwPopRadioGroupItemIndex = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:RadioGroup:ItemIndex
[panel]������ ��������[panel]
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aRadioGroup pop:RadioGroup:ItemIndex >>> l_Integer
[code]  }
  private
   function ItemIndex(const aCtx: TtfwContext;
    aRadioGroup: TRadioGroup): Integer;
    {* ���������� ����� ������� pop:RadioGroup:ItemIndex }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopRadioGroupItemIndex

function TkwPopRadioGroupItemIndex.ItemIndex(const aCtx: TtfwContext;
 aRadioGroup: TRadioGroup): Integer;
 {* ���������� ����� ������� pop:RadioGroup:ItemIndex }
//#UC START# *E20F0AC32CE1_8E50130D7478_var*
//#UC END# *E20F0AC32CE1_8E50130D7478_var*
begin
//#UC START# *E20F0AC32CE1_8E50130D7478_impl*
 !!! Needs to be implemented !!!
//#UC END# *E20F0AC32CE1_8E50130D7478_impl*
end;//TkwPopRadioGroupItemIndex.ItemIndex

procedure TkwPopRadioGroupItemIndex.DoDoIt(const aCtx: TtfwContext);
var l_aRadioGroup: TRadioGroup;
begin
 try
  l_aRadioGroup := TRadioGroup(aCtx.rEngine.PopObjAs(TRadioGroup));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRadioGroup: TRadioGroup : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(ItemIndex(aCtx, l_aRadioGroup));
end;//TkwPopRadioGroupItemIndex.DoDoIt

class function TkwPopRadioGroupItemIndex.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:RadioGroup:ItemIndex';
end;//TkwPopRadioGroupItemIndex.GetWordNameForRegister

procedure TkwPopRadioGroupItemIndex.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ItemIndex', aCtx);
end;//TkwPopRadioGroupItemIndex.SetValuePrim

function TkwPopRadioGroupItemIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Integer);
end;//TkwPopRadioGroupItemIndex.GetResultTypeInfo

function TkwPopRadioGroupItemIndex.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopRadioGroupItemIndex.GetAllParamsCount

function TkwPopRadioGroupItemIndex.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TRadioGroup)]);
end;//TkwPopRadioGroupItemIndex.ParamsTypes

initialization
 TkwPopRadioGroupItemIndex.RegisterInEngine;
 {* ����������� pop_RadioGroup_ItemIndex }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TRadioGroup));
 {* ����������� ���� TRadioGroup }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

end.
