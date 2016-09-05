unit LeftEditionKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� LeftEdition }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Editions\Forms\LeftEditionKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "LeftEditionKeywordsPack" MUID: (4A6EC02E00EA_Pack)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3IntfUses
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3ImplUses
 , LeftEdition_Form
 , tfwPropertyLike
 , vtPanel
 , tfwScriptingInterfaces
 , TypInfo
 , tfwTypeInfo
 , vtFocusLabel
 , ExtCtrls
 {$If Defined(Nemesis)}
 , nscEditor
 {$IfEnd} // Defined(Nemesis)
 , tfwControlString
 , kwBynameControlPush
 , vtComboBoxQS
 {$If Defined(Nemesis)}
 , nscTextSource
 {$IfEnd} // Defined(Nemesis)
 , TtfwClassRef_Proxy
 , SysUtils
 , TtfwTypeRegistrator_Proxy
 , tfwScriptingTypes
 //#UC START# *4A6EC02E00EA_Packimpl_uses*
 //#UC END# *4A6EC02E00EA_Packimpl_uses*
;

type
 TkwLeftEditionFormHeader = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLeftEditionForm.Header }
  private
   function Header(const aCtx: TtfwContext;
    aLeftEditionForm: TLeftEditionForm): TvtPanel;
    {* ���������� ����� ������� .TLeftEditionForm.Header }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwLeftEditionFormHeader

 TkwLeftEditionFormPnLeft = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLeftEditionForm.pnLeft }
  private
   function pnLeft(const aCtx: TtfwContext;
    aLeftEditionForm: TLeftEditionForm): TvtPanel;
    {* ���������� ����� ������� .TLeftEditionForm.pnLeft }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwLeftEditionFormPnLeft

 TkwLeftEditionFormEditionLink = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLeftEditionForm.EditionLink }
  private
   function EditionLink(const aCtx: TtfwContext;
    aLeftEditionForm: TLeftEditionForm): TvtFocusLabel;
    {* ���������� ����� ������� .TLeftEditionForm.EditionLink }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwLeftEditionFormEditionLink

 TkwLeftEditionFormPbIcon = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLeftEditionForm.pbIcon }
  private
   function pbIcon(const aCtx: TtfwContext;
    aLeftEditionForm: TLeftEditionForm): TPaintBox;
    {* ���������� ����� ������� .TLeftEditionForm.pbIcon }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwLeftEditionFormPbIcon

 TkwLeftEditionFormPnCaption = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLeftEditionForm.pnCaption }
  private
   function pnCaption(const aCtx: TtfwContext;
    aLeftEditionForm: TLeftEditionForm): TvtPanel;
    {* ���������� ����� ������� .TLeftEditionForm.pnCaption }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwLeftEditionFormPnCaption

 TkwLeftEditionFormText = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLeftEditionForm.Text }
  private
   function Text(const aCtx: TtfwContext;
    aLeftEditionForm: TLeftEditionForm): TnscEditor;
    {* ���������� ����� ������� .TLeftEditionForm.Text }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwLeftEditionFormText

 Tkw_Form_LeftEdition = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� LeftEdition
----
*������ �������������*:
[code]�����::LeftEdition TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_Form_LeftEdition

 Tkw_LeftEdition_Control_Header = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� Header
----
*������ �������������*:
[code]�������::Header TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_Header

 Tkw_LeftEdition_Control_Header_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� Header
----
*������ �������������*:
[code]�������::Header:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_Header_Push

 Tkw_LeftEdition_Control_pnLeft = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� pnLeft
----
*������ �������������*:
[code]�������::pnLeft TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_pnLeft

 Tkw_LeftEdition_Control_pnLeft_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� pnLeft
----
*������ �������������*:
[code]�������::pnLeft:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_pnLeft_Push

 Tkw_LeftEdition_Control_EditionLink = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� EditionLink
----
*������ �������������*:
[code]�������::EditionLink TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_EditionLink

 Tkw_LeftEdition_Control_EditionLink_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� EditionLink
