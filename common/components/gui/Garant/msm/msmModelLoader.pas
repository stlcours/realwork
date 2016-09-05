unit msmModelLoader;

// ������: "w:\common\components\gui\Garant\msm\msmModelLoader.pas"
// ���������: "SimpleClass"
// ������� ������: "TmsmModelLoader" MUID: (57A9D6D90249)

{$Include w:\common\components\msm.inc}

interface

uses
 l3IntfUses
 , msmModelElements
;

type
 TmsmModelLoader = class
  public
   class function LoadFromFile(const aFileName: AnsiString): ImsmModelElement;
 end;//TmsmModelLoader

implementation

uses
 l3ImplUses
 , msmScriptCaller
 {$If NOT Defined(NoScripts)}
 , tfwDictionaryEx
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwScriptingInterfaces
 {$IfEnd} // NOT Defined(NoScripts)
 , msmModelElementFactory
 {$If NOT Defined(NoScripts)}
 , tfwScriptEngine
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *57A9D6D90249impl_uses*
 , l3Chars
 , tfwScriptEngineEx
 // - ����� ����������� �����������
 , SysUtils
 //#UC END# *57A9D6D90249impl_uses*
;

type
 TmsmModelLoadingScriptCaller = {final} class(TmsmScriptCaller)
  private
   f_CompiledDictionary: TtfwDictionaryEx;
   f_MainWord: TtfwWord;
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure DoScriptDone(const aCtx: TtfwContext); override;
  public
   property CompiledDictionary: TtfwDictionaryEx
    read f_CompiledDictionary;
   property MainWord: TtfwWord
    read f_MainWord;
 end;//TmsmModelLoadingScriptCaller

procedure TmsmModelLoadingScriptCaller.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_57A9E4BE0225_var*
//#UC END# *479731C50290_57A9E4BE0225_var*
begin
//#UC START# *479731C50290_57A9E4BE0225_impl*
 FreeAndNil(f_MainWord);
 FreeAndNil(f_CompiledDictionary);
 inherited;
//#UC END# *479731C50290_57A9E4BE0225_impl*
end;//TmsmModelLoadingScriptCaller.Cleanup

procedure TmsmModelLoadingScriptCaller.DoScriptDone(const aCtx: TtfwContext);
//#UC START# *57A9E4F203B5_57A9E4BE0225_var*
var
 l_D : TtfwDictionaryEx;
 l_W : TtfwWord;
//#UC END# *57A9E4F203B5_57A9E4BE0225_var*
begin
//#UC START# *57A9E4F203B5_57A9E4BE0225_impl*
 inherited;
 l_W := aCtx.rEngine.PopObj As TtfwWord;
 l_W.SetRefTo(f_MainWord);
 l_D := aCtx.rEngine.PopObj As TtfwDictionaryEx;
 l_D.SetRefTo(f_CompiledDictionary);
//#UC END# *57A9E4F203B5_57A9E4BE0225_impl*
end;//TmsmModelLoadingScriptCaller.DoScriptDone

class function TmsmModelLoader.LoadFromFile(const aFileName: AnsiString): ImsmModelElement;
//#UC START# *57A9D6F8022B_57A9D6D90249_var*
CONST cQuote = '''';

var
 l_Caller : TmsmModelLoadingScriptCaller;
//#UC END# *57A9D6F8022B_57A9D6D90249_var*
begin
//#UC START# *57A9D6F8022B_57A9D6D90249_impl*
 l_Caller := TmsmModelLoadingScriptCaller.Create;
 try
  TtfwScriptEngine.Script(
  'INCLUDE ' + cQuote + 'DictionaryByName.ms.dict' + cQuote + #13#10 +
  cQuote + aFileName + cQuote + ' DictionaryAndMainWordByName'
  , l_Caller
  );
  Result := TmsmModelElementFactory.Make(l_Caller.MainWord);
 finally
  FreeAndNil(l_Caller);
 end;//try..finally
//#UC END# *57A9D6F8022B_57A9D6D90249_impl*
end;//TmsmModelLoader.LoadFromFile

end.
