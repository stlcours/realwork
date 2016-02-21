unit PrimNewsLine_Form;
 {* �����. ��� ��������� ����� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimNewsLine_Form.pas"
// ���������: "VCMForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , vcmEntityForm
 {$IfEnd} // NOT Defined(NoVCM)
 , PrimeInterfaces
 , Base_Operations_Strange_Controls
 , Autoreferat_InternalOperations_Controls
 , AutoreferatInterfaces
 , nscTreeViewForNewsLine
 {$If NOT Defined(NoVCL)}
 , ImgList
 {$IfEnd} // NOT Defined(NoVCL)
 , l3TreeInterfaces
 {$If NOT Defined(NoVCM)}
 , vcmControllers
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3MessageID
 , l3ProtoObject
;

const
 {* ������������ ������ Local }
 str_NewsLineIsNotSetup: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'NewsLineIsNotSetup'; rValue : '�������������� ��������� ��������� ����� ����� �� ������. �� ������ ��������� ��������� ����� ����� � ������������ � ������ ����������������� ����������, �������� ������.');
  {* '�������������� ��������� ��������� ����� ����� �� ������. �� ������ ��������� ��������� ����� ����� � ������������ � ������ ����������������� ����������, �������� ������.' }
 str_FormFillIsNotFinished: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'FormFillIsNotFinished'; rValue : '��������!'#13#10 +