----
*������ �������������*:
[code]�������::EditionLink:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_EditionLink_Push

 Tkw_LeftEdition_Control_pbIcon = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� pbIcon
----
*������ �������������*:
[code]�������::pbIcon TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_pbIcon

 Tkw_LeftEdition_Control_pbIcon_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� pbIcon
----
*������ �������������*:
[code]�������::pbIcon:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_pbIcon_Push

 Tkw_LeftEdition_Control_pnCaption = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� pnCaption
----
*������ �������������*:
[code]�������::pnCaption TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_pnCaption

 Tkw_LeftEdition_Control_pnCaption_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� pnCaption
----
*������ �������������*:
[code]�������::pnCaption:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_pnCaption_Push

 Tkw_LeftEdition_Control_EditionChoose = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� EditionChoose
----
*������ �������������*:
[code]�������::EditionChoose TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_EditionChoose

 Tkw_LeftEdition_Control_EditionChoose_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� EditionChoose
----
*������ �������������*:
[code]�������::EditionChoose:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_EditionChoose_Push

 Tkw_LeftEdition_Control_Text = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� Text
----
*������ �������������*:
[code]�������::Text TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_Text

 Tkw_LeftEdition_Control_Text_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� Text
----
*������ �������������*:
[code]�������::Text:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Control_Text_Push

 Tkw_LeftEdition_Component_TextSource = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� TextSource
----
*������ �������������*:
[code]���������::TextSource TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LeftEdition_Component_TextSource

function TkwLeftEditionFormHeader.Header(const aCtx: TtfwContext;
 aLeftEditionForm: TLeftEditionForm): TvtPanel;
 {* ���������� ����� ������� .TLeftEditionForm.Header }
begin
 Result := aLeftEditionForm.Header;
end;//TkwLeftEditionFormHeader.Header

class function TkwLeftEditionFormHeader.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLeftEditionForm.Header';
end;//TkwLeftEditionFormHeader.GetWordNameForRegister

function TkwLeftEditionFormHeader.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwLeftEditionFormHeader.GetResultTypeInfo

function TkwLeftEditionFormHeader.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLeftEditionFormHeader.GetAllParamsCount

function TkwLeftEditionFormHeader.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLeftEditionForm)]);
end;//TkwLeftEditionFormHeader.ParamsTypes

procedure TkwLeftEditionFormHeader.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� Header', aCtx);
end;//TkwLeftEditionFormHeader.SetValuePrim

procedure TkwLeftEditionFormHeader.DoDoIt(const aCtx: TtfwContext);
var l_aLeftEditionForm: TLeftEditionForm;
begin
 try
  l_aLeftEditionForm := TLeftEditionForm(aCtx.rEngine.PopObjAs(TLeftEditionForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLeftEditionForm: TLeftEditionForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(Header(aCtx, l_aLeftEditionForm));
end;//TkwLeftEditionFormHeader.DoDoIt

function TkwLeftEditionFormPnLeft.pnLeft(const aCtx: TtfwContext;
 aLeftEditionForm: TLeftEditionForm): TvtPanel;
 {* ���������� ����� ������� .TLeftEditionForm.pnLeft }
begin
 Result := aLeftEditionForm.pnLeft;
end;//TkwLeftEditionFormPnLeft.pnLeft

class function TkwLeftEditionFormPnLeft.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLeftEditionForm.pnLeft';
end;//TkwLeftEditionFormPnLeft.GetWordNameForRegister

function TkwLeftEditionFormPnLeft.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwLeftEditionFormPnLeft.GetResultTypeInfo

function TkwLeftEditionFormPnLeft.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLeftEditionFormPnLeft.GetAllParamsCount

function TkwLeftEditionFormPnLeft.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLeftEditionForm)]);
end;//TkwLeftEditionFormPnLeft.ParamsTypes

procedure TkwLeftEditionFormPnLeft.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� pnLeft', aCtx);
end;//TkwLeftEditionFormPnLeft.SetValuePrim

