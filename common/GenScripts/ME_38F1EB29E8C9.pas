unit StyleEditorContainerKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� StyleEditorContainer }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Settings\StyleEditorContainerKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , Settings_Module
 , vtProportionalPanel
 , vtPanel
 , vtSizeablePanel
 , tfwControlString
 {$If NOT Defined(NoVCL)}
 , kwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 , tfwScriptingInterfaces
 , tfwPropertyLike
 , tfwTypeInfo
 , TypInfo
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , TtfwClassRef_Proxy
 , SysUtils
;

type
 Tkw_Form_StyleEditorContainer = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� StyleEditorContainer
----
*������ �������������*:
[code]
'aControl' �����::StyleEditorContainer TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
 end;//Tkw_Form_StyleEditorContainer

 Tkw_StyleEditorContainer_Control_BackgroundPanel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� BackgroundPanel
----
*������ �������������*:
[code]
�������::BackgroundPanel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_StyleEditorContainer_Control_BackgroundPanel

 Tkw_StyleEditorContainer_Control_BackgroundPanel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� BackgroundPanel
----
*������ �������������*:
[code]
�������::BackgroundPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_StyleEditorContainer_Control_BackgroundPanel_Push

 Tkw_StyleEditorContainer_Control_MainZone = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� MainZone
----
*������ �������������*:
[code]
�������::MainZone TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_StyleEditorContainer_Control_MainZone

 Tkw_StyleEditorContainer_Control_MainZone_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� MainZone
----
*������ �������������*:
[code]
�������::MainZone:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_StyleEditorContainer_Control_MainZone_Push

 Tkw_StyleEditorContainer_Control_ParentZone = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ParentZone
----
*������ �������������*:
[code]
�������::ParentZone TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_StyleEditorContainer_Control_ParentZone

 Tkw_StyleEditorContainer_Control_ParentZone_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� ParentZone
----
*������ �������������*:
[code]
�������::ParentZone:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_StyleEditorContainer_Control_ParentZone_Push

 Tkw_StyleEditorContainer_Control_ChildZone = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ChildZone
----
*������ �������������*:
[code]
�������::ChildZone TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_StyleEditorContainer_Control_ChildZone

 Tkw_StyleEditorContainer_Control_ChildZone_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� ChildZone
----
*������ �������������*:
[code]
�������::ChildZone:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_StyleEditorContainer_Control_ChildZone_Push

 Tkw_StyleEditorContainer_Control_NavigatorZone = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� NavigatorZone
----
*������ �������������*:
[code]
�������::NavigatorZone TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_StyleEditorContainer_Control_NavigatorZone

 Tkw_StyleEditorContainer_Control_NavigatorZone_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� NavigatorZone
----
*������ �������������*:
[code]
�������::NavigatorZone:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_StyleEditorContainer_Control_NavigatorZone_Push

 TkwStyleEditorContainerFormBackgroundPanel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TStyleEditorContainerForm.BackgroundPanel
[panel]������� BackgroundPanel ����� TStyleEditorContainerForm[panel]
*��� ����������:* TvtProportionalPanel
*������:*
[code]
OBJECT VAR l_TvtProportionalPanel
 aStyleEditorContainerForm .TStyleEditorContainerForm.BackgroundPanel >>> l_TvtProportionalPanel