'��������� ������ ����� �� ��������. ��� ����, ����� ��������� �������� � ����, ���������� ��������� ������ � ������ ������ "��������� � ���������".');
  {* '��������!'#13#10 +
'��������� ������ ����� �� ��������. ��� ����, ����� ��������� �������� � ����, ���������� ��������� ������ � ������ ������ "��������� � ���������".' }
 str_PrimeIsOffline: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'PrimeIsOffline'; rValue : '��������!'#13#10'��� ���������� ��� ��������� ������ ����� ��������� �������� ��������-����������. ��� ��������� ���������� ����������, ����������, � ������ ���������� �������������� ���� � ������������� �����������.');
  {* '��������!'#13#10'��� ���������� ��� ��������� ������ ����� ��������� �������� ��������-����������. ��� ��������� ���������� ����������, ����������, � ������ ���������� �������������� ���� � ������������� �����������.' }

type
 IPrimNewsLineFormState = interface(IvcmBase)
  ['{D9676E96-C512-47E1-8218-6622AED4E675}']
  function pm_GetCurrentNewsLineIndex: Integer;
  function pm_GetInnerState: IvcmBase;
  property CurrentNewsLineIndex: Integer
   read pm_GetCurrentNewsLineIndex;
  property InnerState: IvcmBase
   read pm_GetInnerState;
 end;//IPrimNewsLineFormState

 TPrimNewsLineFormState = class(Tl3ProtoObject, IPrimNewsLineFormState)
  private
   f_CurrentNewsLineIndex: Integer;
   f_InnerState: IvcmBase;
  protected
   function pm_GetCurrentNewsLineIndex: Integer;
   function pm_GetInnerState: IvcmBase;
  public
   constructor Create(aCurrentNewsLineIndex: Integer;
    const aInnerState: IvcmBase); reintroduce;
   class function Make(aCurrentNewsLineIndex: Integer;
    const aInnerState: IvcmBase): IPrimNewsLineFormState; reintroduce;
 end;//TPrimNewsLineFormState

 _vcmChromeLikeTabCaptionProvider_Parent_ = TvcmEntityForm;
 {$Include w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmChromeLikeTabCaptionProvider.imp.pas}
 TPrimNewsLineForm = class(_vcmChromeLikeTabCaptionProvider_, InsNewsLineNotifier)
  {* �����. ��� ��������� ����� }
  private
   f_InDataChanging: Boolean;
   f_CurrentNewsLineIndex: Integer;
   f_DateList: TnscTreeViewForNewsLine;
    {* ���� ��� �������� DateList }
  protected
   sdsAutoreferat: IsdsAutoreferat;
   f_UpdateFlag: Boolean;
  private
   procedure vcmEntityFormCloseQuery(Sender: TObject;
    var CanClose: Boolean);
   function DateListGetItemImage(Sender: TObject;
    Index: Integer;
    var aImages: TCustomImageList): Integer;
   procedure DateListCurrentChanged(Sender: TObject;
    aNewCurrent: LongInt;
    aOldCurrent: LongInt);
  protected
   procedure ResetThemeList;
   procedure UpdateNewsLineTree;
   procedure OpenAutoreferat(const aNode: Il3SimpleNode;
    AllowOpen: Boolean = True);
   procedure DataChanged;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure InitFields; override;
   procedure FinishDataUpdate; override;
   {$If NOT Defined(NoVCM)}
   procedure NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
    const aNew: IvcmViewAreaController); override;
    {* ��������� �������� ������. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function DoSaveState(out theState: IvcmBase;
    aStateType: TvcmStateType;
    aForClone: Boolean): Boolean; override;
    {* ��������� ��������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function DoLoadState(const aState: IvcmBase;
    aStateType: TvcmStateType): Boolean; override;
    {* ��������� ��������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure InitControls; override;
    {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure DoLoadFromSettings; override;
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure DoSaveInSettings; override;
   {$IfEnd} // NOT Defined(NoVCM)
  public
   procedure BecomeActive; override;
   procedure OpenInt; override;
   procedure RequestClose; override;
   {$If NOT Defined(NoVCM)}
   function NeedSaveInSettings: Boolean; override;
   {$IfEnd} // NOT Defined(NoVCM)
  public
   property DateList: TnscTreeViewForNewsLine
    read f_DateList;
 end;//TPrimNewsLineForm
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , l3StringIDEx
 , nsNewsLine
 , SearchRes
 , DocumentUnit
 , Common_FormDefinitions_Controls
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , DocumentUserTypes_dftAutoreferat_UserType
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 , DataAdapter
 {$If NOT Defined(NoVCL)}
 , Dialogs
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmTabbedContainerFormDispatcher
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
;

const
 {* ������������ ������ nltMainLocalConstants }
 str_nltMainCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'nltMainCaption'; rValue : '�����. ��� ��������� �����');
  {* ��������� ����������������� ���� "�����. ��� ��������� �����" }
 str_nltMainSettingsCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'nltMainSettingsCaption'; rValue : '�����. ��� ��������� ����� (�������)');
  {* ��������� ����������������� ���� "�����. ��� ��������� �����" ��� ��������� ������� ������������ }
 {* �������� ������ ��� ������� NewsLineIsNotSetup }
 str_NewsLineIsNotSetup_Choice_FillForm: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'NewsLineIsNotSetup_Choice_FillForm'; rValue : '��������� ������');
  {* '��������� ������' }
 str_NewsLineIsNotSetup_Choice_ViewFullNewsLine: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'NewsLineIsNotSetup_Choice_ViewFullNewsLine'; rValue : '���������� ��� ����������� � ������� �����');
  {* '���������� ��� ����������� � ������� �����' }
 {* �������� ������ ��� ������� FormFillIsNotFinished }
 str_FormFillIsNotFinished_Choice_Continue: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'FormFillIsNotFinished_Choice_Continue'; rValue : '���������� ���������');
  {* '���������� ���������' }
 str_FormFillIsNotFinished_Choice_Exit: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'FormFillIsNotFinished_Choice_Exit'; rValue : '�������� ������');
  {* '�������� ������' }
 {* �������� ������ ��� ������� PrimeIsOffline }
 str_PrimeIsOffline_Choice_Ok: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'PrimeIsOffline_Choice_Ok'; rValue : '��');
  {* '��' }
 str_PrimeIsOffline_Choice_Details: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'PrimeIsOffline_Choice_Details'; rValue : '���������');
  {* '���������' }

constructor TPrimNewsLineFormState.Create(aCurrentNewsLineIndex: Integer;
 const aInnerState: IvcmBase);
//#UC START# *567116EC034D_567115A7039D_var*
//#UC END# *567116EC034D_567115A7039D_var*
begin
//#UC START# *567116EC034D_567115A7039D_impl*
 inherited Create;
 f_CurrentNewsLineIndex := aCurrentNewsLineIndex;
 f_InnerState := aInnerState;