procedure TkwLeftEditionFormPnLeft.DoDoIt(const aCtx: TtfwContext);
var l_aLeftEditionForm: TLeftEditionForm;
begin
 try
  l_aLeftEditionForm := TLeftEditionForm(aCtx.rEngine.PopObjAs(TLeftEditionForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLeftEditionForm: TLeftEditionForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(pnLeft(aCtx, l_aLeftEditionForm));
end;//TkwLeftEditionFormPnLeft.DoDoIt

function TkwLeftEditionFormEditionLink.EditionLink(const aCtx: TtfwContext;
 aLeftEditionForm: TLeftEditionForm): TvtFocusLabel;
 {* ���������� ����� ������� .TLeftEditionForm.EditionLink }
begin
 Result := aLeftEditionForm.EditionLink;
end;//TkwLeftEditionFormEditionLink.EditionLink

class function TkwLeftEditionFormEditionLink.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLeftEditionForm.EditionLink';
end;//TkwLeftEditionFormEditionLink.GetWordNameForRegister

function TkwLeftEditionFormEditionLink.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtFocusLabel);
end;//TkwLeftEditionFormEditionLink.GetResultTypeInfo

function TkwLeftEditionFormEditionLink.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLeftEditionFormEditionLink.GetAllParamsCount

function TkwLeftEditionFormEditionLink.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLeftEditionForm)]);
end;//TkwLeftEditionFormEditionLink.ParamsTypes

procedure TkwLeftEditionFormEditionLink.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� EditionLink', aCtx);
end;//TkwLeftEditionFormEditionLink.SetValuePrim

procedure TkwLeftEditionFormEditionLink.DoDoIt(const aCtx: TtfwContext);
var l_aLeftEditionForm: TLeftEditionForm;
begin
 try
  l_aLeftEditionForm := TLeftEditionForm(aCtx.rEngine.PopObjAs(TLeftEditionForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLeftEditionForm: TLeftEditionForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(EditionLink(aCtx, l_aLeftEditionForm));
end;//TkwLeftEditionFormEditionLink.DoDoIt

function TkwLeftEditionFormPbIcon.pbIcon(const aCtx: TtfwContext;
 aLeftEditionForm: TLeftEditionForm): TPaintBox;
 {* ���������� ����� ������� .TLeftEditionForm.pbIcon }
begin
 Result := aLeftEditionForm.pbIcon;
end;//TkwLeftEditionFormPbIcon.pbIcon

class function TkwLeftEditionFormPbIcon.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLeftEditionForm.pbIcon';
end;//TkwLeftEditionFormPbIcon.GetWordNameForRegister

function TkwLeftEditionFormPbIcon.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TPaintBox);
end;//TkwLeftEditionFormPbIcon.GetResultTypeInfo

function TkwLeftEditionFormPbIcon.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLeftEditionFormPbIcon.GetAllParamsCount

function TkwLeftEditionFormPbIcon.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLeftEditionForm)]);
end;//TkwLeftEditionFormPbIcon.ParamsTypes

procedure TkwLeftEditionFormPbIcon.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� pbIcon', aCtx);
end;//TkwLeftEditionFormPbIcon.SetValuePrim

procedure TkwLeftEditionFormPbIcon.DoDoIt(const aCtx: TtfwContext);
var l_aLeftEditionForm: TLeftEditionForm;
begin
 try
  l_aLeftEditionForm := TLeftEditionForm(aCtx.rEngine.PopObjAs(TLeftEditionForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLeftEditionForm: TLeftEditionForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(pbIcon(aCtx, l_aLeftEditionForm));
end;//TkwLeftEditionFormPbIcon.DoDoIt

function TkwLeftEditionFormPnCaption.pnCaption(const aCtx: TtfwContext;
 aLeftEditionForm: TLeftEditionForm): TvtPanel;
 {* ���������� ����� ������� .TLeftEditionForm.pnCaption }
begin
 Result := aLeftEditionForm.pnCaption;
end;//TkwLeftEditionFormPnCaption.pnCaption

class function TkwLeftEditionFormPnCaption.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLeftEditionForm.pnCaption';
end;//TkwLeftEditionFormPnCaption.GetWordNameForRegister

function TkwLeftEditionFormPnCaption.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwLeftEditionFormPnCaption.GetResultTypeInfo

function TkwLeftEditionFormPnCaption.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLeftEditionFormPnCaption.GetAllParamsCount

function TkwLeftEditionFormPnCaption.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLeftEditionForm)]);
end;//TkwLeftEditionFormPnCaption.ParamsTypes