[code]  }
  private
   function BackgroundPanel(const aCtx: TtfwContext;
    aStyleEditorContainerForm: TStyleEditorContainerForm): TvtProportionalPanel;
    {* ���������� ����� ������� .TStyleEditorContainerForm.BackgroundPanel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwStyleEditorContainerFormBackgroundPanel

 TkwStyleEditorContainerFormMainZone = {final} class(TtfwPropertyLike)
  {* ����� ������� .TStyleEditorContainerForm.MainZone
[panel]������� MainZone ����� TStyleEditorContainerForm[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aStyleEditorContainerForm .TStyleEditorContainerForm.MainZone >>> l_TvtPanel
[code]  }
  private
   function MainZone(const aCtx: TtfwContext;
    aStyleEditorContainerForm: TStyleEditorContainerForm): TvtPanel;
    {* ���������� ����� ������� .TStyleEditorContainerForm.MainZone }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwStyleEditorContainerFormMainZone

 TkwStyleEditorContainerFormParentZone = {final} class(TtfwPropertyLike)
  {* ����� ������� .TStyleEditorContainerForm.ParentZone
[panel]������� ParentZone ����� TStyleEditorContainerForm[panel]
*��� ����������:* TvtSizeablePanel
*������:*
[code]
OBJECT VAR l_TvtSizeablePanel
 aStyleEditorContainerForm .TStyleEditorContainerForm.ParentZone >>> l_TvtSizeablePanel
[code]  }
  private
   function ParentZone(const aCtx: TtfwContext;
    aStyleEditorContainerForm: TStyleEditorContainerForm): TvtSizeablePanel;
    {* ���������� ����� ������� .TStyleEditorContainerForm.ParentZone }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwStyleEditorContainerFormParentZone

 TkwStyleEditorContainerFormChildZone = {final} class(TtfwPropertyLike)
  {* ����� ������� .TStyleEditorContainerForm.ChildZone
[panel]������� ChildZone ����� TStyleEditorContainerForm[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aStyleEditorContainerForm .TStyleEditorContainerForm.ChildZone >>> l_TvtPanel
[code]  }
  private
   function ChildZone(const aCtx: TtfwContext;
    aStyleEditorContainerForm: TStyleEditorContainerForm): TvtPanel;
    {* ���������� ����� ������� .TStyleEditorContainerForm.ChildZone }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwStyleEditorContainerFormChildZone

 TkwStyleEditorContainerFormNavigatorZone = {final} class(TtfwPropertyLike)
  {* ����� ������� .TStyleEditorContainerForm.NavigatorZone
[panel]������� NavigatorZone ����� TStyleEditorContainerForm[panel]
*��� ����������:* TvtSizeablePanel
*������:*
[code]
OBJECT VAR l_TvtSizeablePanel
 aStyleEditorContainerForm .TStyleEditorContainerForm.NavigatorZone >>> l_TvtSizeablePanel
[code]  }
  private
   function NavigatorZone(const aCtx: TtfwContext;
    aStyleEditorContainerForm: TStyleEditorContainerForm): TvtSizeablePanel;
    {* ���������� ����� ������� .TStyleEditorContainerForm.NavigatorZone }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwStyleEditorContainerFormNavigatorZone

class function Tkw_Form_StyleEditorContainer.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::StyleEditorContainer';
end;//Tkw_Form_StyleEditorContainer.GetWordNameForRegister

function Tkw_Form_StyleEditorContainer.GetString: AnsiString;
begin
 Result := 'StyleEditorContainerForm';
end;//Tkw_Form_StyleEditorContainer.GetString

class function Tkw_StyleEditorContainer_Control_BackgroundPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::BackgroundPanel';
end;//Tkw_StyleEditorContainer_Control_BackgroundPanel.GetWordNameForRegister

function Tkw_StyleEditorContainer_Control_BackgroundPanel.GetString: AnsiString;
begin
 Result := 'BackgroundPanel';
end;//Tkw_StyleEditorContainer_Control_BackgroundPanel.GetString

class procedure Tkw_StyleEditorContainer_Control_BackgroundPanel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtProportionalPanel);
end;//Tkw_StyleEditorContainer_Control_BackgroundPanel.RegisterInEngine

procedure Tkw_StyleEditorContainer_Control_BackgroundPanel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_A9487958C12C_var*
//#UC END# *4DAEEDE10285_A9487958C12C_var*
begin
//#UC START# *4DAEEDE10285_A9487958C12C_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_A9487958C12C_impl*
end;//Tkw_StyleEditorContainer_Control_BackgroundPanel_Push.DoDoIt

class function Tkw_StyleEditorContainer_Control_BackgroundPanel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::BackgroundPanel:push';
end;//Tkw_StyleEditorContainer_Control_BackgroundPanel_Push.GetWordNameForRegister

class function Tkw_StyleEditorContainer_Control_MainZone.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::MainZone';
end;//Tkw_StyleEditorContainer_Control_MainZone.GetWordNameForRegister

function Tkw_StyleEditorContainer_Control_MainZone.GetString: AnsiString;
begin
 Result := 'MainZone';
end;//Tkw_StyleEditorContainer_Control_MainZone.GetString

class procedure Tkw_StyleEditorContainer_Control_MainZone.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_StyleEditorContainer_Control_MainZone.RegisterInEngine

procedure Tkw_StyleEditorContainer_Control_MainZone_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_15A257ADED1A_var*
//#UC END# *4DAEEDE10285_15A257ADED1A_var*
begin
//#UC START# *4DAEEDE10285_15A257ADED1A_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_15A257ADED1A_impl*
end;//Tkw_StyleEditorContainer_Control_MainZone_Push.DoDoIt

class function Tkw_StyleEditorContainer_Control_MainZone_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::MainZone:push';
end;//Tkw_StyleEditorContainer_Control_MainZone_Push.GetWordNameForRegister

class function Tkw_StyleEditorContainer_Control_ParentZone.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ParentZone';
end;//Tkw_StyleEditorContainer_Control_ParentZone.GetWordNameForRegister

function Tkw_StyleEditorContainer_Control_ParentZone.GetString: AnsiString;
begin
 Result := 'ParentZone';
end;//Tkw_StyleEditorContainer_Control_ParentZone.GetString

class procedure Tkw_StyleEditorContainer_Control_ParentZone.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtSizeablePanel);
end;//Tkw_StyleEditorContainer_Control_ParentZone.RegisterInEngine

procedure Tkw_StyleEditorContainer_Control_ParentZone_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_026D2678402C_var*
//#UC END# *4DAEEDE10285_026D2678402C_var*
begin
//#UC START# *4DAEEDE10285_026D2678402C_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_026D2678402C_impl*
end;//Tkw_StyleEditorContainer_Control_ParentZone_Push.DoDoIt

class function Tkw_StyleEditorContainer_Control_ParentZone_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ParentZone:push';
end;//Tkw_StyleEditorContainer_Control_ParentZone_Push.GetWordNameForRegister

class function Tkw_StyleEditorContainer_Control_ChildZone.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ChildZone';
end;//Tkw_StyleEditorContainer_Control_ChildZone.GetWordNameForRegister

function Tkw_StyleEditorContainer_Control_ChildZone.GetString: AnsiString;
begin
 Result := 'ChildZone';
end;//Tkw_StyleEditorContainer_Control_ChildZone.GetString

class procedure Tkw_StyleEditorContainer_Control_ChildZone.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_StyleEditorContainer_Control_ChildZone.RegisterInEngine

procedure Tkw_StyleEditorContainer_Control_ChildZone_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_C9AD090A5305_var*
//#UC END# *4DAEEDE10285_C9AD090A5305_var*
begin
//#UC START# *4DAEEDE10285_C9AD090A5305_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_C9AD090A5305_impl*
end;//Tkw_StyleEditorContainer_Control_ChildZone_Push.DoDoIt

class function Tkw_StyleEditorContainer_Control_ChildZone_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ChildZone:push';
end;//Tkw_StyleEditorContainer_Control_ChildZone_Push.GetWordNameForRegister

class function Tkw_StyleEditorContainer_Control_NavigatorZone.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::NavigatorZone';
end;//Tkw_StyleEditorContainer_Control_NavigatorZone.GetWordNameForRegister

function Tkw_StyleEditorContainer_Control_NavigatorZone.GetString: AnsiString;
begin
 Result := 'NavigatorZone';
end;//Tkw_StyleEditorContainer_Control_NavigatorZone.GetString

class procedure Tkw_StyleEditorContainer_Control_NavigatorZone.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtSizeablePanel);
end;//Tkw_StyleEditorContainer_Control_NavigatorZone.RegisterInEngine