//#UC END# *567116EC034D_567115A7039D_impl*
end;//TPrimNewsLineFormState.Create

class function TPrimNewsLineFormState.Make(aCurrentNewsLineIndex: Integer;
 const aInnerState: IvcmBase): IPrimNewsLineFormState;
var
 l_Inst : TPrimNewsLineFormState;
begin
 l_Inst := Create(aCurrentNewsLineIndex, aInnerState);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TPrimNewsLineFormState.Make

function TPrimNewsLineFormState.pm_GetCurrentNewsLineIndex: Integer;
//#UC START# *5671156B01AD_567115A7039Dget_var*
//#UC END# *5671156B01AD_567115A7039Dget_var*
begin
//#UC START# *5671156B01AD_567115A7039Dget_impl*
 Result := f_CurrentNewsLineIndex;
//#UC END# *5671156B01AD_567115A7039Dget_impl*
end;//TPrimNewsLineFormState.pm_GetCurrentNewsLineIndex

function TPrimNewsLineFormState.pm_GetInnerState: IvcmBase;
//#UC START# *56713E9A012D_567115A7039Dget_var*
//#UC END# *56713E9A012D_567115A7039Dget_var*
begin
//#UC START# *56713E9A012D_567115A7039Dget_impl*
 Result := f_InnerState;
//#UC END# *56713E9A012D_567115A7039Dget_impl*
end;//TPrimNewsLineFormState.pm_GetInnerState

type _Instance_R_ = TPrimNewsLineForm;

{$Include w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmChromeLikeTabCaptionProvider.imp.pas}

procedure TPrimNewsLineForm.ResetThemeList;
//#UC START# *4C8DC50203CB_497EBEC4031D_var*
//#UC END# *4C8DC50203CB_497EBEC4031D_var*
begin
//#UC START# *4C8DC50203CB_497EBEC4031D_impl*
 UpdateNewsLineTree;
 if not f_InDataChanging then
  OpenAutoreferat(DateList.GetCurrentNode, False);
 f_UpdateFlag := True;
//#UC END# *4C8DC50203CB_497EBEC4031D_impl*
end;//TPrimNewsLineForm.ResetThemeList

procedure TPrimNewsLineForm.vcmEntityFormCloseQuery(Sender: TObject;
 var CanClose: Boolean);
//#UC START# *5242A36D006B_497EBEC4031D_var*
//#UC END# *5242A36D006B_497EBEC4031D_var*
begin
//#UC START# *5242A36D006B_497EBEC4031D_impl*
 TnsNewsLine.Make.SaveThemeToSettings;
//#UC END# *5242A36D006B_497EBEC4031D_impl*
end;//TPrimNewsLineForm.vcmEntityFormCloseQuery

function TPrimNewsLineForm.DateListGetItemImage(Sender: TObject;
 Index: Integer;
 var aImages: TCustomImageList): Integer;
//#UC START# *5242A3770043_497EBEC4031D_var*
//#UC END# *5242A3770043_497EBEC4031D_var*
begin
//#UC START# *5242A3770043_497EBEC4031D_impl*
 Result := siilNewsLineTheme;
//#UC END# *5242A3770043_497EBEC4031D_impl*
end;//TPrimNewsLineForm.DateListGetItemImage

procedure TPrimNewsLineForm.DateListCurrentChanged(Sender: TObject;
 aNewCurrent: LongInt;
 aOldCurrent: LongInt);
//#UC START# *5242A37E01D3_497EBEC4031D_var*
//#UC END# *5242A37E01D3_497EBEC4031D_var*
begin
//#UC START# *5242A37E01D3_497EBEC4031D_impl*
 if (aNewCurrent >= 0) and not f_InDataChanging then
  OpenAutoreferat(DateList.GetNode(aNewCurrent));
//#UC END# *5242A37E01D3_497EBEC4031D_impl*
end;//TPrimNewsLineForm.DateListCurrentChanged

procedure TPrimNewsLineForm.UpdateNewsLineTree;
//#UC START# *4C87BD85008A_497EBEC4031D_var*
var
 l_Tree: Il3SimpleTree;
