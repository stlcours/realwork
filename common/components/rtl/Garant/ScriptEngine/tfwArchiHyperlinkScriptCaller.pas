unit tfwArchiHyperlinkScriptCaller;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\tfwArchiHyperlinkScriptCaller.pas"
// ���������: "SimpleClass"
// ������� ������: "TtfwArchiHyperlinkScriptCaller" MUID: (55D34A7E0127)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwHyperlinkScriptCaller
;

type
 TtfwArchiHyperlinkScriptCaller = class(TtfwHyperlinkScriptCaller)
  public
   class function DoResolveIncludedFilePath(const aFile: AnsiString): AnsiString; override;
 end;//TtfwArchiHyperlinkScriptCaller
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwAxiomaticsResNameGetter
 //#UC START# *55D34A7E0127impl_uses*
 //#UC END# *55D34A7E0127impl_uses*
;

type
 TtfwArchiHyperlinkScriptCallerResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* ����������� ������������ ����������� }
  public
   class function ResName: AnsiString; override;
 end;//TtfwArchiHyperlinkScriptCallerResNameGetter

class function TtfwArchiHyperlinkScriptCallerResNameGetter.ResName: AnsiString;
begin
 Result := 'tfwArchiHyperlinkScriptCaller';
end;//TtfwArchiHyperlinkScriptCallerResNameGetter.ResName

{$R tfwArchiHyperlinkScriptCaller.res}

class function TtfwArchiHyperlinkScriptCaller.DoResolveIncludedFilePath(const aFile: AnsiString): AnsiString;
//#UC START# *55D34AD90105_55D34A7E0127_var*
//#UC END# *55D34AD90105_55D34A7E0127_var*
begin
//#UC START# *55D34AD90105_55D34A7E0127_impl*
 Result := inherited DoResolveIncludedFilePath(aFile);
//#UC END# *55D34AD90105_55D34A7E0127_impl*
end;//TtfwArchiHyperlinkScriptCaller.DoResolveIncludedFilePath

initialization
 TtfwArchiHyperlinkScriptCallerResNameGetter.Register;
 {* ����������� ������������ ����������� }
{$IfEnd} // NOT Defined(NoScripts)

end.