procedure Tkw_StyleEditorContainer_Control_NavigatorZone_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_37F21FB3BC72_var*
//#UC END# *4DAEEDE10285_37F21FB3BC72_var*
begin
//#UC START# *4DAEEDE10285_37F21FB3BC72_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_37F21FB3BC72_impl*
end;//Tkw_StyleEditorContainer_Control_NavigatorZone_Push.DoDoIt

class function Tkw_StyleEditorContainer_Control_NavigatorZone_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::NavigatorZone:push';
end;//Tkw_StyleEditorContainer_Control_NavigatorZone_Push.GetWordNameForRegister

function TkwStyleEditorContainerFormBackgroundPanel.BackgroundPanel(const aCtx: TtfwContext;
 aStyleEditorContainerForm: TStyleEditorContainerForm): TvtProportionalPanel;
 {* ���������� ����� ������� .TStyleEditorContainerForm.BackgroundPanel }
begin
 Result := aStyleEditorContainerForm.BackgroundPanel;
end;//TkwStyleEditorContainerFormBackgroundPanel.BackgroundPanel

procedure TkwStyleEditorContainerFormBackgroundPanel.DoDoIt(const aCtx: TtfwContext);
var l_aStyleEditorContainerForm: TStyleEditorContainerForm;
begin
 try
  l_aStyleEditorContainerForm := TStyleEditorContainerForm(aCtx.rEngine.PopObjAs(TStyleEditorContainerForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aStyleEditorContainerForm: TStyleEditorContainerForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(BackgroundPanel(aCtx, l_aStyleEditorContainerForm));
end;//TkwStyleEditorContainerFormBackgroundPanel.DoDoIt

class function TkwStyleEditorContainerFormBackgroundPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TStyleEditorContainerForm.BackgroundPanel';
end;//TkwStyleEditorContainerFormBackgroundPanel.GetWordNameForRegister

procedure TkwStyleEditorContainerFormBackgroundPanel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� BackgroundPanel', aCtx);
end;//TkwStyleEditorContainerFormBackgroundPanel.SetValuePrim

function TkwStyleEditorContainerFormBackgroundPanel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtProportionalPanel);
end;//TkwStyleEditorContainerFormBackgroundPanel.GetResultTypeInfo

function TkwStyleEditorContainerFormBackgroundPanel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwStyleEditorContainerFormBackgroundPanel.GetAllParamsCount

function TkwStyleEditorContainerFormBackgroundPanel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TStyleEditorContainerForm)]);
end;//TkwStyleEditorContainerFormBackgroundPanel.ParamsTypes