//#UC END# *4C87BD85008A_497EBEC4031D_var*
begin
//#UC START# *4C87BD85008A_497EBEC4031D_impl*
 l_Tree := TnsNewsLine.Make.MakeCurrentThemeTreeStruct;
 DateList.TreeStruct := l_Tree;
 if Assigned(l_Tree)
  then DateList.Current := 0
  else DateList.Current := -1;
//#UC END# *4C87BD85008A_497EBEC4031D_impl*
end;//TPrimNewsLineForm.UpdateNewsLineTree

procedure TPrimNewsLineForm.OpenAutoreferat(const aNode: Il3SimpleNode;
 AllowOpen: Boolean = True);
//#UC START# *5242A678004A_497EBEC4031D_var*
var
 l_Document: IDocument;
//#UC END# *5242A678004A_497EBEC4031D_var*
begin
//#UC START# *5242A678004A_497EBEC4031D_impl*
 l_Document := TnsNewsLine.Make.ExtractAutoReferat(aNode);
 if Assigned(l_Document) then
 begin
  // ����� ���������� ����, ������������ ������������� �����, ������ ���� ���
  // ������� �� ������, � ��������� ������� ������ ���������:
  if AllowOpen or
     NativeMainForm.HasForm(fm_TextForm.rFormID, vcm_ztParent, True, nil, dftAutoreferat) then
  // �������� ������:
   TdmStdRes.OpenAutoreferat(l_Document, nil);
 end
 else
 begin
  while (vcmDispatcher.FormDispatcher.CurrentMainForm.AsContainer).HasForm(fm_enNewsLine.rFormID) and
         vcmDispatcher.History.CanBack do
   vcmDispatcher.History.Back(True);
 end;
//#UC END# *5242A678004A_497EBEC4031D_impl*
end;//TPrimNewsLineForm.OpenAutoreferat

procedure TPrimNewsLineForm.DataChanged;
//#UC START# *49918CC5036B_497EBEC4031D_var*
var
 l_Curr: Integer;
//#UC END# *49918CC5036B_497EBEC4031D_var*
begin
//#UC START# *49918CC5036B_497EBEC4031D_impl*
 f_InDataChanging := True;
 try
  l_Curr := DateList.Current;
  ResetThemeList;
 finally
  f_InDataChanging := False;
 end;
 DateList.Current := l_Curr;
//#UC END# *49918CC5036B_497EBEC4031D_impl*
end;//TPrimNewsLineForm.DataChanged

procedure TPrimNewsLineForm.BecomeActive;
//#UC START# *4A9807F801F9_497EBEC4031D_var*
//#UC END# *4A9807F801F9_497EBEC4031D_var*
begin
//#UC START# *4A9807F801F9_497EBEC4031D_impl*
 !!! Needs to be implemented !!!
//#UC END# *4A9807F801F9_497EBEC4031D_impl*
end;//TPrimNewsLineForm.BecomeActive

procedure TPrimNewsLineForm.OpenInt;
//#UC START# *4AF822B302C4_497EBEC4031D_var*
//#UC END# *4AF822B302C4_497EBEC4031D_var*
begin
//#UC START# *4AF822B302C4_497EBEC4031D_impl*
 !!! Needs to be implemented !!!
//#UC END# *4AF822B302C4_497EBEC4031D_impl*
end;//TPrimNewsLineForm.OpenInt

procedure TPrimNewsLineForm.RequestClose;
//#UC START# *4AF82EFD0025_497EBEC4031D_var*
//#UC END# *4AF82EFD0025_497EBEC4031D_var*
begin
//#UC START# *4AF82EFD0025_497EBEC4031D_impl*
 !!! Needs to be implemented !!!
//#UC END# *4AF82EFD0025_497EBEC4031D_impl*
end;//TPrimNewsLineForm.RequestClose

procedure TPrimNewsLineForm.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_497EBEC4031D_var*
//#UC END# *479731C50290_497EBEC4031D_var*
begin
//#UC START# *479731C50290_497EBEC4031D_impl*
 TnsNewsLine.Make.UnSubscribe(Self);
 inherited;
//#UC END# *479731C50290_497EBEC4031D_impl*
end;//TPrimNewsLineForm.Cleanup

