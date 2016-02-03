unit seModalWorker;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\seModalWorker.pas"
// ���������: "UtilityPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwScriptingInterfaces
;

type
 TseModalWorker = object
  public
   rWord: TtfwWord;
   rContext: PtfwContext;
  public
   procedure Free;
 end;//TseModalWorker

function TseModalWorker_C(aWord: TtfwWord;
 const aContext: TtfwContext): TseModalWorker;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
;

function TseModalWorker_C(aWord: TtfwWord;
 const aContext: TtfwContext): TseModalWorker;
//#UC START# *4FC755E000C9_4FC7557C0082_var*
//#UC END# *4FC755E000C9_4FC7557C0082_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4FC755E000C9_4FC7557C0082_impl*
 Result.rWord := aWord;
 Result.rContext := @aContext;
//#UC END# *4FC755E000C9_4FC7557C0082_impl*
end;//TseModalWorker_C

procedure TseModalWorker.Free;
//#UC START# *4FC755BA022E_4FC7557C0082_var*
//#UC END# *4FC755BA022E_4FC7557C0082_var*
begin
//#UC START# *4FC755BA022E_4FC7557C0082_impl*
 // - ������ �� ������ ����
//#UC END# *4FC755BA022E_4FC7557C0082_impl*
end;//TseModalWorker.Free
{$IfEnd} // NOT Defined(NoScripts)

end.