procedure TkwLeftEditionFormPnCaption.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� pnCaption', aCtx);
end;//TkwLeftEditionFormPnCaption.SetValuePrim

procedure TkwLeftEditionFormPnCaption.DoDoIt(const aCtx: TtfwContext);
var l_aLeftEditionForm: TLeftEditionForm;
begin
 try
  l_aLeftEditionForm := TLeftEditionForm(aCtx.rEngine.PopObjAs(TLeftEditionForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLeftEditionForm: TLeftEditionForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(pnCaption(aCtx, l_aLeftEditionForm));
end;//TkwLeftEditionFormPnCaption.DoDoIt

function TkwLeftEditionFormText.Text(const aCtx: TtfwContext;
 aLeftEditionForm: TLeftEditionForm): TnscEditor;
 {* ���������� ����� ������� .TLeftEditionForm.Text }
begin
 Result := aLeftEditionForm.Text;
end;//TkwLeftEditionFormText.Text

class function TkwLeftEditionFormText.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLeftEditionForm.Text';
end;//TkwLeftEditionFormText.GetWordNameForRegister

function TkwLeftEditionFormText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscEditor);
end;//TkwLeftEditionFormText.GetResultTypeInfo

function TkwLeftEditionFormText.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLeftEditionFormText.GetAllParamsCount

function TkwLeftEditionFormText.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLeftEditionForm)]);
end;//TkwLeftEditionFormText.ParamsTypes

procedure TkwLeftEditionFormText.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� Text', aCtx);
end;//TkwLeftEditionFormText.SetValuePrim

procedure TkwLeftEditionFormText.DoDoIt(const aCtx: TtfwContext);
var l_aLeftEditionForm: TLeftEditionForm;
begin
 try
  l_aLeftEditionForm := TLeftEditionForm(aCtx.rEngine.PopObjAs(TLeftEditionForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLeftEditionForm: TLeftEditionForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(Text(aCtx, l_aLeftEditionForm));
end;//TkwLeftEditionFormText.DoDoIt

function Tkw_Form_LeftEdition.GetString: AnsiString;
begin
 Result := 'LeftEditionForm';
end;//Tkw_Form_LeftEdition.GetString

class procedure Tkw_Form_LeftEdition.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TLeftEditionForm);
end;//Tkw_Form_LeftEdition.RegisterInEngine

class function Tkw_Form_LeftEdition.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::LeftEdition';
end;//Tkw_Form_LeftEdition.GetWordNameForRegister

function Tkw_LeftEdition_Control_Header.GetString: AnsiString;
begin
 Result := 'Header';
end;//Tkw_LeftEdition_Control_Header.GetString

class procedure Tkw_LeftEdition_Control_Header.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_LeftEdition_Control_Header.RegisterInEngine

class function Tkw_LeftEdition_Control_Header.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Header';
end;//Tkw_LeftEdition_Control_Header.GetWordNameForRegister

procedure Tkw_LeftEdition_Control_Header_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('Header');
 inherited;
end;//Tkw_LeftEdition_Control_Header_Push.DoDoIt

class function Tkw_LeftEdition_Control_Header_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Header:push';
end;//Tkw_LeftEdition_Control_Header_Push.GetWordNameForRegister

function Tkw_LeftEdition_Control_pnLeft.GetString: AnsiString;
begin
 Result := 'pnLeft';
end;//Tkw_LeftEdition_Control_pnLeft.GetString

class procedure Tkw_LeftEdition_Control_pnLeft.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_LeftEdition_Control_pnLeft.RegisterInEngine

class function Tkw_LeftEdition_Control_pnLeft.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::pnLeft';
end;//Tkw_LeftEdition_Control_pnLeft.GetWordNameForRegister

procedure Tkw_LeftEdition_Control_pnLeft_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('pnLeft');
 inherited;
end;//Tkw_LeftEdition_Control_pnLeft_Push.DoDoIt

class function Tkw_LeftEdition_Control_pnLeft_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::pnLeft:push';
end;//Tkw_LeftEdition_Control_pnLeft_Push.GetWordNameForRegister

function Tkw_LeftEdition_Control_EditionLink.GetString: AnsiString;
begin
 Result := 'EditionLink';
end;//Tkw_LeftEdition_Control_EditionLink.GetString

class procedure Tkw_LeftEdition_Control_EditionLink.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtFocusLabel);
end;//Tkw_LeftEdition_Control_EditionLink.RegisterInEngine