procedure TPrimNewsLineForm.InitFields;
//#UC START# *47A042E100E2_497EBEC4031D_var*
//#UC END# *47A042E100E2_497EBEC4031D_var*
begin
//#UC START# *47A042E100E2_497EBEC4031D_impl*
 inherited;
 f_InDataChanging := False;
 //UpdateNewsLineTree;
//#UC END# *47A042E100E2_497EBEC4031D_impl*
end;//TPrimNewsLineForm.InitFields

procedure TPrimNewsLineForm.FinishDataUpdate;
//#UC START# *47EA4E9002C6_497EBEC4031D_var*
//#UC END# *47EA4E9002C6_497EBEC4031D_var*
begin
//#UC START# *47EA4E9002C6_497EBEC4031D_impl*
 inherited;
 if (not defDataAdapter.Monitoring.IsExist) then
 begin
  if not vcmDispatcher.History.CanBack then
  begin
   TdmStdRes.OpenMainMenuIfNeeded(nil);
   vcmDispatcher.History.DeleteBackItem;
  end else
  while vcmDispatcher.FormDispatcher.CurrentMainForm.AsContainer.HasForm(fm_enNewsLine.rFormID) and
   vcmDispatcher.History.CanBack do
   vcmDispatcher.History.Back(True);
 end;
//#UC END# *47EA4E9002C6_497EBEC4031D_impl*
end;//TPrimNewsLineForm.FinishDataUpdate

{$If NOT Defined(NoVCM)}
procedure TPrimNewsLineForm.NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
 const aNew: IvcmViewAreaController);
 {* ��������� �������� ������. ��� ���������� � �������� }
//#UC START# *497469C90140_497EBEC4031D_var*
//#UC END# *497469C90140_497EBEC4031D_var*
begin
//#UC START# *497469C90140_497EBEC4031D_impl*
 inherited;
 if Assigned(aNew) then
  f_CurrentNewsLineIndex := DateList.Current;
//#UC END# *497469C90140_497EBEC4031D_impl*
end;//TPrimNewsLineForm.NotifyDataSourceChanged
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
function TPrimNewsLineForm.DoSaveState(out theState: IvcmBase;
 aStateType: TvcmStateType;
 aForClone: Boolean): Boolean;
 {* ��������� ��������� �����. ��� ���������� � �������� }
//#UC START# *49806ED503D5_497EBEC4031D_var*
var
 l_InnerState: IvcmBase;
//#UC END# *49806ED503D5_497EBEC4031D_var*
begin
//#UC START# *49806ED503D5_497EBEC4031D_impl*
 l_InnerState := nil;
 inherited DoSaveState(theState, aStateType, aForClone);
 theState := TPrimNewsLineFormState.Make(f_CurrentNewsLineIndex{DateList.Current}, l_InnerState);
 Result := true;
//#UC END# *49806ED503D5_497EBEC4031D_impl*
end;//TPrimNewsLineForm.DoSaveState
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
function TPrimNewsLineForm.DoLoadState(const aState: IvcmBase;
 aStateType: TvcmStateType): Boolean;
 {* ��������� ��������� �����. ��� ���������� � �������� }
//#UC START# *49807428008C_497EBEC4031D_var*
var
 l_WasDataChanging: Boolean;
 l_State: IPrimNewsLineFormState;
 l_InnerState: IvcmBase;
//#UC END# *49807428008C_497EBEC4031D_var*
begin
//#UC START# *49807428008C_497EBEC4031D_impl*
 if Supports(aState, IPrimNewsLineFormState, l_State) then
 begin
  l_InnerState := l_State.InnerState;
  l_WasDataChanging := f_InDataChanging;
  f_InDataChanging := True;
  DateList.Current := l_State.CurrentNewsLineIndex;
  f_CurrentNewsLineIndex := l_State.CurrentNewsLineIndex;
  f_InDataChanging := False or l_WasDataChanging;
 end
 else
  l_InnerState := aState; 
 Result := inherited DoLoadState(l_InnerState, aStateType);
//#UC END# *49807428008C_497EBEC4031D_impl*
end;//TPrimNewsLineForm.DoLoadState
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimNewsLineForm.InitControls;
 {* ��������� ������������� ���������. ��� ���������� � �������� }