function TkwStyleEditorContainerFormMainZone.MainZone(const aCtx: TtfwContext;
 aStyleEditorContainerForm: TStyleEditorContainerForm): TvtPanel;
 {* ���������� ����� ������� .TStyleEditorContainerForm.MainZone }
begin
 Result := aStyleEditorContainerForm.MainZone;
end;//TkwStyleEditorContainerFormMainZone.MainZone

procedure TkwStyleEditorContainerFormMainZone.DoDoIt(const aCtx: TtfwContext);
var l_aStyleEditorContainerForm: TStyleEditorContainerForm;
begin
 try
  l_aStyleEditorContainerForm := TStyleEditorContainerForm(aCtx.rEngine.PopObjAs(TStyleEditorContainerForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aStyleEditorContainerForm: TStyleEditorContainerForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(MainZone(aCtx, l_aStyleEditorContainerForm));
end;//TkwStyleEditorContainerFormMainZone.DoDoIt

class function TkwStyleEditorContainerFormMainZone.GetWordNameForRegister: AnsiString;
begin
 Result := '.TStyleEditorContainerForm.MainZone';
end;//TkwStyleEditorContainerFormMainZone.GetWordNameForRegister

procedure TkwStyleEditorContainerFormMainZone.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� MainZone', aCtx);
end;//TkwStyleEditorContainerFormMainZone.SetValuePrim

function TkwStyleEditorContainerFormMainZone.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwStyleEditorContainerFormMainZone.GetResultTypeInfo

function TkwStyleEditorContainerFormMainZone.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwStyleEditorContainerFormMainZone.GetAllParamsCount

function TkwStyleEditorContainerFormMainZone.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TStyleEditorContainerForm)]);
end;//TkwStyleEditorContainerFormMainZone.ParamsTypes

function TkwStyleEditorContainerFormParentZone.ParentZone(const aCtx: TtfwContext;
 aStyleEditorContainerForm: TStyleEditorContainerForm): TvtSizeablePanel;
 {* ���������� ����� ������� .TStyleEditorContainerForm.ParentZone }