class function Tkw_LeftEdition_Control_EditionLink.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::EditionLink';
end;//Tkw_LeftEdition_Control_EditionLink.GetWordNameForRegister

procedure Tkw_LeftEdition_Control_EditionLink_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('EditionLink');
 inherited;
end;//Tkw_LeftEdition_Control_EditionLink_Push.DoDoIt

class function Tkw_LeftEdition_Control_EditionLink_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::EditionLink:push';
end;//Tkw_LeftEdition_Control_EditionLink_Push.GetWordNameForRegister

function Tkw_LeftEdition_Control_pbIcon.GetString: AnsiString;
begin
 Result := 'pbIcon';
end;//Tkw_LeftEdition_Control_pbIcon.GetString

class procedure Tkw_LeftEdition_Control_pbIcon.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TPaintBox);
end;//Tkw_LeftEdition_Control_pbIcon.RegisterInEngine

class function Tkw_LeftEdition_Control_pbIcon.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::pbIcon';
end;//Tkw_LeftEdition_Control_pbIcon.GetWordNameForRegister

procedure Tkw_LeftEdition_Control_pbIcon_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('pbIcon');
 inherited;
end;//Tkw_LeftEdition_Control_pbIcon_Push.DoDoIt

class function Tkw_LeftEdition_Control_pbIcon_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::pbIcon:push';
end;//Tkw_LeftEdition_Control_pbIcon_Push.GetWordNameForRegister

function Tkw_LeftEdition_Control_pnCaption.GetString: AnsiString;
begin
 Result := 'pnCaption';
end;//Tkw_LeftEdition_Control_pnCaption.GetString

class procedure Tkw_LeftEdition_Control_pnCaption.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_LeftEdition_Control_pnCaption.RegisterInEngine

class function Tkw_LeftEdition_Control_pnCaption.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::pnCaption';
end;//Tkw_LeftEdition_Control_pnCaption.GetWordNameForRegister

procedure Tkw_LeftEdition_Control_pnCaption_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('pnCaption');
 inherited;
end;//Tkw_LeftEdition_Control_pnCaption_Push.DoDoIt

class function Tkw_LeftEdition_Control_pnCaption_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::pnCaption:push';
end;//Tkw_LeftEdition_Control_pnCaption_Push.GetWordNameForRegister

function Tkw_LeftEdition_Control_EditionChoose.GetString: AnsiString;
begin
 Result := 'EditionChoose';
end;//Tkw_LeftEdition_Control_EditionChoose.GetString

class procedure Tkw_LeftEdition_Control_EditionChoose.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtComboBoxQS);
end;//Tkw_LeftEdition_Control_EditionChoose.RegisterInEngine

class function Tkw_LeftEdition_Control_EditionChoose.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::EditionChoose';
end;//Tkw_LeftEdition_Control_EditionChoose.GetWordNameForRegister

procedure Tkw_LeftEdition_Control_EditionChoose_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('EditionChoose');
 inherited;
end;//Tkw_LeftEdition_Control_EditionChoose_Push.DoDoIt