//#UC START# *4A8E8F2E0195_497EBEC4031D_var*
//#UC END# *4A8E8F2E0195_497EBEC4031D_var*
begin
//#UC START# *4A8E8F2E0195_497EBEC4031D_impl*
 DateList.Images := nsSearchRes.SearchItemsImageList;
 TnsNewsLine.Make.Subscribe(Self);
 f_UpdateFlag := False;
 with DateList do
 begin
  Align := alClient;
  BorderStyle := bsNone;
  ActionElementMode := l3_amSingleClick;
  ViewOptions := [voShowInterRowSpace, voShowIcons, voShowExpandable, voShowLines];
  ClearTreeStructOnSaveState := False;
  OnGetItemImage := DateListGetItemImage;
  OnCurrentChanged := DateListCurrentChanged;
 end;
//#UC END# *4A8E8F2E0195_497EBEC4031D_impl*
end;//TPrimNewsLineForm.InitControls
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimNewsLineForm.DoLoadFromSettings;
//#UC START# *4E7C2AA3037E_497EBEC4031D_var*
//#UC END# *4E7C2AA3037E_497EBEC4031D_var*
begin
//#UC START# *4E7C2AA3037E_497EBEC4031D_impl*
 TnsNewsLine.Make.LoadThemeFromSettings;
 UpdateNewsLineTree;
 inherited;
//#UC END# *4E7C2AA3037E_497EBEC4031D_impl*
end;//TPrimNewsLineForm.DoLoadFromSettings
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimNewsLineForm.DoSaveInSettings;
//#UC START# *4F7B072201AA_497EBEC4031D_var*
//#UC END# *4F7B072201AA_497EBEC4031D_var*
begin
//#UC START# *4F7B072201AA_497EBEC4031D_impl*
 inherited;
 TnsNewsLine.Make.SaveThemeToSettings;
//#UC END# *4F7B072201AA_497EBEC4031D_impl*
end;//TPrimNewsLineForm.DoSaveInSettings
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
function TPrimNewsLineForm.NeedSaveInSettings: Boolean;
//#UC START# *4FC38C4C0119_497EBEC4031D_var*
//#UC END# *4FC38C4C0119_497EBEC4031D_var*
begin
//#UC START# *4FC38C4C0119_497EBEC4031D_impl*
 Result := True;
//#UC END# *4FC38C4C0119_497EBEC4031D_impl*
end;//TPrimNewsLineForm.NeedSaveInSettings
{$IfEnd} // NOT Defined(NoVCM)

initialization
 str_nltMainCaption.Init;
 {* ������������� str_nltMainCaption }
 str_nltMainSettingsCaption.Init;
 {* ������������� str_nltMainSettingsCaption }
 str_NewsLineIsNotSetup_Choice_FillForm.Init;
 {* ������������� str_NewsLineIsNotSetup_Choice_FillForm }
 str_NewsLineIsNotSetup_Choice_ViewFullNewsLine.Init;
 {* ������������� str_NewsLineIsNotSetup_Choice_ViewFullNewsLine }
 str_FormFillIsNotFinished_Choice_Continue.Init;
 {* ������������� str_FormFillIsNotFinished_Choice_Continue }
 str_FormFillIsNotFinished_Choice_Exit.Init;
 {* ������������� str_FormFillIsNotFinished_Choice_Exit }
 str_PrimeIsOffline_Choice_Ok.Init;
 {* ������������� str_PrimeIsOffline_Choice_Ok }
 str_PrimeIsOffline_Choice_Details.Init;
 {* ������������� str_PrimeIsOffline_Choice_Details }
 str_NewsLineIsNotSetup.Init;
!!! Lost Message ini !!!
 {* ������������� str_NewsLineIsNotSetup }
 str_FormFillIsNotFinished.Init;
!!! Lost Message ini !!!
 {* ������������� str_FormFillIsNotFinished }
 str_PrimeIsOffline.Init;
!!! Lost Message ini !!!
 {* ������������� str_PrimeIsOffline }
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimNewsLineForm);
 {* ����������� PrimNewsLine }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