begin
 Result := aStyleEditorContainerForm.ParentZone;
end;//TkwStyleEditorContainerFormParentZone.ParentZone

procedure TkwStyleEditorContainerFormParentZone.DoDoIt(const aCtx: TtfwContext);
var l_aStyleEditorContainerForm: TStyleEditorContainerForm;
begin
 try
  l_aStyleEditorContainerForm := TStyleEditorContainerForm(aCtx.rEngine.PopObjAs(TStyleEditorContainerForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aStyleEditorContainerForm: TStyleEditorContainerForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ParentZone(aCtx, l_aStyleEditorContainerForm));
end;//TkwStyleEditorContainerFormParentZone.DoDoIt

class function TkwStyleEditorContainerFormParentZone.GetWordNameForRegister: AnsiString;
begin
 Result := '.TStyleEditorContainerForm.ParentZone';
end;//TkwStyleEditorContainerFormParentZone.GetWordNameForRegister

procedure TkwStyleEditorContainerFormParentZone.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ParentZone', aCtx);
end;//TkwStyleEditorContainerFormParentZone.SetValuePrim

function TkwStyleEditorContainerFormParentZone.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtSizeablePanel);
end;//TkwStyleEditorContainerFormParentZone.GetResultTypeInfo

function TkwStyleEditorContainerFormParentZone.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwStyleEditorContainerFormParentZone.GetAllParamsCount

function TkwStyleEditorContainerFormParentZone.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TStyleEditorContainerForm)]);
end;//TkwStyleEditorContainerFormParentZone.ParamsTypes

function TkwStyleEditorContainerFormChildZone.ChildZone(const aCtx: TtfwContext;
 aStyleEditorContainerForm: TStyleEditorContainerForm): TvtPanel;
 {* ���������� ����� ������� .TStyleEditorContainerForm.ChildZone }
begin
 Result := aStyleEditorContainerForm.ChildZone;
end;//TkwStyleEditorContainerFormChildZone.ChildZone

procedure TkwStyleEditorContainerFormChildZone.DoDoIt(const aCtx: TtfwContext);
var l_aStyleEditorContainerForm: TStyleEditorContainerForm;
begin
 try
  l_aStyleEditorContainerForm := TStyleEditorContainerForm(aCtx.rEngine.PopObjAs(TStyleEditorContainerForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aStyleEditorContainerForm: TStyleEditorContainerForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ChildZone(aCtx, l_aStyleEditorContainerForm));
end;//TkwStyleEditorContainerFormChildZone.DoDoIt

class function TkwStyleEditorContainerFormChildZone.GetWordNameForRegister: AnsiString;
begin
 Result := '.TStyleEditorContainerForm.ChildZone';
end;//TkwStyleEditorContainerFormChildZone.GetWordNameForRegister

procedure TkwStyleEditorContainerFormChildZone.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ChildZone', aCtx);
end;//TkwStyleEditorContainerFormChildZone.SetValuePrim

function TkwStyleEditorContainerFormChildZone.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwStyleEditorContainerFormChildZone.GetResultTypeInfo

function TkwStyleEditorContainerFormChildZone.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwStyleEditorContainerFormChildZone.GetAllParamsCount

function TkwStyleEditorContainerFormChildZone.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TStyleEditorContainerForm)]);
end;//TkwStyleEditorContainerFormChildZone.ParamsTypes

function TkwStyleEditorContainerFormNavigatorZone.NavigatorZone(const aCtx: TtfwContext;
 aStyleEditorContainerForm: TStyleEditorContainerForm): TvtSizeablePanel;
 {* ���������� ����� ������� .TStyleEditorContainerForm.NavigatorZone }
begin
 Result := aStyleEditorContainerForm.NavigatorZone;
end;//TkwStyleEditorContainerFormNavigatorZone.NavigatorZone