class function Tkw_LeftEdition_Control_EditionChoose_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::EditionChoose:push';
end;//Tkw_LeftEdition_Control_EditionChoose_Push.GetWordNameForRegister

function Tkw_LeftEdition_Control_Text.GetString: AnsiString;
begin
 Result := 'Text';
end;//Tkw_LeftEdition_Control_Text.GetString

class procedure Tkw_LeftEdition_Control_Text.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscEditor);
end;//Tkw_LeftEdition_Control_Text.RegisterInEngine

class function Tkw_LeftEdition_Control_Text.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Text';
end;//Tkw_LeftEdition_Control_Text.GetWordNameForRegister

procedure Tkw_LeftEdition_Control_Text_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('Text');
 inherited;
end;//Tkw_LeftEdition_Control_Text_Push.DoDoIt

class function Tkw_LeftEdition_Control_Text_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Text:push';
end;//Tkw_LeftEdition_Control_Text_Push.GetWordNameForRegister

function Tkw_LeftEdition_Component_TextSource.GetString: AnsiString;
begin
 Result := 'TextSource';
end;//Tkw_LeftEdition_Component_TextSource.GetString

class procedure Tkw_LeftEdition_Component_TextSource.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscTextSource);
end;//Tkw_LeftEdition_Component_TextSource.RegisterInEngine

class function Tkw_LeftEdition_Component_TextSource.GetWordNameForRegister: AnsiString;
begin
 Result := '���������::TextSource';
end;//Tkw_LeftEdition_Component_TextSource.GetWordNameForRegister

initialization
 TkwLeftEditionFormHeader.RegisterInEngine;
 {* ����������� LeftEditionForm_Header }
 TkwLeftEditionFormPnLeft.RegisterInEngine;
 {* ����������� LeftEditionForm_pnLeft }
 TkwLeftEditionFormEditionLink.RegisterInEngine;
 {* ����������� LeftEditionForm_EditionLink }
 TkwLeftEditionFormPbIcon.RegisterInEngine;
 {* ����������� LeftEditionForm_pbIcon }
 TkwLeftEditionFormPnCaption.RegisterInEngine;
 {* ����������� LeftEditionForm_pnCaption }
 TkwLeftEditionFormText.RegisterInEngine;
 {* ����������� LeftEditionForm_Text }
 Tkw_Form_LeftEdition.RegisterInEngine;
 {* ����������� Tkw_Form_LeftEdition }
 Tkw_LeftEdition_Control_Header.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_Header }
 Tkw_LeftEdition_Control_Header_Push.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_Header_Push }
 Tkw_LeftEdition_Control_pnLeft.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_pnLeft }
 Tkw_LeftEdition_Control_pnLeft_Push.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_pnLeft_Push }
 Tkw_LeftEdition_Control_EditionLink.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_EditionLink }
 Tkw_LeftEdition_Control_EditionLink_Push.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_EditionLink_Push }
 Tkw_LeftEdition_Control_pbIcon.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_pbIcon }
 Tkw_LeftEdition_Control_pbIcon_Push.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_pbIcon_Push }
 Tkw_LeftEdition_Control_pnCaption.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_pnCaption }
 Tkw_LeftEdition_Control_pnCaption_Push.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_pnCaption_Push }
 Tkw_LeftEdition_Control_EditionChoose.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_EditionChoose }
 Tkw_LeftEdition_Control_EditionChoose_Push.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_EditionChoose_Push }
 Tkw_LeftEdition_Control_Text.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_Text }
 Tkw_LeftEdition_Control_Text_Push.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Control_Text_Push }
 Tkw_LeftEdition_Component_TextSource.RegisterInEngine;
 {* ����������� Tkw_LeftEdition_Component_TextSource }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TLeftEditionForm));
 {* ����������� ���� TLeftEditionForm }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtPanel));
 {* ����������� ���� TvtPanel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtFocusLabel));
 {* ����������� ���� TvtFocusLabel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TPaintBox));
 {* ����������� ���� TPaintBox }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscEditor));
 {* ����������� ���� TnscEditor }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)

end.
