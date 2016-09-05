unit kwSubdescriptorGetDocumentBitmapIndex;
 {* �������� � ���� ������ ������ ��� ����������� ����� ���������.
������:
[code]
aSubDescrObj subdescriptor:GetDocumentBitmapIndex
[code] }

// ������: "w:\common\components\rtl\Garant\ScriptEngine\kwSubdescriptorGetDocumentBitmapIndex.pas"
// ���������: "ScriptKeyword"
// ������� ������: "subdescriptor_GetDocumentBitmapIndex" MUID: (52D660C703AC)
// ��� ����: "TkwSubdescriptorGetDocumentBitmapIndex"

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , kwSubDescriptorFromStackWord
 , evSubPn
 , tfwScriptingInterfaces
;

type
 TkwSubdescriptorGetDocumentBitmapIndex = {final} class(TkwSubDescriptorFromStackWord)
  {* �������� � ���� ������ ������ ��� ����������� ����� ���������.
������:
[code]
aSubDescrObj subdescriptor:GetDocumentBitmapIndex
[code] }
  protected
   procedure DoWithSubDescriptor(aControl: TevSubDescriptor;
    const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSubdescriptorGetDocumentBitmapIndex
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 //#UC START# *52D660C703ACimpl_uses*
 //#UC END# *52D660C703ACimpl_uses*
;

procedure TkwSubdescriptorGetDocumentBitmapIndex.DoWithSubDescriptor(aControl: TevSubDescriptor;
 const aCtx: TtfwContext);
//#UC START# *52D65E9502E1_52D660C703AC_var*
//#UC END# *52D65E9502E1_52D660C703AC_var*
begin
//#UC START# *52D65E9502E1_52D660C703AC_impl*
 aCtx.rEngine.PushInt(aControl.DocumentBitmapIndex);
//#UC END# *52D65E9502E1_52D660C703AC_impl*
end;//TkwSubdescriptorGetDocumentBitmapIndex.DoWithSubDescriptor

class function TkwSubdescriptorGetDocumentBitmapIndex.GetWordNameForRegister: AnsiString;
begin
 Result := 'subdescriptor:GetDocumentBitmapIndex';
end;//TkwSubdescriptorGetDocumentBitmapIndex.GetWordNameForRegister

initialization
 TkwSubdescriptorGetDocumentBitmapIndex.RegisterInEngine;
 {* ����������� subdescriptor_GetDocumentBitmapIndex }
{$IfEnd} // NOT Defined(NoScripts)

end.