procedure TkwStyleEditorContainerFormNavigatorZone.DoDoIt(const aCtx: TtfwContext);
var l_aStyleEditorContainerForm: TStyleEditorContainerForm;
begin
 try
  l_aStyleEditorContainerForm := TStyleEditorContainerForm(aCtx.rEngine.PopObjAs(TStyleEditorContainerForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aStyleEditorContainerForm: TStyleEditorContainerForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(NavigatorZone(aCtx, l_aStyleEditorContainerForm));
end;//TkwStyleEditorContainerFormNavigatorZone.DoDoIt

class function TkwStyleEditorContainerFormNavigatorZone.GetWordNameForRegister: AnsiString;
begin
 Result := '.TStyleEditorContainerForm.NavigatorZone';
end;//TkwStyleEditorContainerFormNavigatorZone.GetWordNameForRegister

procedure TkwStyleEditorContainerFormNavigatorZone.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� NavigatorZone', aCtx);
end;//TkwStyleEditorContainerFormNavigatorZone.SetValuePrim

function TkwStyleEditorContainerFormNavigatorZone.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtSizeablePanel);
end;//TkwStyleEditorContainerFormNavigatorZone.GetResultTypeInfo

function TkwStyleEditorContainerFormNavigatorZone.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwStyleEditorContainerFormNavigatorZone.GetAllParamsCount

function TkwStyleEditorContainerFormNavigatorZone.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TStyleEditorContainerForm)]);
end;//TkwStyleEditorContainerFormNavigatorZone.ParamsTypes

initialization
 Tkw_Form_StyleEditorContainer.RegisterInEngine;
 {* ����������� Tkw_Form_StyleEditorContainer }
 Tkw_StyleEditorContainer_Control_BackgroundPanel.RegisterInEngine;
 {* ����������� Tkw_StyleEditorContainer_Control_BackgroundPanel }
 Tkw_StyleEditorContainer_Control_BackgroundPanel_Push.RegisterInEngine;
 {* ����������� Tkw_StyleEditorContainer_Control_BackgroundPanel_Push }
 Tkw_StyleEditorContainer_Control_MainZone.RegisterInEngine;
 {* ����������� Tkw_StyleEditorContainer_Control_MainZone }
 Tkw_StyleEditorContainer_Control_MainZone_Push.RegisterInEngine;
 {* ����������� Tkw_StyleEditorContainer_Control_MainZone_Push }
 Tkw_StyleEditorContainer_Control_ParentZone.RegisterInEngine;
 {* ����������� Tkw_StyleEditorContainer_Control_ParentZone }
 Tkw_StyleEditorContainer_Control_ParentZone_Push.RegisterInEngine;
 {* ����������� Tkw_StyleEditorContainer_Control_ParentZone_Push }
 Tkw_StyleEditorContainer_Control_ChildZone.RegisterInEngine;
 {* ����������� Tkw_StyleEditorContainer_Control_ChildZone }
 Tkw_StyleEditorContainer_Control_ChildZone_Push.RegisterInEngine;
 {* ����������� Tkw_StyleEditorContainer_Control_ChildZone_Push }
 Tkw_StyleEditorContainer_Control_NavigatorZone.RegisterInEngine;
 {* ����������� Tkw_StyleEditorContainer_Control_NavigatorZone }
 Tkw_StyleEditorContainer_Control_NavigatorZone_Push.RegisterInEngine;
 {* ����������� Tkw_StyleEditorContainer_Control_NavigatorZone_Push }
 TkwStyleEditorContainerFormBackgroundPanel.RegisterInEngine;
 {* ����������� StyleEditorContainerForm_BackgroundPanel }
 TkwStyleEditorContainerFormMainZone.RegisterInEngine;
 {* ����������� StyleEditorContainerForm_MainZone }
 TkwStyleEditorContainerFormParentZone.RegisterInEngine;
 {* ����������� StyleEditorContainerForm_ParentZone }
 TkwStyleEditorContainerFormChildZone.RegisterInEngine;
 {* ����������� StyleEditorContainerForm_ChildZone }
 TkwStyleEditorContainerFormNavigatorZone.RegisterInEngine;
 {* ����������� StyleEditorContainerForm_NavigatorZone }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TStyleEditorContainerForm));
 {* ����������� ���� StyleEditorContainer }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtProportionalPanel));
 {* ����������� ���� TvtProportionalPanel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtPanel));
 {* ����������� ���� TvtPanel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtSizeablePanel));
 {* ����������� ���� TvtSizeablePanel }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

end.
