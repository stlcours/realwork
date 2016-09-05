unit kwElse;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\kwElse.pas"
// ���������: "ScriptKeyword"
// ������� ������: "else" MUID: (5284F739012F)
// ��� ����: "TkwElse"

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwWordWorker
 , kwCompiledWordWorker
 , tfwScriptingInterfaces
 , kwCompiledWordPrim
;

type
 TkwElse = {final} class(TtfwWordWorker)
  protected
   function CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker; override;
   function AfterWordMaxCount(const aCtx: TtfwContext): Integer; override;
   procedure DoCompiledWord(aWord: TtfwWord;
    const aContext: TtfwContext); override;
   function MakeCompiledWordWorker(const aContext: TtfwContext;
    aRightParams: TkwCompiledWordPrim): TtfwWord; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwElse
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , kwCompiledWord
 , kwCompiledIfElse
 //#UC START# *5284F739012Fimpl_uses*
 //#UC END# *5284F739012Fimpl_uses*
;

function TkwElse.CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_5284F739012F_var*
//#UC END# *4DCBD67C0362_5284F739012F_var*
begin
//#UC START# *4DCBD67C0362_5284F739012F_impl*
 RunnerError('�� ������ ���� ��������', aCtx);
 Result := nil;
//#UC END# *4DCBD67C0362_5284F739012F_impl*
end;//TkwElse.CompiledWorkerClass

function TkwElse.AfterWordMaxCount(const aCtx: TtfwContext): Integer;
//#UC START# *4DB9B446039A_5284F739012F_var*
//#UC END# *4DB9B446039A_5284F739012F_var*
begin
//#UC START# *4DB9B446039A_5284F739012F_impl*
 Result := 1;
//#UC END# *4DB9B446039A_5284F739012F_impl*
end;//TkwElse.AfterWordMaxCount

procedure TkwElse.DoCompiledWord(aWord: TtfwWord;
 const aContext: TtfwContext);
//#UC START# *4DB9BBD6024F_5284F739012F_var*
//#UC END# *4DB9BBD6024F_5284F739012F_var*
begin
//#UC START# *4DB9BBD6024F_5284F739012F_impl*
 CompilerAssert(not aWord.IsForwardDeclaration, '����������', aContext);
 CompilerAssert(aContext.rWordCompilingNow Is TkwCompiledWordPrim, '����� ������������� �����', aContext);
 CompilerAssert(TkwCompiledWordPrim(aContext.rWordCompilingNow).GetCode(aContext).Last Is TkwCompiledIfElse, '����� if ����� else', aContext);
 TkwCompiledIfElse(TkwCompiledWordPrim(aContext.rWordCompilingNow).GetCode(aContext).Last).SetElse(aWord);
 //inherited;
//#UC END# *4DB9BBD6024F_5284F739012F_impl*
end;//TkwElse.DoCompiledWord

function TkwElse.MakeCompiledWordWorker(const aContext: TtfwContext;
 aRightParams: TkwCompiledWordPrim): TtfwWord;
//#UC START# *5284D8180211_5284F739012F_var*
//#UC END# *5284D8180211_5284F739012F_var*
begin
//#UC START# *5284D8180211_5284F739012F_impl*
 CompilerAssert((aRightParams.CodeCount = 1),
                '�������� ������ ���� �������� ����� �����',
                aContext);
 Result := aRightParams.GetCode(aContext)[0].Use;
//#UC END# *5284D8180211_5284F739012F_impl*
end;//TkwElse.MakeCompiledWordWorker

class function TkwElse.GetWordNameForRegister: AnsiString;
begin
 Result := 'else';
end;//TkwElse.GetWordNameForRegister

initialization
 TkwElse.RegisterInEngine;
 {* ����������� else }
{$IfEnd} // NOT Defined(NoScripts)

end.
