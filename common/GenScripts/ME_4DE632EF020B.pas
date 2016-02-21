unit kwArchiCloseDocument;
 {* *������:* �������
*��������:* ��������� ������� �������� ���� � ����. � �������� ���� ����� ��������� ���� ���������, ���� ��������� ���������, ���� �������� � �.�.
 *������:*
[code]
 '76.bmp' �������_���������_�����_��
 TRY
   carPictureViewer TryFocus ASSERT
   acCut arMainActionList carMainForm Action:Execute
   ProcessMessages
   acPaste arMainActionList carMainForm Action:Execute
   ProcessMessages
 FINALLY
  wait:No
  �������
  waited:? ASSERT
 END
[code]
 *���������:*
 ������� ��������� ����� �� ������������ �����, ��������� � ���� ����� �������� �������� (� ������ ������, �����������/������� ��������� �/�� ������ ������) � ��������� �������� ��� ������� � ������������� ����������.
*����������:*
 � �������� �������� ����������� �� ������������, ��� ��� ���� ����� ������� ������� � �����:
[code]
 w:\archi\source\projects\Archi\TestSet\Dictionary\MainFormUtils.script"
[code] }

// ������: "w:\archi\source\projects\Archi\Archi_Insider_Test_Support\kwArchiCloseDocument.pas"
// ���������: "ScriptKeyword"

{$Include w:\archi\source\projects\Archi\arDefine.inc}

interface

{$If Defined(nsTest) AND Defined(InsiderTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwRegisterableWord
 , tfwScriptingInterfaces
;

type
 TkwArchiCloseDocument = class(TtfwRegisterableWord)
  {* *������:* �������
*��������:* ��������� ������� �������� ���� � ����. � �������� ���� ����� ��������� ���� ���������, ���� ��������� ���������, ���� �������� � �.�.
 *������:*
[code]
 '76.bmp' �������_���������_�����_��
 TRY
   carPictureViewer TryFocus ASSERT
   acCut arMainActionList carMainForm Action:Execute
   ProcessMessages
   acPaste arMainActionList carMainForm Action:Execute
   ProcessMessages
 FINALLY
  wait:No
  �������
  waited:? ASSERT
 END
[code]
 *���������:*
 ������� ��������� ����� �� ������������ �����, ��������� � ���� ����� �������� �������� (� ������ ������, �����������/������� ��������� �/�� ������ ������) � ��������� �������� ��� ������� � ������������� ����������.
*����������:*
 � �������� �������� ����������� �� ������������, ��� ��� ���� ����� ������� ������� � �����:
[code]
 w:\archi\source\projects\Archi\TestSet\Dictionary\MainFormUtils.script"
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwArchiCloseDocument
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , arArchiTestsAdapter
;

procedure TkwArchiCloseDocument.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DE632EF020B_var*
//#UC END# *4DAEEDE10285_4DE632EF020B_var*
begin
//#UC START# *4DAEEDE10285_4DE632EF020B_impl*
 aCtx.rCaller.Check(arCloseActiveDocument);
//#UC END# *4DAEEDE10285_4DE632EF020B_impl*
end;//TkwArchiCloseDocument.DoDoIt

class function TkwArchiCloseDocument.GetWordNameForRegister: AnsiString;
begin
 Result := '�������';
end;//TkwArchiCloseDocument.GetWordNameForRegister

initialization
 TkwArchiCloseDocument.RegisterInEngine;
 {* ����������� TkwArchiCloseDocument }
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest) AND NOT Defined(NoScripts)

end.
