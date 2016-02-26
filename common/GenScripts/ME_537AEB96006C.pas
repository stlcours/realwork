unit vcmTabbedContainerFormDispatcher;

// ������: "w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmTabbedContainerFormDispatcher.pas"
// ���������: "UtilityPack"

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
uses
 l3IntfUses
 , vcmEntityForm
 , vcmTabbedContainerForm
 , l3ProtoDataContainer
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
 , l3ProtoObject
 , vcmTabbedContainersService
 {$If NOT Defined(NoVCL)}
 , ImgList
 {$IfEnd} // NOT Defined(NoVCL)
 , vcmInterfaces
 , l3LongintList
 , Types
 , ChromeLikeInterfaces
 , vcmTabbedContainerFormDispatcherUtils
 , l3TabbedContainersDispatcher
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 , vcmExternalInterfaces
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , l3InternalInterfaces
;

type
 PvcmContainedFormDescr = ^TvcmContainedFormDescr;

 TvcmContainedFormDescr = object
  public
   rForm: TvcmEntityForm;
   rContainer: TvcmTabbedContainerForm;
   rImageIndex: Integer;
   rNeedUpdateImageIndex: Boolean;
  public
   function EQ(const anOther: TvcmContainedFormDescr): Boolean;
   function Compare(const anOther: TvcmContainedFormDescr): Integer;
 end;//TvcmContainedFormDescr

 _ItemType_ = TvcmContainedFormDescr;
 _l3RecordWithEQList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3RecordWithEQList.imp.pas}
 TvcmFormToContainerMap = class(_l3RecordWithEQList_)
 end;//TvcmFormToContainerMap

 _vcmKeyDataListener_Parent_ = Tl3ProtoObject;
 {$Include w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmKeyDataListener.imp.pas}
 TvcmTabbedContainerFormDispatcher = {final} class(_vcmKeyDataListener_, IvcmTabbedContainersService)
  private
   f_MakingClone: Boolean;
   f_ContainerForClone: TvcmTabbedContainerForm;
   f_IsUndockingAll: Boolean;
   f_NewContainerRect: TRect;
   f_LockCount: Integer;
   f_LastTabCloseKeyPressTime: Cardinal;
   f_MainFormProvider: IvcmMainFormProvider;
   f_CloseQueryContainer: TvcmTabbedContainerForm;
   f_DisableAskMayExit: Boolean;
   f_LockedContainers: TvcmContainersLockCountList;
   f_ContainerCount: Integer;
    {* ���� ��� �������� ContainerCount }
   f_FormToContainerMap: TvcmFormToContainerMap;
    {* ���� ��� �������� FormToContainerMap }
   f_MenuImages: TCustomImageList;
    {* ���� ��� �������� MenuImages }
   f_ActiveContainer: TvcmTabbedContainerForm;
    {* ���� ��� �������� ActiveContainer }
   f_ContainerList: Tl3LongintList;
    {* ���� ��� �������� ContainerList }
   f_TabImages: TCustomImageList;
    {* ���� ��� �������� TabImages }
   f_Listeners: Tl3LongintList;
    {* ���� ��� �������� Listeners }
   f_TabSetParams: TChromeLikeTabSetParams;
    {* ���� ��� �������� TabSetParams }
   f_CloningTab: Boolean;
    {* ���� ��� �������� CloningTab }
   f_ReopeningTab: Boolean;
    {* ���� ��� �������� ReopeningTab }
  private
   procedure ActivateTabByIndex(aContainer: TvcmTabbedContainerForm;
    aTabIndex: Integer);
   function GetCurrentActiveContainer: TvcmTabbedContainerForm;
   function GetTopMostContainer(const aForm: IvcmEntityForm): IvcmContainer;
   procedure UpdateContainerList;
   function MakeContainersList: IvcmEntityFormsIterable;
   procedure UpdateFormTabInContainer(aForm: TvcmEntityForm);
   function GetFormCaptionViaProvider(aForm: TvcmEntityForm): IvcmCString;
   procedure NotifyListeners(aNotification: Tl3TabbedContainerNotificationType);
   function IsAnyModalFormShowing: Boolean;
   function GetTabHistory(aForm: TForm): IvcmFormSetHistory;
  protected
   function pm_GetContainerCount: Integer;
   function pm_GetDockableFormClass: RvcmEntityForm;
   function pm_GetFormToContainerMap: TvcmFormToContainerMap;
   function pm_GetMenuImages: TCustomImageList;
   procedure pm_SetMenuImages(aValue: TCustomImageList);
   function pm_GetActiveContainer: TvcmTabbedContainerForm;
   function pm_GetFormTabCount: Integer;
   function pm_GetMainForms(Index: Integer): IvcmEntityForm; virtual;
   function pm_GetMainFormsCount: Integer; virtual;
   function pm_GetContainerList: Tl3LongintList; virtual;
   function pm_GetTabImages: TCustomImageList; virtual;
   procedure pm_SetTabImages(aValue: TCustomImageList); virtual;
   function pm_GetListeners: Tl3LongintList; virtual;
   function pm_GetIsLocked: Boolean; virtual;
   function pm_GetHasAnyDockedForms: Boolean; virtual;
   function pm_GetActiveVCMContainer: IvcmContainer; virtual;
   function pm_GetReopeningTab: Boolean; virtual;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure ClearFields; override;
   function NeedProcessKeyData(aKey: Byte;
    aShift: TShiftState): Boolean; override;
   procedure DoProcessKeyData(aKey: Byte;
    aShift: TShiftState); override;
  public
   procedure StartMakingClone(aContainer: TvcmTabbedContainerForm);
   procedure EndMakingClone;
   function MakeNewTabbedContainer(aChildForm: TvcmEntityForm;
    aNeedPlace: Boolean = True;
    aNeedLoadFromSettings: Boolean = True;
    aNeedShow: Boolean = True;
    const aParams: Il3TabParams = nil): TvcmTabbedContainerForm;
   function InsertFormIntoANewContainer(aForm: TForm;
    const aRect: TRect;
    const aParams: Il3TabParams = nil): TvcmTabbedContainerForm;
   procedure FormInsertedIntoContainer(aForm: TForm;
    aContainer: TvcmTabbedContainerForm);
   function GetFormContainer(aForm: TForm): TvcmTabbedContainerForm;
   procedure FormRemovedFromContainer(aForm: TForm;
    aContainer: TvcmTabbedContainerForm);
   procedure MoveToAnotherContainer(aForm: TForm;
    aNewContainer: TvcmTabbedContainerForm;
    const aMousePoint: TPoint);
   function FindTabbedContainerUnderPoint(const aPoint: TPoint;
    aForm: TForm): TvcmTabbedContainerForm;
   function TryDockToTabset(const aPoint: TPoint;
    aDockClientForm: TvcmEntityForm;
    aContainerForm: TvcmTabbedContainerForm): Boolean;
   procedure SignalClosingForm(aForm: TForm);
   function GetContainedFormCount(aContainer: TvcmTabbedContainerForm): Integer;
   function CallContainerCloseQuery(aContainer: TvcmTabbedContainerForm): Boolean;
   function NeedAskMayExit(aForm: TForm): Boolean;
   procedure AddFormToContainer(aForm: TvcmEntityForm;
    aContainer: TvcmTabbedContainerForm;
    aNeedSwitchTab: Boolean;
    aAddLast: Boolean = False;
    aOpenAfter: TvcmEntityForm = nil);
   procedure SignalContainerIsClosing(aContainer: TvcmTabbedContainerForm);
   function PlaceVcmContainer(const aPrevContainer: IvcmContainer;
    const aNewContainer: IvcmContainer;
    aOpenKind: TvcmMainFormOpenKind;
    aNeedSwitchTab: Boolean;
    aOpenLast: Boolean = False;
    aOpenAfter: TvcmEntityForm = nil): IvcmContainer;
   function MakeAndPlaceVCMContainer(const aContainerMaker: IvcmContainerMaker;
    const aPrevContainer: IvcmContainer;
    aOpenKind: TvcmMainFormOpenKind;
    aNeedSwitchTab: Boolean;
    aOpenLast: Boolean = False;
    aOpenAfter: TvcmEntityForm = nil): IvcmContainer;
   function CanOpenNewTab(aContainer: TvcmTabbedContainerForm): Boolean;
   function CanOpenNewContainer: Boolean;
   constructor Create; reintroduce;
   procedure NotifyFormDataSourceChanged(const aContainedForm: IvcmEntityForm;
    const aChildForm: IvcmEntityForm;
    const aFormDataSource: IvcmFormDataSource);
   procedure UpdateTab(const aChildForm: IvcmEntityForm);
   procedure UpdateTabCaption(const aForm: IvcmEntityForm;
    const aCaption: IvcmCString);
   procedure CloseAllWindows(const aCurrent: IvcmEntityForm);
   function CanCloseAllWindows: Boolean;
   function GetNextMainForm(const aCurrent: IvcmEntityForm): IvcmEntityForm;
   function GetContainedFormCaption(aForm: TvcmEntityForm): IvcmCString;
   procedure ContainerChanged(aContainer: TvcmTabbedContainerForm);
   function NeedTerminateAppOnClosingForm(aForm: TvcmEntityForm): Boolean;
   function GetContainedFormHint(aForm: TvcmEntityForm): IvcmCString;
   function MakeTabParams(aForm: TvcmEntityForm): Il3TabParams;
   procedure NotifyContainerClosed(aContainer: TvcmTabbedContainerForm);
   procedure NotifyMainFormVisibleChanged(aVisible: Boolean);
   procedure UpdateFormTabIcon(aForm: TvcmEntityForm);
   procedure NotifyContainerCreated(aContainer: TvcmTabbedContainerForm);
   procedure UpdateFormTabParams(aForm: TForm;
    const aParams: Il3TabParams);
   procedure SaveTabHistory(const aContainer: IvcmContainer;
    const aTabHistoryState: IvcmHistoryState);
   function GetFormTabIcon(aForm: TvcmEntityForm;
    out theIconIndex: Integer): Boolean;
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
   function GetTabIcon(const aTab: Il3FormTab): Integer;
   function IsInBF(aContainedForm: TForm): Boolean;
   function GetTabCaption(const aTab: Il3FormTab): AnsiString;
   procedure CloseTab(const aTab: Il3FormTab);
   procedure Subscribe(const aListener: Il3TabbedContainersListener);
   procedure Lock;
   procedure UnlockContainer(const aContainer: Il3TabbedContainer);
   function GetActiveTabbedContainer: Il3TabbedContainer;
   procedure StopFlashing;
   function CanReopenClosedTab(const aContainer: Il3TabbedContainer): Boolean;
   procedure CascadeWindows;
   procedure ReopenClosedTab(const aContainer: Il3TabbedContainer);
   procedure LockContainer(const aContainer: Il3TabbedContainer);
   procedure Unsubscribe(const aListener: Il3TabbedContainersListener);
   function GetCurrentMainForm: TWinControl;
   function IsFormInContainer(aForm: TForm;
    aContainer: TForm): Boolean;
   procedure TileWindowsHorizontal;
   function IsContainerLocked(const aContainer: Il3TabbedContainer): Boolean;
   procedure ActivateForm(aForm: TForm);
   function NeedUseTabs: Boolean;
   procedure TileWindowsVertical;
   procedure ContainedFormBecomeActive(aForm: TForm);
   function IsTabEmpty(const aTab: Il3FormTab): Boolean;
   function CloneTab(const aTab: Il3FormTab): Il3FormTab;
   function GetFormTab(aForm: TForm): Il3FormTab;
   procedure Unlock;
   function CanCloneTab(const aTab: Il3FormTab): Boolean;
   procedure StartFlashing;
   procedure SaveTabToHistory(const aTab: Il3FormTab);
   procedure CloseAll;
   class function Instance: TvcmTabbedContainerFormDispatcher;
    {* ����� ��������� ���������� ���������� TvcmTabbedContainerFormDispatcher }
  private
   property FormTabCount: Integer
    read pm_GetFormTabCount;
   property ContainerList: Tl3LongintList
    read pm_GetContainerList;
  protected
   property FormToContainerMap: TvcmFormToContainerMap
    read pm_GetFormToContainerMap;
   property Listeners: Tl3LongintList
    read pm_GetListeners;
  public
   property ContainerCount: Integer
    read pm_GetContainerCount;
   property DockableFormClass: RvcmEntityForm
    read pm_GetDockableFormClass;
   property MenuImages: TCustomImageList
    read pm_GetMenuImages
    write pm_SetMenuImages;
   property ActiveContainer: TvcmTabbedContainerForm
    read pm_GetActiveContainer;
   property MainForms[Index: Integer]: IvcmEntityForm
    read pm_GetMainForms;
   property MainFormsCount: Integer
    read pm_GetMainFormsCount;
   property TabImages: TCustomImageList
    read pm_GetTabImages
    write pm_SetTabImages;
   property IsLocked: Boolean
    read pm_GetIsLocked;
   property HasAnyDockedForms: Boolean
    read pm_GetHasAnyDockedForms;
   property TabSetParams: TChromeLikeTabSetParams
    read f_TabSetParams
    write f_TabSetParams;
   property ActiveVCMContainer: IvcmContainer
    read pm_GetActiveVCMContainer;
   property CloningTab: Boolean
    read f_CloningTab;
   property ReopeningTab: Boolean
    read pm_GetReopeningTab;
 end;//TvcmTabbedContainerFormDispatcher

function TvcmContainedFormDescr_C(aForm: TvcmEntityForm;
 aContainer: TvcmTabbedContainerForm): TvcmContainedFormDescr; overload;
function TvcmContainedFormDescr_C(aForm: TvcmEntityForm;
 aContainer: TvcmTabbedContainerForm;
 aImageIndex: Integer;
 aNeedUpdateImageIndex: Boolean): TvcmContainedFormDescr; overload;
{$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)

implementation

{$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
uses
 l3ImplUses
 , Windows
 , SysUtils
 {$If NOT Defined(NoVCL)}
 , Menus
 {$IfEnd} // NOT Defined(NoVCL)
 , ChromeLikeTabSetRes
 , ChromeLikeWinUtils
 , vcmBase
 , vcmMainForm
 , vcmTabbedContainerRes
 , vcmMessagesSupport
 , l3MessageID
 {$If NOT Defined(NoVCL)}
 , Dialogs
 {$IfEnd} // NOT Defined(NoVCL)
 , vcmMainFormRes
 , OvcBase
 , l3String
 , ChromeLikeTypes
 , vcmBaseMenuManager
 , afwFacade
 , vcmUtils
 , vcmFormSetContainerRegistry
 , vcmHistory
 , vcmTabsHistoryService
 , l3Base
 , l3MinMax
 , RTLConsts
 , afwInterfaces
 , vcmContainerForm
 , vcmEntityFormsIterable
 , ChromeLikeTabParams
 , ChromeLikeFormTabParamsList
;

type
 THackApplication = class(TComponent)
  private
   FHandle: HWND;
   FBiDiMode: TBiDiMode;
   FBiDiKeyboard: AnsiString;
   FNonBiDiKeyboard: AnsiString;
   FObjectInstance: Pointer;
   FMainForm: TForm;
 end;//THackApplication

 TvcmChromeLikeMainFormProvider = class(Tl3ProtoObject, IvcmMainFormProvider)
  protected
   function pm_GetCurrentMainForm: IvcmEntityForm;
   function pm_GetCurrentVCMContainer: IvcmContainer;
  public
   class function Make: IvcmMainFormProvider; reintroduce;
 end;//TvcmChromeLikeMainFormProvider

 TvcmContainerWithTabMaker = {final} class(Tl3ProtoObject, IvcmContainerMaker)
  private
   f_ContainerMaker: IvcmContainerMaker;
  protected
   function MakeContainer: IvcmContainer;
  public
   constructor Create(const aRealContainerMaker: IvcmContainerMaker); reintroduce;
   class function Make(const aRealContainerMaker: IvcmContainerMaker): IvcmContainerMaker; reintroduce;
 end;//TvcmContainerWithTabMaker

var g_TvcmTabbedContainerFormDispatcher: TvcmTabbedContainerFormDispatcher = nil;
 {* ��������� ���������� TvcmTabbedContainerFormDispatcher }

const
 cMaxTabCount = 10;
 cMaxContainerCount = 10;
 cTabNumberKeys = [Ord('0')..Ord('9')];
 cTabNumpadKeys = [VK_NUMPAD0..VK_NUMPAD9];

function TvcmContainedFormDescr_C(aForm: TvcmEntityForm;
 aContainer: TvcmTabbedContainerForm): TvcmContainedFormDescr;
//#UC START# *537AEA8C02EF_537AEA3B02A5_var*
//#UC END# *537AEA8C02EF_537AEA3B02A5_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *537AEA8C02EF_537AEA3B02A5_impl*
 Result.rForm := aForm;
 Result.rContainer := aContainer;
//#UC END# *537AEA8C02EF_537AEA3B02A5_impl*
end;//TvcmContainedFormDescr_C

function TvcmContainedFormDescr_C(aForm: TvcmEntityForm;
 aContainer: TvcmTabbedContainerForm;
 aImageIndex: Integer;
 aNeedUpdateImageIndex: Boolean): TvcmContainedFormDescr;
//#UC START# *53D62F3F03C1_537AEA3B02A5_var*
//#UC END# *53D62F3F03C1_537AEA3B02A5_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *53D62F3F03C1_537AEA3B02A5_impl*
 Result := TvcmContainedFormDescr_C(aForm, aContainer);
 Result.rImageIndex := aImageIndex;
 Result.rNeedUpdateImageIndex := aNeedUpdateImageIndex;
//#UC END# *53D62F3F03C1_537AEA3B02A5_impl*
end;//TvcmContainedFormDescr_C

procedure TvcmTabbedContainerFormDispatcherFree;
 {* ����� ������������ ���������� ���������� TvcmTabbedContainerFormDispatcher }
begin
 l3Free(g_TvcmTabbedContainerFormDispatcher);
end;//TvcmTabbedContainerFormDispatcherFree

function TvcmContainedFormDescr.EQ(const anOther: TvcmContainedFormDescr): Boolean;
//#UC START# *537AEB05030D_537AEA3B02A5_var*
//#UC END# *537AEB05030D_537AEA3B02A5_var*
begin
//#UC START# *537AEB05030D_537AEA3B02A5_impl*
 Result := (rForm = anOther.rForm) and (rContainer = anOther.rContainer);
//#UC END# *537AEB05030D_537AEA3B02A5_impl*
end;//TvcmContainedFormDescr.EQ

function TvcmContainedFormDescr.Compare(const anOther: TvcmContainedFormDescr): Integer;
//#UC START# *537AEB28016D_537AEA3B02A5_var*
//#UC END# *537AEB28016D_537AEA3B02A5_var*
begin
//#UC START# *537AEB28016D_537AEA3B02A5_impl*
 Result := -1;
//#UC END# *537AEB28016D_537AEA3B02A5_impl*
end;//TvcmContainedFormDescr.Compare

{$If not Declared(_DataType_)}type _DataType_ = Tl3Ptr;{$IfEnd}

{$If not Declared(_FindDataType_)}type _FindDataType_ = _ItemType_;{$IfEnd}

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_537AEACC00D6_var*
//#UC END# *47B2C42A0163_537AEACC00D6_var*
begin
//#UC START# *47B2C42A0163_537AEACC00D6_impl*
 Assert(False);
//#UC END# *47B2C42A0163_537AEACC00D6_impl*
end;//AssignItem
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)

function CompareExistingItems(const CI: CompareItemsRec): Integer;
 {* ���������� ��� ������������ ��������. }
//#UC START# *47B99D4503A2_537AEACC00D6_var*
//#UC END# *47B99D4503A2_537AEACC00D6_var*
begin
//#UC START# *47B99D4503A2_537AEACC00D6_impl*
 Result := -1;
//#UC END# *47B99D4503A2_537AEACC00D6_impl*
end;//CompareExistingItems

type _Instance_R_ = TvcmFormToContainerMap;

{$Include w:\common\components\rtl\Garant\L3\l3RecordWithEQList.imp.pas}

{$Include w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmKeyDataListener.imp.pas}

function TvcmTabbedContainerFormDispatcher.pm_GetContainerCount: Integer;
//#UC START# *537AEEA5023F_537AEC5E03DDget_var*
//#UC END# *537AEEA5023F_537AEC5E03DDget_var*
begin
//#UC START# *537AEEA5023F_537AEC5E03DDget_impl*
 Assert(NeedUseTabs);
 Result := ContainerList.Count;
//#UC END# *537AEEA5023F_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetContainerCount

function TvcmTabbedContainerFormDispatcher.pm_GetDockableFormClass: RvcmEntityForm;
//#UC START# *537B325901F9_537AEC5E03DDget_var*
//#UC END# *537B325901F9_537AEC5E03DDget_var*
begin
//#UC START# *537B325901F9_537AEC5E03DDget_impl*
 Result := TvcmEntityForm;
//#UC END# *537B325901F9_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetDockableFormClass

function TvcmTabbedContainerFormDispatcher.pm_GetFormToContainerMap: TvcmFormToContainerMap;
//#UC START# *537B430E02C8_537AEC5E03DDget_var*
//#UC END# *537B430E02C8_537AEC5E03DDget_var*
begin
//#UC START# *537B430E02C8_537AEC5E03DDget_impl*
 if (f_FormToContainerMap = nil) then
  f_FormToContainerMap := TvcmFormToContainerMap.Create;
 Result := f_FormToContainerMap;
//#UC END# *537B430E02C8_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetFormToContainerMap

function TvcmTabbedContainerFormDispatcher.pm_GetMenuImages: TCustomImageList;
//#UC START# *537DAC3B001A_537AEC5E03DDget_var*
//#UC END# *537DAC3B001A_537AEC5E03DDget_var*
begin
//#UC START# *537DAC3B001A_537AEC5E03DDget_impl*
 Result := f_MenuImages;
//#UC END# *537DAC3B001A_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetMenuImages

procedure TvcmTabbedContainerFormDispatcher.pm_SetMenuImages(aValue: TCustomImageList);
//#UC START# *537DAC3B001A_537AEC5E03DDset_var*
//#UC END# *537DAC3B001A_537AEC5E03DDset_var*
begin
//#UC START# *537DAC3B001A_537AEC5E03DDset_impl*
 if (aValue <> f_MenuImages) then
  f_MenuImages := aValue;
//#UC END# *537DAC3B001A_537AEC5E03DDset_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_SetMenuImages

function TvcmTabbedContainerFormDispatcher.pm_GetActiveContainer: TvcmTabbedContainerForm;
//#UC START# *53A3ED4F0081_537AEC5E03DDget_var*
//#UC END# *53A3ED4F0081_537AEC5E03DDget_var*
begin
//#UC START# *53A3ED4F0081_537AEC5E03DDget_impl*
 if (f_ActiveContainer = nil) then
  if (FormToContainerMap.Count > 0) then
   f_ActiveContainer := FormToContainerMap.Last.rContainer;
 Result := f_ActiveContainer;
//#UC END# *53A3ED4F0081_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetActiveContainer

function TvcmTabbedContainerFormDispatcher.pm_GetFormTabCount: Integer;
//#UC START# *53AAA84202D2_537AEC5E03DDget_var*
//#UC END# *53AAA84202D2_537AEC5E03DDget_var*
begin
//#UC START# *53AAA84202D2_537AEC5E03DDget_impl*
 Result := FormToContainerMap.Count;
//#UC END# *53AAA84202D2_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetFormTabCount

function TvcmTabbedContainerFormDispatcher.pm_GetMainForms(Index: Integer): IvcmEntityForm;
//#UC START# *53C8B56E0152_537AEC5E03DDget_var*
var
 l_Container: TvcmTabbedContainerForm;
//#UC END# *53C8B56E0152_537AEC5E03DDget_var*
begin
//#UC START# *53C8B56E0152_537AEC5E03DDget_impl*
 Result := nil;
 if NeedUseTabs then
 begin
  l_Container := TvcmTabbedContainerForm(ContainerList.Items[Index]);
  if (l_Container <> nil) then
   Result := l_Container.As_IvcmEntityForm;
 end
 else
  Result := vcmDispatcher.FormDispatcher.MainForm[Index];
//#UC END# *53C8B56E0152_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetMainForms

function TvcmTabbedContainerFormDispatcher.pm_GetMainFormsCount: Integer;
//#UC START# *53C8B59C02E2_537AEC5E03DDget_var*
//#UC END# *53C8B59C02E2_537AEC5E03DDget_var*
begin
//#UC START# *53C8B59C02E2_537AEC5E03DDget_impl*
 if NeedUseTabs then
  Result := ContainerList.Count
 else
  Result := vcmDispatcher.FormDispatcher.MainFormsCount;
//#UC END# *53C8B59C02E2_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetMainFormsCount

function TvcmTabbedContainerFormDispatcher.pm_GetContainerList: Tl3LongintList;
//#UC START# *53C8BC8A01BA_537AEC5E03DDget_var*
//#UC END# *53C8BC8A01BA_537AEC5E03DDget_var*
begin
//#UC START# *53C8BC8A01BA_537AEC5E03DDget_impl*
 if (f_ContainerList = nil) then
 begin
  f_ContainerList := Tl3LongIntList.Create;
  UpdateContainerList;
 end;
 Result := f_ContainerList;
//#UC END# *53C8BC8A01BA_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetContainerList

function TvcmTabbedContainerFormDispatcher.pm_GetTabImages: TCustomImageList;
//#UC START# *53D0CE72027D_537AEC5E03DDget_var*
//#UC END# *53D0CE72027D_537AEC5E03DDget_var*
begin
//#UC START# *53D0CE72027D_537AEC5E03DDget_impl*
 Result := f_TabImages;
//#UC END# *53D0CE72027D_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetTabImages

procedure TvcmTabbedContainerFormDispatcher.pm_SetTabImages(aValue: TCustomImageList);
//#UC START# *53D0CE72027D_537AEC5E03DDset_var*
//#UC END# *53D0CE72027D_537AEC5E03DDset_var*
begin
//#UC START# *53D0CE72027D_537AEC5E03DDset_impl*
 f_TabImages := aValue;
//#UC END# *53D0CE72027D_537AEC5E03DDset_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_SetTabImages

function TvcmTabbedContainerFormDispatcher.pm_GetListeners: Tl3LongintList;
//#UC START# *53DF47200079_537AEC5E03DDget_var*
//#UC END# *53DF47200079_537AEC5E03DDget_var*
begin
//#UC START# *53DF47200079_537AEC5E03DDget_impl*
 if (f_Listeners = nil) then
  f_Listeners := Tl3LongIntList.Create;
 Result := f_Listeners;
//#UC END# *53DF47200079_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetListeners

function TvcmTabbedContainerFormDispatcher.pm_GetIsLocked: Boolean;
//#UC START# *541955CE02D2_537AEC5E03DDget_var*
//#UC END# *541955CE02D2_537AEC5E03DDget_var*
begin
//#UC START# *541955CE02D2_537AEC5E03DDget_impl*
 Result := (f_LockCount > 0);
//#UC END# *541955CE02D2_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetIsLocked

function TvcmTabbedContainerFormDispatcher.pm_GetHasAnyDockedForms: Boolean;
//#UC START# *5444CBCA00F3_537AEC5E03DDget_var*
//#UC END# *5444CBCA00F3_537AEC5E03DDget_var*
begin
//#UC START# *5444CBCA00F3_537AEC5E03DDget_impl*
 Result := (ContainerCount > 0) and (TvcmTabbedContainerForm(ContainerList[0]).FormCount > 0);
//#UC END# *5444CBCA00F3_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetHasAnyDockedForms

function TvcmTabbedContainerFormDispatcher.pm_GetActiveVCMContainer: IvcmContainer;
//#UC START# *5583E3F7021E_537AEC5E03DDget_var*
var
 l_ActiveContainer: TvcmTabbedContainerForm;
 l_MainFormContainer: IafwMainFormContainer;
 l_MainForm: TafwCustomForm;
 l_VCMContainer: IvcmContainer;
//#UC END# *5583E3F7021E_537AEC5E03DDget_var*
begin
//#UC START# *5583E3F7021E_537AEC5E03DDget_impl*
 l_ActiveContainer := GetCurrentActiveContainer;
 l_VCMContainer := nil;
 if Supports(l_ActiveContainer, IafwMainFormContainer, l_MainFormContainer) then
 begin
  l_MainForm := l_MainFormContainer.CurrentMainForm;
  if not Supports(l_MainForm, IvcmContainer, l_VCMContainer) then
   Assert(False);
 end
 else
  Assert(False);
 Result := l_VCMContainer;
//#UC END# *5583E3F7021E_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetActiveVCMContainer

function TvcmTabbedContainerFormDispatcher.pm_GetReopeningTab: Boolean;
//#UC START# *560BA7C70186_537AEC5E03DDget_var*
//#UC END# *560BA7C70186_537AEC5E03DDget_var*
begin
//#UC START# *560BA7C70186_537AEC5E03DDget_impl*
 Result := f_ReopeningTab;
//#UC END# *560BA7C70186_537AEC5E03DDget_impl*
end;//TvcmTabbedContainerFormDispatcher.pm_GetReopeningTab

procedure TvcmTabbedContainerFormDispatcher.StartMakingClone(aContainer: TvcmTabbedContainerForm);
//#UC START# *537AF05A0038_537AEC5E03DD_var*
//#UC END# *537AF05A0038_537AEC5E03DD_var*
begin
//#UC START# *537AF05A0038_537AEC5E03DD_impl*
// Assert(not f_MakingClone);
 f_MakingClone := True;
 f_ContainerForClone := aContainer;
//#UC END# *537AF05A0038_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.StartMakingClone

procedure TvcmTabbedContainerFormDispatcher.EndMakingClone;
//#UC START# *537AF0A10004_537AEC5E03DD_var*
//#UC END# *537AF0A10004_537AEC5E03DD_var*
begin
//#UC START# *537AF0A10004_537AEC5E03DD_impl*
// Assert(f_MakingClone);
 f_MakingClone := False;
//#UC END# *537AF0A10004_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.EndMakingClone

function TvcmTabbedContainerFormDispatcher.MakeNewTabbedContainer(aChildForm: TvcmEntityForm;
 aNeedPlace: Boolean = True;
 aNeedLoadFromSettings: Boolean = True;
 aNeedShow: Boolean = True;
 const aParams: Il3TabParams = nil): TvcmTabbedContainerForm;
//#UC START# *537AF0BC0134_537AEC5E03DD_var*

type
 TNewContainerOffset = record
  rdX: Integer;
  rdY: Integer;
 end;

const
 cNewContainerVerticalOffset = 50;
 cNewContainerHorizontalOffset = 50;
 cNewContainerPosOffsetArr: array[TWindowState] of TNewContainerOffset =
  ((rdX: cNewContainerHorizontalOffset; rdY: cNewContainerVerticalOffset), //wsNormal
   (rdX: 0; rdY: 0), //wsMinimized
   (rdX: 0; rdY: 0)  //wsMaximized
  );

 procedure lp_PlaceContainer(aActiveContainer: TvcmTabbedContainerForm;
                             aContainerToPlace: TvcmTabbedContainerForm);
 var
  l_Rect: TRect;
  l_WndState: TWindowState;
 begin
  if (ContainerCount > 1) or (aActiveContainer <> nil) then
  begin
   SetRectEmpty(l_Rect);
   if Assigned(aActiveContainer)
    then l_WndState := aActiveContainer.WindowState
    else l_WndState := wsNormal;
   if (not IsRectEmpty(f_NewContainerRect)) then
    l_Rect := f_NewContainerRect
    // - http://mdp.garant.ru/pages/viewpage.action?pageId=589859800
   else
   begin
    if (aActiveContainer <> nil) and (aActiveContainer.WindowState <> wsMaximized) then
    begin
     l_Rect := aActiveContainer.BoundsRect;
     OffsetRect(l_Rect,
                cNewContainerPosOffsetArr[aActiveContainer.WindowState].rdX,
                cNewContainerPosOffsetArr[aActiveContainer.WindowState].rdY);
     l_WndState := aActiveContainer.WindowState;
     if (l_WndState = wsMinimized) then
      l_WndState := aActiveContainer.WindowStateBeforeMinimizing;
    end;
   end;
   if IsRectEmpty(l_Rect) then
    aContainerToPlace.WindowState := l_WndState
   else
   begin
    aContainerToPlace.WindowState := wsNormal;
    aContainerToPlace.BoundsRect := l_Rect;
   end;
   aContainerToPlace.Visible := True;
  end;
 end;//lp_PlaceContainer

var
 l_Form: TvcmEntityForm;
 l_Rect: TRect;
 l_NewContBounds: TRect;
 l_Msg: TMsg;
 l_ExistingContainer: TvcmTabbedContainerForm;
 l_ActiveContainer: TvcmTabbedContainerForm;
//#UC END# *537AF0BC0134_537AEC5E03DD_var*
begin
//#UC START# *537AF0BC0134_537AEC5E03DD_impl*
 l_ActiveContainer := GetCurrentActiveContainer;
 Assert(aChildForm is DockableFormClass);
 NotifyListeners(tcnNewContainerMakingStarted);
 l_ExistingContainer := GetFormContainer(aChildForm);

 if (l_ExistingContainer = nil) then
 begin
  l_Form := TvcmEntityForm(aChildForm);
  if f_MakingClone then
  begin
   Result := f_ContainerForClone;
   Result.InsertForm(l_Form);
  end
  else
  begin
   l_Form := aChildForm;
   Result := TvcmTabbedContainerForm.MakeWithChild(aChildForm, aParams, aNeedLoadFromSettings);
   if (Application.MainForm = nil) OR (not (Application.MainForm is TvcmTabbedContainerForm)) then
    THackApplication(Application).FMainForm := Result;
   afw.ProcessMessages;
  end;
 end
 else
  Result := l_ExistingContainer;
 UpdateContainerList;
 Result.UpdateMenu;
 if aNeedPlace then
 begin
  Result.Handle;
  lp_PlaceContainer(l_ActiveContainer, Result);
 end
 else
  Result.WindowState := wsNormal;
// - http://mdp.garant.ru/pages/viewpage.action?pageId=567571961&focusedCommentId=568141714#comment-568141714
 NotifyListeners(tcnNewContainerMakingFinished);

 if aNeedShow then
 begin
  Result.Show;
  aChildForm.Show;
 end;
 afw.ProcessMessages;
//#UC END# *537AF0BC0134_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.MakeNewTabbedContainer

function TvcmTabbedContainerFormDispatcher.InsertFormIntoANewContainer(aForm: TForm;
 const aRect: TRect;
 const aParams: Il3TabParams = nil): TvcmTabbedContainerForm;
//#UC START# *537AF112024C_537AEC5E03DD_var*

 function lp_DoFindFormContainer(aContainedForm: TForm): TvcmTabbedContainerForm;
 var
  l_Control: TControl;
 begin
  Result := nil;
  l_Control := aContainedForm;
  while (l_Control <> nil) do
  begin
   l_Control := l_Control.Parent;
   if (l_Control is TvcmTabbedContainerForm) then
   begin
    Result := TvcmTabbedContainerForm(l_Control);
    Break;
   end;//if (l_Control is TvcmTabbedContainerForm)
  end;//while (l_Control <> nil)
 end;//lp_DoFindFormContainer

var
 l_PrevContainer: TvcmTabbedContainerForm;
 l_Form: TvcmEntityForm;
//#UC END# *537AF112024C_537AEC5E03DD_var*
begin
//#UC START# *537AF112024C_537AEC5E03DD_impl*
 l_Form := aForm as TvcmEntityForm;
 l_PrevContainer := GetFormContainer(l_Form);
 Assert(l_PrevContainer <> nil);
 aForm.Align := alNone;
 FormRemovedFromContainer(l_Form, l_PrevContainer);
 Result := MakeNewTabbedContainer(l_Form, False, False, False, aParams);
 with Result do
 begin
  BoundsRect := aRect;
  Visible := True;
 end;//with Result
//#UC END# *537AF112024C_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.InsertFormIntoANewContainer

procedure TvcmTabbedContainerFormDispatcher.FormInsertedIntoContainer(aForm: TForm;
 aContainer: TvcmTabbedContainerForm);
//#UC START# *537C260501DA_537AEC5E03DD_var*

 procedure lp_AddOrChangeMapRecord(aContainedForm: TvcmEntityForm);
 var
  l_Index: Integer;

  function lp_DoFindForm(anItem: PvcmContainedFormDescr; anIndex: Integer): Boolean;
  begin
   Result := not (anItem^.rForm = aContainedForm);
   if (not Result) then
    l_Index := anIndex;
  end;//lp_DoFindForm

 var
  l_FormDescr: TvcmContainedFormDescr;
 begin
  l_Index := -1;
  FormToContainerMap.IterateAllF(l3L2IA(@lp_DoFindForm));
  l_FormDescr := TvcmContainedFormDescr_C(TvcmEntityForm(aForm), aContainer);
  if (l_Index = -1) then
   FormToContainerMap.Add(l_FormDescr)
  else
   FormToContainerMap.Items[l_Index] := l_FormDescr;
 end;//lp_AddOrChangeMapRecord

var
 l_Form: TvcmEntityForm;
//#UC END# *537C260501DA_537AEC5E03DD_var*
begin
//#UC START# *537C260501DA_537AEC5E03DD_impl*
 Assert(aForm is TvcmEntityForm);
 l_Form := TvcmEntityForm(aForm);
 lp_AddOrChangeMapRecord(l_Form);
 UpdateContainerList;
 NotifyListeners(tcnTabChanged);
 UpdateFormTabInContainer(l_Form);
//#UC END# *537C260501DA_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.FormInsertedIntoContainer

function TvcmTabbedContainerFormDispatcher.GetFormContainer(aForm: TForm): TvcmTabbedContainerForm;
//#UC START# *537C29870349_537AEC5E03DD_var*
var
 l_Container: TvcmTabbedContainerForm;

 function lp_DoFindFormContainer(anItem: PvcmContainedFormDescr; anIndex: Integer): Boolean;
 begin
  Result := True;
  if (anItem^.rForm = aForm) then
  begin
   Result := False;
   l_Container := anItem^.rContainer;
  end;
 end;//lp_DoFindFormContainer

//#UC END# *537C29870349_537AEC5E03DD_var*
begin
//#UC START# *537C29870349_537AEC5E03DD_impl*
 l_Container := nil;
 FormToContainerMap.IterateAllF(l3L2IA(@lp_DoFindFormContainer));
 Result := l_Container;
//#UC END# *537C29870349_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetFormContainer

procedure TvcmTabbedContainerFormDispatcher.FormRemovedFromContainer(aForm: TForm;
 aContainer: TvcmTabbedContainerForm);
//#UC START# *537C33F90372_537AEC5E03DD_var*
var
 l_FormDescr: TvcmContainedFormDescr;
 l_Index: Integer;
//#UC END# *537C33F90372_537AEC5E03DD_var*
begin
//#UC START# *537C33F90372_537AEC5E03DD_impl*
 Assert(aForm is TvcmEntityForm);
 l_Index := 0;
 l_FormDescr := TvcmContainedFormDescr_C(TvcmEntityForm(aForm), aContainer);
 l_Index := FormToContainerMap.IndexOf(l_FormDescr);
 if (l_Index <> -1) then
  FormToContainerMap.Delete(l_Index);
//#UC END# *537C33F90372_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.FormRemovedFromContainer

procedure TvcmTabbedContainerFormDispatcher.MoveToAnotherContainer(aForm: TForm;
 aNewContainer: TvcmTabbedContainerForm;
 const aMousePoint: TPoint);
//#UC START# *537C3FE702B2_537AEC5E03DD_var*
var
 l_Container: TvcmTabbedContainerForm;
 l_Params: Il3TabParams;
//#UC END# *537C3FE702B2_537AEC5E03DD_var*
begin
//#UC START# *537C3FE702B2_537AEC5E03DD_impl*
 f_DisableAskMayExit := True;
 l_Container := GetFormContainer(aForm);
 if (l_Container <> nil) then
 begin
  l_Params := l_Container.MakeFormTabParams(aForm as TvcmEntityForm);
  l_Container.RemoveForm(aForm, False);
 end
 else
  l_Params := nil;
 FormRemovedFromContainer(aForm, l_Container);
 aNewContainer.InsertForm(aForm, aMousePoint, l_Params);
 f_DisableAskMayExit := False;
//#UC END# *537C3FE702B2_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.MoveToAnotherContainer

function TvcmTabbedContainerFormDispatcher.FindTabbedContainerUnderPoint(const aPoint: TPoint;
 aForm: TForm): TvcmTabbedContainerForm;
//#UC START# *5386CE9E0213_537AEC5E03DD_var*
var
 l_wndHandle: HWND;
 l_PtToTest: TPoint;
 l_Control: TControl;
//#UC END# *5386CE9E0213_537AEC5E03DD_var*
begin
//#UC START# *5386CE9E0213_537AEC5E03DD_impl*
 Assert(NeedUseTabs);
 l_wndHandle := HWND(0);
 Result := nil;
 l_PtToTest := Point(aPoint.X, Pred(aForm.BoundsRect.Top));
 l_wndHandle := WindowFromPoint(l_PtToTest);
 if (l_wndHandle <> 0) then
 begin
  l_Control := FindControl(l_wndHandle);
  if (l_Control <> nil) and (l_Control is TvcmTabbedContainerForm) then
   Result := TvcmTabbedContainerForm(l_Control);
 end;
//#UC END# *5386CE9E0213_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.FindTabbedContainerUnderPoint

function TvcmTabbedContainerFormDispatcher.TryDockToTabset(const aPoint: TPoint;
 aDockClientForm: TvcmEntityForm;
 aContainerForm: TvcmTabbedContainerForm): Boolean;
//#UC START# *5386CED5030E_537AEC5E03DD_var*
var
 l_Container: TvcmTabbedContainerForm;
//#UC END# *5386CED5030E_537AEC5E03DD_var*
begin
//#UC START# *5386CED5030E_537AEC5E03DD_impl*
 Result := False;
 l_Container := FindTabbedContainerUnderPoint(aPoint, aContainerForm);
 if (l_Container <> nil) then
 begin
  if (GetContainedFormCount(l_Container) < cMaxTabCount) AND
   (l_Container.CanBeDocked(aPoint, aDockClientForm)) AND
   (not (fsShowing in aContainerForm.FormState)) then
  begin
   MoveToAnotherContainer(aDockClientForm, l_Container, aPoint);
   Result := True;
  end;
 end;
//#UC END# *5386CED5030E_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.TryDockToTabset

procedure TvcmTabbedContainerFormDispatcher.SignalClosingForm(aForm: TForm);
//#UC START# *539FDF8A01A7_537AEC5E03DD_var*
var
 l_Container: TvcmTabbedContainerForm;
//#UC END# *539FDF8A01A7_537AEC5E03DD_var*
begin
//#UC START# *539FDF8A01A7_537AEC5E03DD_impl*
 if NeedUseTabs then
 begin
  l_Container := GetFormContainer(aForm);
  FormRemovedFromContainer(aForm, l_Container);
  if (l_Container <> nil) AND (GetContainedFormCount(l_Container) = 0) then
   l_Container.SafeClose;
 end;
//#UC END# *539FDF8A01A7_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.SignalClosingForm

function TvcmTabbedContainerFormDispatcher.GetContainedFormCount(aContainer: TvcmTabbedContainerForm): Integer;
//#UC START# *539FFBA800F5_537AEC5E03DD_var*
var
 l_ContainedFormCount: Integer;

 function lp_DoGetContainedFormCount(anItem: PvcmContainedFormDescr; anIndex: Integer): Boolean;
 begin
  if (anItem^.rContainer = aContainer) then
   Inc(l_ContainedFormCount);
  Result := True;
 end;//lp_DoGetContainedFormCount

var
 l_Container: TvcmTabbedContainerForm;
//#UC END# *539FFBA800F5_537AEC5E03DD_var*
begin
//#UC START# *539FFBA800F5_537AEC5E03DD_impl*
 Assert(NeedUseTabs);
 l_ContainedFormCount := 0;
 FormToContainerMap.IterateAllF(l3L2IA(@lp_DoGetContainedFormCount));
 Result := l_ContainedFormCount;
//#UC END# *539FFBA800F5_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetContainedFormCount

function TvcmTabbedContainerFormDispatcher.CallContainerCloseQuery(aContainer: TvcmTabbedContainerForm): Boolean;
//#UC START# *53A0034203D4_537AEC5E03DD_var*
var
 l_CloseQueryResult: Boolean;

 function lp_DoCallCloseQuery(anItem: PvcmContainedFormDescr;
  anIndex: Integer): Boolean;
 var
  l_FormCloseQueryResult: Boolean;
  l_Form: TvcmEntityForm;
 begin
  if (anItem^.rContainer = aContainer) then
  begin
   l_Form := anItem^.rForm;
   l_FormCloseQueryResult := l_Form.CloseQuery;
   if (not l_FormCloseQueryResult) then
    l_CloseQueryResult := False;
  end;
  Result := True;  
 end;//lp_DoGetFirstContainedForm

//#UC END# *53A0034203D4_537AEC5E03DD_var*
begin
//#UC START# *53A0034203D4_537AEC5E03DD_impl*
 Assert(NeedUseTabs);
 Result := True;
 if (not f_IsUndockingAll) then
 begin
  Windows.SetActiveWindow(aContainer.Handle);
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=567567848
  Result := False;
  if (GetContainedFormCount(aContainer) >= 1) then
  begin
   l_CloseQueryResult := True;  
   FormToContainerMap.IterateAllF(l3L2IA(@lp_DoCallCloseQuery));
   Result := l_CloseQueryResult;
  end;
  if (not Result) then
  begin
   f_CloseQueryContainer := nil;
   aContainer.ResetClosing;
  end;
 end;
//#UC END# *53A0034203D4_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.CallContainerCloseQuery

function TvcmTabbedContainerFormDispatcher.NeedAskMayExit(aForm: TForm): Boolean;
//#UC START# *53A01BFD00C8_537AEC5E03DD_var*
var
 l_Container: TvcmTabbedContainerForm;
 l_ContainedFormCount: Integer;
//#UC END# *53A01BFD00C8_537AEC5E03DD_var*
begin
//#UC START# *53A01BFD00C8_537AEC5E03DD_impl*
 Assert(NeedUseTabs);
 l_Container := GetFormContainer(aForm);
 if (l_Container <> nil) then
 begin
  l_ContainedFormCount := GetContainedFormCount(l_Container);
  Result := (not f_DisableAskMayExit) and
            ((ContainerCount = 1) and
             (f_CloseQueryContainer <> l_Container) and
             (l_Container.ContainerIsClosing or (l_ContainedFormCount = 1)));
  if Result then
   f_CloseQueryContainer := l_Container;
 end
 else
  Result := False;
//#UC END# *53A01BFD00C8_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.NeedAskMayExit

procedure TvcmTabbedContainerFormDispatcher.AddFormToContainer(aForm: TvcmEntityForm;
 aContainer: TvcmTabbedContainerForm;
 aNeedSwitchTab: Boolean;
 aAddLast: Boolean = False;
 aOpenAfter: TvcmEntityForm = nil);
//#UC START# *53A3EDCC01CE_537AEC5E03DD_var*
//#UC END# *53A3EDCC01CE_537AEC5E03DD_var*
begin
//#UC START# *53A3EDCC01CE_537AEC5E03DD_impl*
 Assert(NeedUseTabs);
 Assert(aForm <> nil);
 Assert(aContainer <> nil);
 aForm.Handle;
 aContainer.InsertForm(aForm, nil, aNeedSwitchTab, aAddLast, aOpenAfter);
//#UC END# *53A3EDCC01CE_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.AddFormToContainer

procedure TvcmTabbedContainerFormDispatcher.SignalContainerIsClosing(aContainer: TvcmTabbedContainerForm);
//#UC START# *53A3F2370241_537AEC5E03DD_var*
var
 l_Index: Integer;
//#UC END# *53A3F2370241_537AEC5E03DD_var*
begin
//#UC START# *53A3F2370241_537AEC5E03DD_impl*
 Assert(NeedUseTabs);
 if (aContainer = f_ActiveContainer) then
  f_ActiveContainer := nil;
 for l_Index := Pred(FormToContainerMap.Count) downto 0 do
  if (FormToContainerMap[l_Index].rContainer = aContainer) then
   FormToContainerMap.Delete(l_Index);
 Dec(f_ContainerCount);
 UpdateContainerList;
 if (ContainerList.Count = 0) then
  GetDefController.EntryCommands.UnsubscribeGlobalKeyDataListener(Self As Il3KeyDataListener);
//#UC END# *53A3F2370241_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.SignalContainerIsClosing

function TvcmTabbedContainerFormDispatcher.PlaceVcmContainer(const aPrevContainer: IvcmContainer;
 const aNewContainer: IvcmContainer;
 aOpenKind: TvcmMainFormOpenKind;
 aNeedSwitchTab: Boolean;
 aOpenLast: Boolean = False;
 aOpenAfter: TvcmEntityForm = nil): IvcmContainer;
//#UC START# *53A4169700BE_537AEC5E03DD_var*
var
 l_Form: TvcmEntityForm;
 l_PrevForm: TvcmEntityForm;
 l_PrevContainer: TvcmTabbedContainerForm;
 l_NewContainer: TvcmTabbedContainerForm;
//#UC END# *53A4169700BE_537AEC5E03DD_var*
begin
//#UC START# *53A4169700BE_537AEC5E03DD_impl*
 Result := aPrevContainer;
 l_Form := nil;
 l_NewContainer := nil;
 if (aNewContainer <> nil) then
  l_Form := aNewContainer.AsForm.VCLWinControl as TvcmEntityForm;
 l_PrevForm := aPrevContainer.AsForm.VCLWinControl as TvcmEntityForm;
 l_PrevContainer := GetFormContainer(l_PrevForm);
 Assert((l_Form <> nil) OR (aOpenKind = vcm_okInCurrentTab));
 case aOpenKind of
  vcm_okInCurrentTab: // � ������� �������
   begin
    l_NewContainer := l_PrevContainer;
    Result := aPrevContainer;
   end;
  vcm_okInNewTab: // � ����� �������, � ��� �� ����
   if NeedUseTabs then // �� ��������� ������� - ���, ����� ����� ������ !
   begin
    if (l_PrevContainer = nil) then
     l_PrevContainer := GetCurrentActiveContainer;
    AddFormToContainer(l_Form, l_PrevContainer, aNeedSwitchTab, aOpenLast, aOpenAfter);
    l_NewContainer := l_PrevContainer;
    Result := aNewContainer;
   end;
  vcm_okInNewWindow: // � ����� ����
   begin
    if NeedUseTabs then // �� ��������� ������� - ���, ����� ����� ������ !
     l_NewContainer := MakeNewTabbedContainer(l_Form as TvcmEntityForm, False, False, False);
    Result := aNewContainer;
   end;
 end;
 if (l_NewContainer <> nil) then
 begin
  if (aNewContainer <> nil) AND
     (aOpenKind = vcm_okInNewWindow) then
  begin
   if (not IsRectEmpty(f_NewContainerRect)) then
    l_NewContainer.BoundsRect := f_NewContainerRect
   else
   if (l_PrevContainer <> nil) then
   begin
    l_NewContainer.Top := l_PrevContainer.Top + 50;
    l_NewContainer.Left := l_PrevContainer.Left + 50;
    l_NewContainer.WindowState := l_PrevContainer.WindowState;
   end;
   l_NewContainer.Visible := True;
   // - http://mdp.garant.ru/pages/viewpage.action?pageId=596409639   
  end;
 end;
//#UC END# *53A4169700BE_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.PlaceVcmContainer

function TvcmTabbedContainerFormDispatcher.MakeAndPlaceVCMContainer(const aContainerMaker: IvcmContainerMaker;
 const aPrevContainer: IvcmContainer;
 aOpenKind: TvcmMainFormOpenKind;
 aNeedSwitchTab: Boolean;
 aOpenLast: Boolean = False;
 aOpenAfter: TvcmEntityForm = nil): IvcmContainer;
//#UC START# *53ABACF10053_537AEC5E03DD_var*

 function lp_CheckOpenKind(var aFormOpenKind: TvcmMainFormOpenKind): Boolean;
 var
  l_Form: TvcmEntityForm;
  l_Container: TvcmTabbedContainerForm;
 begin
  Result := True;
  l_Form := aPrevContainer.AsForm.VCLWinControl as TvcmEntityForm;
  l_Container := GetFormContainer(l_Form);
  case aFormOpenKind of
   vcm_okInNewTab:
    if (not CanOpenNewTab(l_Container)) then
    begin
     vcmSay(str_TooManyTabsOpened, mtWarning);
     Result := False;
     aFormOpenKind := vcm_okInCurrentTab;
     // - http://mdp.garant.ru/pages/viewpage.action?pageId=602475528
    end;//(not CanOpenNewTab(l_Container))
   vcm_okInNewWindow:
    if (not CanOpenNewContainer) then
    begin
     Result := vcmAsk(str_TooManyWindowsOpened, []);
     if Result then
      aFormOpenKind := vcm_okInCurrentTab;
    end;//(not CanOpenNewContainer)
   vcm_okInCurrentTab:
    Result := True;
  end;//case aFormOpenKind...
 end;//lp_CheckOpenKind

var
 l_Container: IvcmContainer;
 l_OpenKind: TvcmMainFormOpenKind;
//#UC END# *53ABACF10053_537AEC5E03DD_var*
begin
//#UC START# *53ABACF10053_537AEC5E03DD_impl*
 Assert(aContainerMaker <> nil);
 Result := nil;
 if IsLocked then
  Exit;
 Lock;
 NotifyListeners(tcnNewTabOrWindowOpeningStarted);
 try
  l_Container := nil;
  l_OpenKind := aOpenKind;
  if lp_CheckOpenKind(l_OpenKind) then
  begin
   if (l_OpenKind <> vcm_okInCurrentTab) then
   begin
    l_Container := aContainerMaker.MakeContainer;
    if (not NeedUseTabs) and (l_OpenKind = vcm_okInNewWindow) then
     TvcmEntityForm(l_Container.AsForm.VCLWinControl).Show
   end
   else
    l_Container := aPrevContainer;
   try
    Result := PlaceVCMContainer(aPrevContainer, l_Container, l_OpenKind,
     aNeedSwitchTab, aOpenLast, aOpenAfter);
   finally
    l_Container := nil;
   end;//try..finally
  end;
 finally
  Unlock;
  NotifyListeners(tcnNewTabOrWindowOpeningFinished);
 end;
//#UC END# *53ABACF10053_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.MakeAndPlaceVCMContainer

function TvcmTabbedContainerFormDispatcher.CanOpenNewTab(aContainer: TvcmTabbedContainerForm): Boolean;
//#UC START# *53ABC9D100D3_537AEC5E03DD_var*
//#UC END# *53ABC9D100D3_537AEC5E03DD_var*
begin
//#UC START# *53ABC9D100D3_537AEC5E03DD_impl*
 Result := (GetContainedFormCount(aContainer) < cMaxTabCount);
//#UC END# *53ABC9D100D3_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.CanOpenNewTab

function TvcmTabbedContainerFormDispatcher.CanOpenNewContainer: Boolean;
//#UC START# *53ABCF2B0253_537AEC5E03DD_var*
//#UC END# *53ABCF2B0253_537AEC5E03DD_var*
begin
//#UC START# *53ABCF2B0253_537AEC5E03DD_impl*
 Result := (not NeedUseTabs) OR (ContainerCount < cMaxContainerCount);
//#UC END# *53ABCF2B0253_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.CanOpenNewContainer

procedure TvcmTabbedContainerFormDispatcher.ActivateTabByIndex(aContainer: TvcmTabbedContainerForm;
 aTabIndex: Integer);
//#UC START# *53B251AA0130_537AEC5E03DD_var*
//#UC END# *53B251AA0130_537AEC5E03DD_var*
begin
//#UC START# *53B251AA0130_537AEC5E03DD_impl*
 Assert(aContainer <> nil);
 aContainer.ActivateTabByIndex(aTabIndex);
//#UC END# *53B251AA0130_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.ActivateTabByIndex

function TvcmTabbedContainerFormDispatcher.GetCurrentActiveContainer: TvcmTabbedContainerForm;
//#UC START# *53B2531B0127_537AEC5E03DD_var*
var
 l_ActiveWindow: TWinControl;
//#UC END# *53B2531B0127_537AEC5E03DD_var*
begin
//#UC START# *53B2531B0127_537AEC5E03DD_impl*
 l_ActiveWindow := FindControl(Windows.GetActiveWindow);
 if (l_ActiveWindow <> nil) AND (l_ActiveWindow is TvcmTabbedContainerForm) then
  Result := TvcmTabbedContainerForm(l_ActiveWindow)
 else
  Result := nil;
 if (Result = nil) then
  Result := f_ActiveContainer; 
//#UC END# *53B2531B0127_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetCurrentActiveContainer

constructor TvcmTabbedContainerFormDispatcher.Create;
//#UC START# *53B2630803B0_537AEC5E03DD_var*
//#UC END# *53B2630803B0_537AEC5E03DD_var*
begin
//#UC START# *53B2630803B0_537AEC5E03DD_impl*
 inherited;
 f_LockedContainers := TvcmContainersLockCountList.Create;
 f_MainFormProvider := TvcmChromeLikeMainFormProvider.Make;
 GetDefController.EntryCommands.SubscribeGlobalKeyDataListener(Self As Il3KeyDataListener);
 SetRectEmpty(f_NewContainerRect);
// vcmDispatcher.FormDispatcher.MainFormProvider := f_MainFormProvider;
//#UC END# *53B2630803B0_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.Create

procedure TvcmTabbedContainerFormDispatcher.NotifyFormDataSourceChanged(const aContainedForm: IvcmEntityForm;
 const aChildForm: IvcmEntityForm;
 const aFormDataSource: IvcmFormDataSource);
//#UC START# *53B38FC00395_537AEC5E03DD_var*
var
 l_MainForm: TvcmEntityForm;
 l_Container: TvcmTabbedContainerForm;
 l_IconProvider: IvcmFormSetIconProvider;
 l_ImageIndex: Integer;
 l_Caption: IvcmCString;
//#UC END# *53B38FC00395_537AEC5E03DD_var*
begin
//#UC START# *53B38FC00395_537AEC5E03DD_impl*
 Assert(aContainedForm <> nil);
 Assert(aChildForm <> nil);
 if NeedUseTabs then
  UpdateFormTabInContainer(aContainedForm.VCLWinControl As TvcmEntityForm);

 if (aChildForm.DataSource <> nil) AND (aChildForm.DataSource.UseCaseController <> nil) then
 begin
  l_Caption := aChildForm.DataSource.UseCaseController.MainCaption;
  if l3IsNil(l_Caption) then
   l_Caption := GetContainedFormCaption(aContainedForm.VCLWinControl As TvcmEntityForm);

  if (not l3IsNil(l_Caption)) then
   UpdateTabCaption(aChildForm, l_Caption);
 end;
//#UC END# *53B38FC00395_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.NotifyFormDataSourceChanged

procedure TvcmTabbedContainerFormDispatcher.UpdateTab(const aChildForm: IvcmEntityForm);
//#UC START# *53B66E8C005B_537AEC5E03DD_var*
var
 l_MainForm: TvcmEntityForm;
 l_VCMContainer: IvcmContainer;
 l_TabbedContainer: TvcmTabbedContainerForm;
 l_IconProvider: IvcmFormSetIconProvider;
 l_IconIndex: Integer;
//#UC END# *53B66E8C005B_537AEC5E03DD_var*
begin
//#UC START# *53B66E8C005B_537AEC5E03DD_impl*
 if NeedUseTabs then
 begin
  Assert(aChildForm <> nil);
  l_TabbedContainer := nil;
  l_VCMContainer := GetTopMostContainer(aChildForm);
  if (l_VCMContainer <> nil) and (not l_VCMContainer.IsNull) then
  begin
   l_MainForm := l_VCMContainer.AsForm.VCLWinControl as TvcmEntityForm;
   l_TabbedContainer := GetFormContainer(l_MainForm);
   if (l_TabbedContainer <> nil) then
   begin
    l_IconIndex := -1;
    if Supports(aChildForm.VCLWinControl, IvcmFormSetIconProvider, l_IconProvider) OR
       Supports(l_MainForm, IvcmFormSetIconProvider, l_IconProvider) then
    try
     if l_IconProvider.CanDefineFormSetIcon then
      l_IconIndex := l_IconProvider.FormSetImageIndex;
    finally
     l_IconProvider := nil;
    end;//try..finally
    if (l_IconIndex <> -1) then
     l_TabbedContainer.NotifyNeedRefreshFormTab(l_MainForm, l_IconIndex);
   end;//(l_TabbedContainer <> nil)
  end;//(l_VCMContainer <> nil) and (not l_VCMContainer.IsNull)
 end;
//#UC END# *53B66E8C005B_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.UpdateTab

function TvcmTabbedContainerFormDispatcher.GetTopMostContainer(const aForm: IvcmEntityForm): IvcmContainer;
//#UC START# *53BCCB300121_537AEC5E03DD_var*
var
 l_Form: IvcmEntityForm;
 l_Cont: IvcmContainer;
//#UC END# *53BCCB300121_537AEC5E03DD_var*
begin
//#UC START# *53BCCB300121_537AEC5E03DD_impl*
 Assert(aForm <> nil);
 l_Form := aForm;
 Result := nil;
 l_Cont := aForm.Container;
 if (not l_Cont.IsNull) then
  while True do
  begin
   l_Form := l_Cont.AsForm;
   if (not l_Form.Container.IsNull) then
    l_Cont := l_Form.Container
   else
   begin
    Result := l_Cont;
    Break;
   end;//(not l_Form.Container.IsNull)
  end;//while true
//#UC END# *53BCCB300121_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetTopMostContainer

procedure TvcmTabbedContainerFormDispatcher.UpdateTabCaption(const aForm: IvcmEntityForm;
 const aCaption: IvcmCString);
//#UC START# *53BCE4BC0363_537AEC5E03DD_var*
var
 l_VCMContainer: IvcmContainer;
 l_MainForm: TvcmEntityForm;
 l_TabbedContainer: TvcmTabbedContainerForm;
 l_Caption: IvcmCString;
//#UC END# *53BCE4BC0363_537AEC5E03DD_var*
begin
//#UC START# *53BCE4BC0363_537AEC5E03DD_impl*
 if NeedUseTabs then
 begin
  l_VCMContainer := GetTopMostContainer(aForm);
  if (l_VCMContainer <> nil) then
  begin
   l_MainForm := l_VCMContainer.AsForm.VCLWinControl as TvcmEntityForm;
   l_TabbedContainer := GetFormContainer(l_MainForm);
   if (l_TabbedContainer <> nil) then
    l_TabbedContainer.UpdateTabCaption(aForm.VCLWinControl As TvcmEntityForm);
  end;
 end;
//#UC END# *53BCE4BC0363_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.UpdateTabCaption

procedure TvcmTabbedContainerFormDispatcher.UpdateContainerList;
//#UC START# *53C8BC290226_537AEC5E03DD_var*

  function lp_AddContainerToList(anItem: PvcmContainedFormDescr; anIndex: Integer): Boolean;
  var
   l_Container: TvcmTabbedContainerForm;
  begin
   l_Container := anItem^.rContainer;
   if Assigned(l_Container) and (ContainerList.IndexOf(Integer(l_Container)) = -1) then
    ContainerList.Add(Integer(l_Container));
   Result := True;
  end;//lp_AddContainerToList

//#UC END# *53C8BC290226_537AEC5E03DD_var*
begin
//#UC START# *53C8BC290226_537AEC5E03DD_impl*
 ContainerList.Clear;
 FormToContainerMap.IterateAllF(l3L2IA(@lp_AddContainerToList));
 NotifyListeners(tcnTabChanged);
//#UC END# *53C8BC290226_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.UpdateContainerList

function TvcmTabbedContainerFormDispatcher.MakeContainersList: IvcmEntityFormsIterable;
//#UC START# *53D1E0640047_537AEC5E03DD_var*
var
 l_List: IvcmEntityFormsIterable;

 function lp_DoAddForm(anItem: Pointer; anIndex: Integer): Boolean;
 var
  l_Container: TvcmTabbedContainerForm;
  l_Form: IvcmEntityForm;
 begin
  l_Container := TvcmTabbedContainerForm(anItem^);
  l_Form := l_Container.As_IvcmEntityForm;
  try
   l_List.AddForm(l_Form);
  finally
   l_Form := nil;
  end;//try..finally
  Result := True;
 end;//lp_DoAddForm

//#UC END# *53D1E0640047_537AEC5E03DD_var*
begin
//#UC START# *53D1E0640047_537AEC5E03DD_impl*
 Result := nil;
 if NeedUseTabs then
 begin
  l_List := TvcmEntityFormsIterable.Make;
  try
   ContainerList.IterateAllF(l3L2IA(@lp_DoAddForm));
   Result := l_List;
  finally
   l_List := nil;
  end;//try..finally
 end;//if NeedUseTabs
//#UC END# *53D1E0640047_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.MakeContainersList

procedure TvcmTabbedContainerFormDispatcher.CloseAllWindows(const aCurrent: IvcmEntityForm);
//#UC START# *53D201EB03D9_537AEC5E03DD_var*
var
 l_Form: TvcmEntityForm;
 l_CurrentForm: IvcmEntityForm;
 l_TabbedContainer: TvcmTabbedContainerForm;
//#UC END# *53D201EB03D9_537AEC5E03DD_var*
begin
//#UC START# *53D201EB03D9_537AEC5E03DD_impl*
 Assert(aCurrent <> nil);
 l_CurrentForm := nil;
 l_Form := aCurrent.VCLWinControl As TvcmEntityForm;
 if NeedUseTabs then
 begin
  l_TabbedContainer := GetFormContainer(l_Form);
  if (l_TabbedContainer <> nil) then
   l_CurrentForm := l_TabbedContainer.As_IvcmEntityForm;
 end
 else
  l_CurrentForm := aCurrent;
 vcmDispatcher.CloseAllWindows(MakeContainersList, l_CurrentForm);
//#UC END# *53D201EB03D9_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.CloseAllWindows

function TvcmTabbedContainerFormDispatcher.CanCloseAllWindows: Boolean;
//#UC START# *53D207CB01E1_537AEC5E03DD_var*
//#UC END# *53D207CB01E1_537AEC5E03DD_var*
begin
//#UC START# *53D207CB01E1_537AEC5E03DD_impl*
 if NeedUseTabs then
  Result := (pm_GetContainerCount > 1)
 else
  Result := (vcmDispatcher.FormDispatcher.MainFormsCount > 1);
//#UC END# *53D207CB01E1_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.CanCloseAllWindows

function TvcmTabbedContainerFormDispatcher.GetNextMainForm(const aCurrent: IvcmEntityForm): IvcmEntityForm;
//#UC START# *53D21F330074_537AEC5E03DD_var*
var
 l_CurrentContainer: TvcmTabbedContainerForm;
 l_CurrentContainerIndex: Integer;

 function lp_DoGetCurrentIndex(anItem: Pointer; anIndex: Integer): Boolean;
 begin
  if (TvcmTabbedContainerForm(anItem^) = l_CurrentContainer) then
  begin
   l_CurrentContainerIndex := anIndex;
   Result := False;
  end
  else
   Result := True;
 end;//lp_DoGetCurrentIndex

var
 l_NextContainer: TvcmTabbedContainerForm;
//#UC END# *53D21F330074_537AEC5E03DD_var*
begin
//#UC START# *53D21F330074_537AEC5E03DD_impl*
 Result := nil;
 l_CurrentContainer := GetFormContainer(aCurrent.VCLWinControl As TvcmEntityForm);
 l_CurrentContainerIndex := -1;
 Assert(l_CurrentContainer <> nil);
 ContainerList.IterateAllF(l3L2IA(@lp_DoGetCurrentIndex));
 if (l_CurrentContainerIndex <> -1) then
 begin
  Inc(l_CurrentContainerIndex);
  if (l_CurrentContainerIndex = ContainerList.Count) then
   l_CurrentContainerIndex := 0;
  l_NextContainer := TvcmTabbedContainerForm(ContainerList.Items[l_CurrentContainerIndex]);
  if (l_NextContainer <> nil) then
   Result := l_NextContainer.As_IvcmEntityForm;
 end;
//#UC END# *53D21F330074_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetNextMainForm

procedure TvcmTabbedContainerFormDispatcher.UpdateFormTabInContainer(aForm: TvcmEntityForm);
//#UC START# *53D6272000A1_537AEC5E03DD_var*

 function lp_GetImageIndexFromForm(aContainedForm: TvcmEntityForm): Integer;
 var
  l_IconProvider: IvcmFormSetIconProvider;
 begin
  Result := 0;
  if Supports(aContainedForm, IvcmFormSetIconProvider, l_IconProvider) then
  try
   if l_IconProvider.CanDefineFormSetIcon then
    Result := l_IconProvider.FormSetImageIndex;
  finally
   l_IconProvider := nil;
  end;
 end;

 procedure lp_UpdateFormTabLater(aContainedForm: TvcmEntityForm);
 var
  l_FormDescr: TvcmContainedFormDescr;
  l_IconProvider: IvcmFormSetIconProvider;
  l_ImageIndex: Integer;
 begin
  l_ImageIndex := lp_GetImageIndexFromForm(aContainedForm);
  l_FormDescr := TvcmContainedFormDescr_C(aContainedForm, nil, l_ImageIndex, True);
  FormToContainerMap.Add(l_FormDescr);
 end;//lp_UpdateFormTabLater

 procedure lp_UpdateFormTabNow(aContainedForm: TvcmEntityForm; aContainer: TvcmTabbedContainerForm);
 var
  l_Index: Integer;

  function lp_DoFindForm(anItem: PvcmContainedFormDescr; anIndex: Integer): Boolean;
  begin
   Result := not (anItem^.rForm = aContainedForm);
   if (not Result) then
    l_Index := anIndex;
  end;

 var
  l_FormDescr: TvcmContainedFormDescr;
  l_ImageIndex: Integer;
 begin
  l_Index := -1;
  FormToContainerMap.IterateAllF(l3L2IA(@lp_DoFindForm));
  Assert(l_Index <> -1);
  l_FormDescr := FormToContainerMap.Items[l_Index];
  if l_FormDescr.rNeedUpdateImageIndex then
   l_ImageIndex := l_FormDescr.rImageIndex
  else
   l_ImageIndex := lp_GetImageIndexFromForm(aContainedForm);
  if (l_ImageIndex <> -1) then
  begin
   aContainer.NotifyNeedRefreshFormTab(aContainedForm, l_ImageIndex);
   l_FormDescr.rNeedUpdateImageIndex := False;
   FormToContainerMap.Items[l_Index] := l_FormDescr;
  end;
 end;//lp_UpdateFormTabNow

var
 l_FormContainer: TvcmTabbedContainerForm;
//#UC END# *53D6272000A1_537AEC5E03DD_var*
begin
//#UC START# *53D6272000A1_537AEC5E03DD_impl*
 l_FormContainer := GetFormContainer(aForm);
 if (l_FormContainer = nil) then
  lp_UpdateFormTabLater(aForm)
 else
  lp_UpdateFormTabNow(aForm, l_FormContainer);
//#UC END# *53D6272000A1_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.UpdateFormTabInContainer

function TvcmTabbedContainerFormDispatcher.GetContainedFormCaption(aForm: TvcmEntityForm): IvcmCString;
//#UC START# *53D8D3E600AF_537AEC5E03DD_var*
const
 c_fmAny: TvcmFormID = (rName : ''; rID : 0);
var
 l_CurrEntityForm: IvcmEntityForm;
 l_FormSet: IvcmFormSet;
 l_Form: IvcmEntityForm;
//#UC END# *53D8D3E600AF_537AEC5E03DD_var*
begin
//#UC START# *53D8D3E600AF_537AEC5E03DD_impl*
 Result := nil;

 if (aForm is TvcmMainForm) then
  if not TvcmContainerForm(aForm).HasForm(c_fmAny, vcm_ztAny, False,
   @l_Form) then
    Exit;

 l_Form := aForm.As_IvcmEntityForm;

 if (l_Form.FormSet <> nil) then
   Result := l_Form.FormSet.FormSetTabCaption;
 if (l3IsNil(Result)) and (l_Form.DataSource <> nil) and (l_Form.DataSource.UseCaseController <> nil) then
 begin
  Result := l_Form.DataSource.UseCaseController.TabCaption;
 end;
 if (l3IsNil(Result)) then
 begin
  if Supports(l_Form.Aggregate, IvcmFormSet, l_FormSet) then
  try
   Result := l_FormSet.FormSetTabCaption;
  finally
   l_FormSet := nil;
  end;
 end;
 if (l3IsNil(Result)) then
  Result := GetFormCaptionViaProvider(aForm);
 if (l3IsNil(Result)) then
 begin
  if (aForm is TvcmMainForm) then
  begin
   if TvcmContainerForm(aForm).HasForm(c_fmAny, vcm_ztMainObjectForm, False, @l_CurrEntityForm) then
   try
    Result := TvcmEntityForm(l_CurrEntityForm.VCLWinControl).TabCaption;
   finally
    l_CurrEntityForm := nil;
   end;
   if l3IsNil(Result) then
    Result := TvcmMainForm(aForm).MainCaption
  end
  else
   Result := aForm.TabCaption;
  if (l3IsNil(Result)) then
   Result := aForm.CCaption;
 end;
//#UC END# *53D8D3E600AF_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetContainedFormCaption

function TvcmTabbedContainerFormDispatcher.GetFormCaptionViaProvider(aForm: TvcmEntityForm): IvcmCString;
//#UC START# *53D8D58B02B7_537AEC5E03DD_var*

 function lp_FindCaptionProvider(aControl: TControl): IvcmFormSetCaptionProvider;
 var
  l_WinControl: TWinControl;
  l_Provider: IvcmFormSetCaptionProvider;
  l_Index: Integer;
 begin
  Result := nil;
  if Supports(aControl, IvcmFormSetCaptionProvider, l_Provider) then
  begin
   Result := l_Provider;
   Exit;
  end
  else
  if (aControl is TWinControl) then
  begin
   l_WinControl := TWinControl(aControl);
   for l_Index := 0 to Pred(l_WinControl.ControlCount) do
   begin
    Result := lp_FindCaptionProvider(l_WinControl.Controls[l_Index]);
    if (Result <> nil) then
     Exit;
   end;
  end;
 end;//lp_FindCaptionProvider

var
 l_Provider: IvcmFormSetCaptionProvider;
 l_TabbedContainer: TvcmTabbedContainerForm;
 l_Caption: IvcmCString;
//#UC END# *53D8D58B02B7_537AEC5E03DD_var*
begin
//#UC START# *53D8D58B02B7_537AEC5E03DD_impl*
 Assert(aForm <> nil);
 l_Provider := lp_FindCaptionProvider(aForm);
 l_Caption := nil;
 Result := nil;
 if (l_Provider <> nil) then
 begin
  try
   l_Caption := l_Provider.FormSetTabCaption;
   try
    Result := l_Caption;
   finally
    l_Caption := nil;
   end;//try..finally
  finally
   l_Provider := nil;
  end;//try..finally
 end;
//#UC END# *53D8D58B02B7_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetFormCaptionViaProvider

procedure TvcmTabbedContainerFormDispatcher.NotifyListeners(aNotification: Tl3TabbedContainerNotificationType);
//#UC START# *53DF4B3700BF_537AEC5E03DD_var*

 function lp_DoNotifyListener(anItem: Pointer; anIndex: Integer): Boolean;
 var
  l_Listener: Il3TabbedContainersListener;
 begin
  l_Listener := Il3TabbedContainersListener(anItem^);
  try
   l_Listener.NotifyContainersChanged(aNotification);
  finally
   l_Listener := nil;
  end;//try..finally
  Result := True;
 end;//lp_DoNotifyListener

//#UC END# *53DF4B3700BF_537AEC5E03DD_var*
begin
//#UC START# *53DF4B3700BF_537AEC5E03DD_impl*
 Listeners.IterateAllF(l3L2IA(@lp_DoNotifyListener));
//#UC END# *53DF4B3700BF_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.NotifyListeners

procedure TvcmTabbedContainerFormDispatcher.ContainerChanged(aContainer: TvcmTabbedContainerForm);
//#UC START# *53DF5F1B0068_537AEC5E03DD_var*
//#UC END# *53DF5F1B0068_537AEC5E03DD_var*
begin
//#UC START# *53DF5F1B0068_537AEC5E03DD_impl*
 NotifyListeners(tcnTabChanged);
//#UC END# *53DF5F1B0068_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.ContainerChanged

function TvcmTabbedContainerFormDispatcher.NeedTerminateAppOnClosingForm(aForm: TvcmEntityForm): Boolean;
//#UC START# *53E8959300B4_537AEC5E03DD_var*
//#UC END# *53E8959300B4_537AEC5E03DD_var*
begin
//#UC START# *53E8959300B4_537AEC5E03DD_impl*
 Result := (not f_IsUndockingAll);
//#UC END# *53E8959300B4_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.NeedTerminateAppOnClosingForm

function TvcmTabbedContainerFormDispatcher.GetContainedFormHint(aForm: TvcmEntityForm): IvcmCString;
//#UC START# *53F1E8D700C1_537AEC5E03DD_var*
//#UC END# *53F1E8D700C1_537AEC5E03DD_var*
begin
//#UC START# *53F1E8D700C1_537AEC5E03DD_impl*
 if (aForm.FormSet <> nil) then
  Result := aForm.FormSet.FormsetTabHint
 else
  Result := nil;
//#UC END# *53F1E8D700C1_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetContainedFormHint

function TvcmTabbedContainerFormDispatcher.MakeTabParams(aForm: TvcmEntityForm): Il3TabParams;
//#UC START# *53F42B90024F_537AEC5E03DD_var*
var
 l_Form: TafwCustomForm;
 l_Caption: IvcmCString;
 l_HintText: IvcmCString;
 l_EntityForm: TvcmEntityForm;
 l_Params: Il3TabParams;
 l_ImageIndex: Integer;
 l_MainForm: TvcmEntityForm;
//#UC END# *53F42B90024F_537AEC5E03DD_var*
begin
//#UC START# *53F42B90024F_537AEC5E03DD_impl*
 Result := nil;
 if (not (aForm is TvcmMainForm)) then
 begin
  l_Form := afw.GetMainForm(aForm);
  l_EntityForm := aForm As TvcmEntityForm;
  if (l_EntityForm.ZoneType in [vcm_ztParent, vcm_ztMainObjectForm, vcm_ztMain]) then
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=569231537
  begin
   l_Caption := GetContainedFormCaption(aForm);
   l_HintText := GetContainedFormHint(aForm);
   if (l3IsNil(l_HintText)) then
    l_HintText := aForm.CCaption;
   if (l3IsNil(l_HintText)) then
    l_HintText := l_Caption;
   l_ImageIndex := aForm.UseCaseIconIndex;
   Result := TChromeLikeTabParams.Make(l_Caption, l_HintText, l_ImageIndex,
    [tuo_UpdateTabText, tuo_UpdateHintText]);
  end;
  l_MainForm := l_EntityForm.Container.AsForm.VCLWinControl as TvcmEntityForm;
 end;
//#UC END# *53F42B90024F_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.MakeTabParams

procedure TvcmTabbedContainerFormDispatcher.NotifyContainerClosed(aContainer: TvcmTabbedContainerForm);
//#UC START# *53FADEAF02F3_537AEC5E03DD_var*
//#UC END# *53FADEAF02F3_537AEC5E03DD_var*
begin
//#UC START# *53FADEAF02F3_537AEC5E03DD_impl*
 f_LockedContainers.UnlockContainer(aContainer);
 if (aContainer.WindowState = wsMaximized) then
  SetRectEmpty(f_NewContainerRect)
 else
  f_NewContainerRect := aContainer.BoundsRect;
 // - ���� ����������� ����� ���� ��������������� - ������� ������� ��� ����������
 // �����, ������ ��� ����� � ������������ ������� ������ "������������" �� �����
 // ��������� � ��������� �������� ������, ��� �����:
 // http://mdp.garant.ru/pages/viewpage.action?pageId=565859097
//#UC END# *53FADEAF02F3_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.NotifyContainerClosed

procedure TvcmTabbedContainerFormDispatcher.NotifyMainFormVisibleChanged(aVisible: Boolean);
//#UC START# *5411AC8801BE_537AEC5E03DD_var*
//#UC END# *5411AC8801BE_537AEC5E03DD_var*
begin
//#UC START# *5411AC8801BE_537AEC5E03DD_impl*
 if aVisible then
  NotifyListeners(tcnMainFormBecomeVisible)
 else
  NotifyListeners(tcnMainFormBecomeInvisible);
//#UC END# *5411AC8801BE_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.NotifyMainFormVisibleChanged

procedure TvcmTabbedContainerFormDispatcher.UpdateFormTabIcon(aForm: TvcmEntityForm);
//#UC START# *543E469F00B0_537AEC5E03DD_var*
var
 l_Container: TvcmTabbedContainerForm;
 l_MainForm: TvcmEntityForm;
 l_ImageIndex: Integer;
//#UC END# *543E469F00B0_537AEC5E03DD_var*
begin
//#UC START# *543E469F00B0_537AEC5E03DD_impl*
 if GetFormTabIcon(aForm, l_ImageIndex) then
 begin
  l_Container := GetFormContainer(aForm);
  if (l_Container <> nil) then
   l_MainForm := aForm
  else
  begin
   l_MainForm := aForm.NativeMainForm.AsForm.VCLWinControl as TvcmEntityForm;
   l_Container := GetFormContainer(l_MainForm);
  end;
  l_Container.UpdateTabIcon(l_MainForm, l_ImageIndex);
 end;
//#UC END# *543E469F00B0_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.UpdateFormTabIcon

function TvcmTabbedContainerFormDispatcher.IsAnyModalFormShowing: Boolean;
//#UC START# *54D32B16028F_537AEC5E03DD_var*
var
 l_Index: Integer;
 l_Form: TCustomForm;
//#UC END# *54D32B16028F_537AEC5E03DD_var*
begin
//#UC START# *54D32B16028F_537AEC5E03DD_impl*
 Result := False;
 for l_Index := 0 to Pred(Screen.CustomFormCount) do
 begin
  l_Form := Screen.CustomForms[l_Index];
  if (fsModal in l_Form.FormState) and
     IsWindowVisible(l_Form.Handle) and
     IsWindowEnabled(l_Form.Handle) then
  begin
   Result := True;
   Break;
  end;
 end;
//#UC END# *54D32B16028F_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.IsAnyModalFormShowing

procedure TvcmTabbedContainerFormDispatcher.NotifyContainerCreated(aContainer: TvcmTabbedContainerForm);
//#UC START# *5515149F0298_537AEC5E03DD_var*
//#UC END# *5515149F0298_537AEC5E03DD_var*
begin
//#UC START# *5515149F0298_537AEC5E03DD_impl*
 Inc(f_ContainerCount);
 UpdateContainerList
//#UC END# *5515149F0298_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.NotifyContainerCreated

procedure TvcmTabbedContainerFormDispatcher.UpdateFormTabParams(aForm: TForm;
 const aParams: Il3TabParams);
//#UC START# *5526191F012A_537AEC5E03DD_var*
//#UC END# *5526191F012A_537AEC5E03DD_var*
begin
//#UC START# *5526191F012A_537AEC5E03DD_impl*
 TChromeLikeFormTabParamsList.Instance.SetFormParams(aForm, aParams);
//#UC END# *5526191F012A_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.UpdateFormTabParams

procedure TvcmTabbedContainerFormDispatcher.SaveTabHistory(const aContainer: IvcmContainer;
 const aTabHistoryState: IvcmHistoryState);
//#UC START# *558BCEA90163_537AEC5E03DD_var*
var
 l_TabbedContainer: TvcmTabbedContainerForm;
 l_Container: Il3TabbedContainer;
 l_TabbedForm: TForm;
 l_Tab: Il3FormTab;
//#UC END# *558BCEA90163_537AEC5E03DD_var*
begin
//#UC START# *558BCEA90163_537AEC5E03DD_impl*
 l_TabbedForm := aContainer.AsForm.VCLWinControl as TForm;
 l_TabbedContainer := GetFormContainer(l_TabbedForm);
 l_Tab := GetFormTab(l_TabbedForm);
 l_TabbedContainer.FormsetHistory.SaveTab(l_Tab);
//#UC END# *558BCEA90163_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.SaveTabHistory

function TvcmTabbedContainerFormDispatcher.GetTabHistory(aForm: TForm): IvcmFormSetHistory;
//#UC START# *55B881940117_537AEC5E03DD_var*
var
 l_Container: TvcmTabbedContainerForm;
 l_ParentForm: TCustomForm;
//#UC END# *55B881940117_537AEC5E03DD_var*
begin
//#UC START# *55B881940117_537AEC5E03DD_impl*
 l_Container := GetFormContainer(aForm as TvcmEntityForm);
 if (l_Container = nil) then
 begin
  l_ParentForm := GetParentForm(aForm);
  if (l_ParentForm <> nil) and (l_ParentForm is TvcmTabbedContainerForm) then
   l_Container := TvcmTabbedContainerForm(l_ParentForm);
 end;
 if (l_Container <> nil) then
  Result := l_Container.FormSetHistory
 else
  Result := nil;
//#UC END# *55B881940117_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetTabHistory

function TvcmTabbedContainerFormDispatcher.GetFormTabIcon(aForm: TvcmEntityForm;
 out theIconIndex: Integer): Boolean;
//#UC START# *5602A5390084_537AEC5E03DD_var*

 function lp_GetIconProvider: IvcmFormSetIconProvider;
 var
  l_Provider: IvcmFormSetIconProvider;
  l_MainForm: TvcmEntityForm;
 begin
  Result := nil;
  if (GetFormContainer(aForm) <> nil) then
   l_MainForm := aForm
  else
   l_MainForm := aForm.NativeMainForm.AsForm.VCLWinControl as TvcmEntityForm;

  if GetFormContainer(l_MainForm) <> nil then
   if Supports(aForm, IvcmFormSetIconProvider, l_Provider) or
      Supports(l_MainForm, IvcmFormSetIconProvider, l_Provider) then
    if l_Provider.CanDefineFormSetIcon then
     Result := l_Provider;
 end;

var
 l_IconProvider: IvcmFormSetIconProvider;
//#UC END# *5602A5390084_537AEC5E03DD_var*
begin
//#UC START# *5602A5390084_537AEC5E03DD_impl*
 l_IconProvider := lp_GetIconProvider;
 Result := Assigned(l_IconProvider);
 if Result then
 try
  theIconIndex := l_IconProvider.FormSetImageIndex;
  Result := True;
 finally
  l_IconProvider := nil;
 end;
//#UC END# *5602A5390084_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetFormTabIcon

class function TvcmTabbedContainerFormDispatcher.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TvcmTabbedContainerFormDispatcher <> nil;
end;//TvcmTabbedContainerFormDispatcher.Exists

function TvcmTabbedContainerFormDispatcher.GetTabIcon(const aTab: Il3FormTab): Integer;
//#UC START# *02157F96E465_537AEC5E03DD_var*
//#UC END# *02157F96E465_537AEC5E03DD_var*
begin
//#UC START# *02157F96E465_537AEC5E03DD_impl*
 if not GetFormTabIcon(aTab.TabbedForm as TvcmEntityForm, Result) then
  Result := -1;
//#UC END# *02157F96E465_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetTabIcon

function TvcmTabbedContainerFormDispatcher.IsInBF(aContainedForm: TForm): Boolean;
//#UC START# *06D14140190A_537AEC5E03DD_var*
var
 l_Container: IvcmContainer;
 l_History: IvcmFormSetHistory;
 l_TabsHistory: IvcmFormSetHistory;
 l_InSimpleBF: Boolean;
 l_InTabsHistoryBF: Boolean;
//#UC END# *06D14140190A_537AEC5E03DD_var*
begin
//#UC START# *06D14140190A_537AEC5E03DD_impl*
 l_History := GetTabHistory(aContainedForm);
 l_InSimpleBF := False;
 if (l_History <> nil) then
  l_InSimpleBF := l_History.InBF;
 l_InTabsHistoryBf := False;
 if (not l_InSimpleBF) then
 begin
  l_TabsHistory := GetTabHistory(aContainedForm);
  if (l_TabsHistory <> nil) then
  begin
   l_Container := TvcmEntityForm(aContainedForm).As_IvcmEntityForm.AsContainer;
   l_InTabsHistoryBf := (l_Container <> nil) and l_TabsHistory.IsContainerInOp(l_Container);
  end; 
 end;
 Result := l_InSimpleBF or l_InTabsHistoryBf;
//#UC END# *06D14140190A_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.IsInBF

function TvcmTabbedContainerFormDispatcher.GetTabCaption(const aTab: Il3FormTab): AnsiString;
//#UC START# *086A3DF2665B_537AEC5E03DD_var*
//#UC END# *086A3DF2665B_537AEC5E03DD_var*
begin
//#UC START# *086A3DF2665B_537AEC5E03DD_impl*
 Result := aTab.CurrentParams.Text;
//#UC END# *086A3DF2665B_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetTabCaption

procedure TvcmTabbedContainerFormDispatcher.CloseTab(const aTab: Il3FormTab);
//#UC START# *0E111B36F193_537AEC5E03DD_var*
var
 l_ContainedForm: IvcmContainedForm;
 l_Container: IvcmContainer;
//#UC END# *0E111B36F193_537AEC5E03DD_var*
begin
//#UC START# *0E111B36F193_537AEC5E03DD_impl*
 if Supports(aTab.TabbedForm, IvcmContainedForm, l_ContainedForm) then
 begin
  TvcmTabbedContainerForm(aTab.TabbedContainer.AsForm).FormSetHistory.SaveTab(aTab);
  if Supports(aTab.TabbedForm, IvcmContainer, l_Container) then
   TvcmFormSetContainerRegistry.Instance.UnregisterContainer(l_Container);
  l_ContainedForm.CloseContainedForm;
 end
 else
  Assert(False);
//#UC END# *0E111B36F193_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.CloseTab

procedure TvcmTabbedContainerFormDispatcher.Subscribe(const aListener: Il3TabbedContainersListener);
//#UC START# *1561A6522B5C_537AEC5E03DD_var*
//#UC END# *1561A6522B5C_537AEC5E03DD_var*
begin
//#UC START# *1561A6522B5C_537AEC5E03DD_impl*
 Listeners.Add(Integer(aListener));
//#UC END# *1561A6522B5C_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.Subscribe

procedure TvcmTabbedContainerFormDispatcher.Lock;
//#UC START# *185C64EF3184_537AEC5E03DD_var*
//#UC END# *185C64EF3184_537AEC5E03DD_var*
begin
//#UC START# *185C64EF3184_537AEC5E03DD_impl*
 Inc(f_LockCount);
//#UC END# *185C64EF3184_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.Lock

procedure TvcmTabbedContainerFormDispatcher.UnlockContainer(const aContainer: Il3TabbedContainer);
//#UC START# *1BFA5AA0644C_537AEC5E03DD_var*
//#UC END# *1BFA5AA0644C_537AEC5E03DD_var*
begin
//#UC START# *1BFA5AA0644C_537AEC5E03DD_impl*
 f_LockedContainers.UnlockContainer(aContainer.AsForm as TvcmTabbedContainerForm);
//#UC END# *1BFA5AA0644C_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.UnlockContainer

function TvcmTabbedContainerFormDispatcher.GetActiveTabbedContainer: Il3TabbedContainer;
//#UC START# *2774A286694A_537AEC5E03DD_var*
//#UC END# *2774A286694A_537AEC5E03DD_var*
begin
//#UC START# *2774A286694A_537AEC5E03DD_impl*
 Result := ActiveContainer as Il3TabbedContainer;
//#UC END# *2774A286694A_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetActiveTabbedContainer

procedure TvcmTabbedContainerFormDispatcher.StopFlashing;
//#UC START# *2A43AA8AA799_537AEC5E03DD_var*
//#UC END# *2A43AA8AA799_537AEC5E03DD_var*
begin
//#UC START# *2A43AA8AA799_537AEC5E03DD_impl*
 if Assigned(ActiveContainer) then
  (ActiveContainer as IvcmFlashingWindow).StopFlashing;
//#UC END# *2A43AA8AA799_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.StopFlashing

function TvcmTabbedContainerFormDispatcher.CanReopenClosedTab(const aContainer: Il3TabbedContainer): Boolean;
//#UC START# *2EC8C1E48517_537AEC5E03DD_var*
//#UC END# *2EC8C1E48517_537AEC5E03DD_var*
begin
//#UC START# *2EC8C1E48517_537AEC5E03DD_impl*
 Result := TvcmTabbedContainerForm(aContainer.AsForm).FormSetHistory.CanBack;
//#UC END# *2EC8C1E48517_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.CanReopenClosedTab

procedure TvcmTabbedContainerFormDispatcher.CascadeWindows;
//#UC START# *3F5E73D5D2B0_537AEC5E03DD_var*
//#UC END# *3F5E73D5D2B0_537AEC5E03DD_var*
begin
//#UC START# *3F5E73D5D2B0_537AEC5E03DD_impl*
 vcmDispatcher.CascadeWindows(MakeContainersList);
//#UC END# *3F5E73D5D2B0_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.CascadeWindows

procedure TvcmTabbedContainerFormDispatcher.ReopenClosedTab(const aContainer: Il3TabbedContainer);
//#UC START# *424D166E6D0C_537AEC5E03DD_var*
var
 l_TabbedContainer: TvcmTabbedContainerForm;
 l_ContainerMaker: IvcmContainerMaker;
 l_TabMaker: IvcmContainerMaker;
 l_ContainerToOpen: IvcmContainer;
 l_NewContainer: IvcmContainer;
//#UC END# *424D166E6D0C_537AEC5E03DD_var*
begin
//#UC START# *424D166E6D0C_537AEC5E03DD_impl*
 if Supports(ActiveVCMContainer.AsForm.VCLWinControl, IvcmContainerMaker, l_ContainerMaker) then
 begin
  f_ReopeningTab := True;
  try
   l_TabbedContainer := aContainer.AsForm as TvcmTabbedContainerForm;
   l_TabMaker := TvcmContainerWithTabMaker.Make(l_ContainerMaker);
   try
    l_NewContainer := l_TabMaker.MakeContainer;
    if (l_NewContainer <> nil) then
    try
     l_TabbedContainer.FormSetHistory.Back(l_NewContainer);
    finally
     l_NewContainer := nil;
    end;
   finally
    l_TabMaker := nil;
   end;
  finally
   f_ReopeningTab := False;
  end;
 end
 else
  Assert(False);
//#UC END# *424D166E6D0C_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.ReopenClosedTab

procedure TvcmTabbedContainerFormDispatcher.LockContainer(const aContainer: Il3TabbedContainer);
//#UC START# *44A2D9FC0500_537AEC5E03DD_var*
//#UC END# *44A2D9FC0500_537AEC5E03DD_var*
begin
//#UC START# *44A2D9FC0500_537AEC5E03DD_impl*
 f_LockedContainers.LockContainer(aContainer.AsForm as TvcmTabbedContainerForm);
//#UC END# *44A2D9FC0500_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.LockContainer

procedure TvcmTabbedContainerFormDispatcher.Unsubscribe(const aListener: Il3TabbedContainersListener);
//#UC START# *4526B341C1C6_537AEC5E03DD_var*
//#UC END# *4526B341C1C6_537AEC5E03DD_var*
begin
//#UC START# *4526B341C1C6_537AEC5E03DD_impl*
 Listeners.Remove(Integer(aListener));
//#UC END# *4526B341C1C6_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.Unsubscribe

function TvcmTabbedContainerFormDispatcher.GetCurrentMainForm: TWinControl;
//#UC START# *5538B77B0192_537AEC5E03DD_var*
//#UC END# *5538B77B0192_537AEC5E03DD_var*
begin
//#UC START# *5538B77B0192_537AEC5E03DD_impl*
 Result := GetCurrentActiveContainer;
//#UC END# *5538B77B0192_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetCurrentMainForm

function TvcmTabbedContainerFormDispatcher.IsFormInContainer(aForm: TForm;
 aContainer: TForm): Boolean;
//#UC START# *5E78F22AF1FF_537AEC5E03DD_var*
var
 l_FormContainer: TvcmTabbedContainerForm;
//#UC END# *5E78F22AF1FF_537AEC5E03DD_var*
begin
//#UC START# *5E78F22AF1FF_537AEC5E03DD_impl*
 Assert(aForm <> nil);
 Assert(aContainer <> nil);
 if NeedUseTabs then
 begin
  l_FormContainer := GetFormContainer(aForm);
  Result := (l_FormContainer <> nil) AND
            (aContainer is TvcmTabbedContainerForm) AND
            (TvcmTabbedContainerForm(aContainer) = l_FormContainer);
 end
 else
  Result := False;
//#UC END# *5E78F22AF1FF_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.IsFormInContainer

procedure TvcmTabbedContainerFormDispatcher.TileWindowsHorizontal;
//#UC START# *651C515DADEE_537AEC5E03DD_var*
//#UC END# *651C515DADEE_537AEC5E03DD_var*
begin
//#UC START# *651C515DADEE_537AEC5E03DD_impl*
 vcmDispatcher.TileWindowsHorizontal(MakeContainersList);
//#UC END# *651C515DADEE_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.TileWindowsHorizontal

function TvcmTabbedContainerFormDispatcher.IsContainerLocked(const aContainer: Il3TabbedContainer): Boolean;
//#UC START# *89B204B9A81A_537AEC5E03DD_var*
//#UC END# *89B204B9A81A_537AEC5E03DD_var*
begin
//#UC START# *89B204B9A81A_537AEC5E03DD_impl*
 Result := f_LockedContainers.IsContainerLocked(aContainer.AsForm as TvcmTabbedContainerForm);
//#UC END# *89B204B9A81A_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.IsContainerLocked

procedure TvcmTabbedContainerFormDispatcher.ActivateForm(aForm: TForm);
//#UC START# *94E9E4364244_537AEC5E03DD_var*
var
 l_TabbedContainer: TvcmTabbedContainerForm;
 l_VCMContainer: IvcmContainer;
 l_Form: TForm;
//#UC END# *94E9E4364244_537AEC5E03DD_var*
begin
//#UC START# *94E9E4364244_537AEC5E03DD_impl*
 l_VCMContainer := (aForm as TvcmEntityForm).NativeMainForm;
 Assert(l_VCMContainer <> nil);
 l_Form := TForm(l_VCMContainer.AsForm.VCLWinControl);
 l_TabbedContainer := GetFormContainer(l_Form);
 l_TabbedContainer.SetSelected(l_Form);
//#UC END# *94E9E4364244_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.ActivateForm

function TvcmTabbedContainerFormDispatcher.NeedUseTabs: Boolean;
//#UC START# *9584664239A7_537AEC5E03DD_var*
//#UC END# *9584664239A7_537AEC5E03DD_var*
begin
//#UC START# *9584664239A7_537AEC5E03DD_impl*
 Result  := (afw.Application.TabInterfaceType = afw_titTabs);
//#UC END# *9584664239A7_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.NeedUseTabs

procedure TvcmTabbedContainerFormDispatcher.TileWindowsVertical;
//#UC START# *9D76EEC368A2_537AEC5E03DD_var*
//#UC END# *9D76EEC368A2_537AEC5E03DD_var*
begin
//#UC START# *9D76EEC368A2_537AEC5E03DD_impl*
 vcmDispatcher.TileWindowsVertical(MakeContainersList);
//#UC END# *9D76EEC368A2_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.TileWindowsVertical

procedure TvcmTabbedContainerFormDispatcher.ContainedFormBecomeActive(aForm: TForm);
//#UC START# *AEF0183D2054_537AEC5E03DD_var*
var
 l_Container: TvcmTabbedContainerForm;
//#UC END# *AEF0183D2054_537AEC5E03DD_var*
begin
//#UC START# *AEF0183D2054_537AEC5E03DD_impl*
if NeedUseTabs then
 begin
  Assert(aForm <> nil);
  l_Container := GetFormContainer(aForm);
  if (l_Container <> nil) then
  begin
   f_ActiveContainer := l_Container;
   if (THackApplication(Application).FMainForm <> l_Container) then
    THackApplication(Application).FMainForm := l_Container;
   f_ActiveContainer.UpdateMenu(aForm); 
  end
  else
   THackApplication(Application).FMainForm := aForm;
 end;
//#UC END# *AEF0183D2054_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.ContainedFormBecomeActive

function TvcmTabbedContainerFormDispatcher.IsTabEmpty(const aTab: Il3FormTab): Boolean;
//#UC START# *BFD6868132D2_537AEC5E03DD_var*
var
 l_ContainedForm: IvcmContainedForm;
//#UC END# *BFD6868132D2_537AEC5E03DD_var*
begin
//#UC START# *BFD6868132D2_537AEC5E03DD_impl*
 if Supports(aTab.TabbedForm, IvcmContainedForm, l_ContainedForm) then
  Result := l_ContainedForm.IsEmpty
 else
  Assert(False);
//#UC END# *BFD6868132D2_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.IsTabEmpty

function TvcmTabbedContainerFormDispatcher.CloneTab(const aTab: Il3FormTab): Il3FormTab;
//#UC START# *CA81A004E69C_537AEC5E03DD_var*
var
 l_TabbedContainer: TvcmTabbedContainerForm;
//#UC END# *CA81A004E69C_537AEC5E03DD_var*
begin
//#UC START# *CA81A004E69C_537AEC5E03DD_impl*
 Assert(aTab <> nil);
 f_CloningTab := True;
 try
  l_TabbedContainer := TvcmTabbedContainerForm(aTab.TabbedContainer.AsForm);
  Assert(l_TabbedContainer <> nil);
  l_TabbedContainer.FormSetHistory.CloneTab(aTab);
 finally
  f_CloningTab := False;
 end;
//#UC END# *CA81A004E69C_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.CloneTab

function TvcmTabbedContainerFormDispatcher.GetFormTab(aForm: TForm): Il3FormTab;
//#UC START# *E6CFFF63C7BA_537AEC5E03DD_var*

 function lp_IsTabbedForm(aChildForm: TForm): Boolean;
 var
  l_Index: Integer;
 begin
  Result := False;
  for l_Index := 0 to Pred(f_FormToContainerMap.Count) do
  begin
   Result := (f_FormToContainerMap[l_Index].rForm = aChildForm);
   if Result then
    Break;
  end;
 end;

 function lp_GetParentForm(Control: TControl): TForm;
 begin
   while (Control.Parent <> nil) and
         (not lp_IsTabbedForm(TForm(Control))) do
    Control := Control.Parent;
   if Control is TForm then
     Result := TForm(Control) else
     Result := nil;
 end;

var
 l_Form: TForm;
 l_TabbedContainer: Il3TabbedContainer;
//#UC END# *E6CFFF63C7BA_537AEC5E03DD_var*
begin
//#UC START# *E6CFFF63C7BA_537AEC5E03DD_impl*
 Assert(aForm <> nil);
 l_Form := lp_GetParentForm(aForm);
 if (l_Form <> nil) then
 begin
  l_TabbedContainer := GetParentForm(l_Form) as TvcmTabbedContainerForm;
  Result := l_TabbedContainer.GetFormTab(l_Form);
 end
 else
  Result := nil;
//#UC END# *E6CFFF63C7BA_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.GetFormTab

procedure TvcmTabbedContainerFormDispatcher.Unlock;
//#UC START# *E781A200DBB9_537AEC5E03DD_var*
//#UC END# *E781A200DBB9_537AEC5E03DD_var*
begin
//#UC START# *E781A200DBB9_537AEC5E03DD_impl*
 Dec(f_LockCount);
//#UC END# *E781A200DBB9_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.Unlock

function TvcmTabbedContainerFormDispatcher.CanCloneTab(const aTab: Il3FormTab): Boolean;
//#UC START# *EE61E6DE4383_537AEC5E03DD_var*
//#UC END# *EE61E6DE4383_537AEC5E03DD_var*
begin
//#UC START# *EE61E6DE4383_537AEC5E03DD_impl*
 Result := True;
//#UC END# *EE61E6DE4383_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.CanCloneTab

procedure TvcmTabbedContainerFormDispatcher.StartFlashing;
//#UC START# *F09F327B084A_537AEC5E03DD_var*
//#UC END# *F09F327B084A_537AEC5E03DD_var*
begin
//#UC START# *F09F327B084A_537AEC5E03DD_impl*
 if Assigned(ActiveContainer) then
  (ActiveContainer as IvcmFlashingWindow).StartFlashing;
//#UC END# *F09F327B084A_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.StartFlashing

procedure TvcmTabbedContainerFormDispatcher.SaveTabToHistory(const aTab: Il3FormTab);
//#UC START# *F2A394FBFE56_537AEC5E03DD_var*
var
 l_Container: TvcmTabbedContainerForm;
//#UC END# *F2A394FBFE56_537AEC5E03DD_var*
begin
//#UC START# *F2A394FBFE56_537AEC5E03DD_impl*
 l_Container := GetFormContainer(aTab.TabbedForm);
 l_Container.FormSetHistory.SaveTab(aTab);
//#UC END# *F2A394FBFE56_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.SaveTabToHistory

procedure TvcmTabbedContainerFormDispatcher.CloseAll;
//#UC START# *F550802110EC_537AEC5E03DD_var*

 function lp_DoSaveContainer(anItem: Pointer; anIndex: Integer): Boolean;
 var
  l_Container: TvcmTabbedContainerForm;
 begin
  l_Container := TvcmTabbedContainerForm(anItem^);
  if (l_Container <> nil) then
   l_Container.DoSaveInSettings
  else
   Assert(False);
  Result := True;
 end;//lp_DoSaveContainer

 procedure lp_CloseContainers;
 var
  l_Container: TvcmTabbedContainerForm;
  l_Index: Integer;
 begin
  f_IsUndockingAll := True;
  for l_Index := Pred(ContainerList.Count) downto 0 do
  begin
   l_Container := TvcmTabbedContainerForm(ContainerList[l_Index]);
   if (l_Container <> nil) then
    l_Container.SafeClose;
  end;
  Application.ProcessMessages;
 end;

var
 l_Index: Integer;
//#UC END# *F550802110EC_537AEC5E03DD_var*
begin
//#UC START# *F550802110EC_537AEC5E03DD_impl*
 if (not NeedUseTabs) then
  vcmDispatcher.CloseAllWindows
 else
  try
   NotifyListeners(tcnApplicationTerminating);  
   ContainerList.IterateAllF(l3L2IA(@lp_DoSaveContainer));
   lp_CloseContainers;
  finally
   Application.Terminate;
  end;//try..finally
//#UC END# *F550802110EC_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.CloseAll

class function TvcmTabbedContainerFormDispatcher.Instance: TvcmTabbedContainerFormDispatcher;
 {* ����� ��������� ���������� ���������� TvcmTabbedContainerFormDispatcher }
begin
 if (g_TvcmTabbedContainerFormDispatcher = nil) then
 begin
  l3System.AddExitProc(TvcmTabbedContainerFormDispatcherFree);
  g_TvcmTabbedContainerFormDispatcher := Create;
 end;
 Result := g_TvcmTabbedContainerFormDispatcher;
end;//TvcmTabbedContainerFormDispatcher.Instance

procedure TvcmTabbedContainerFormDispatcher.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_537AEC5E03DD_var*
//#UC END# *479731C50290_537AEC5E03DD_var*
begin
//#UC START# *479731C50290_537AEC5E03DD_impl*
 FreeAndNil(f_LockedContainers);
 FreeAndNil(f_FormToContainerMap);
 FreeAndNil(f_ContainerList);
 FreeAndNil(f_Listeners);
 f_MainFormProvider := nil;
 inherited;
//#UC END# *479731C50290_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.Cleanup

procedure TvcmTabbedContainerFormDispatcher.ClearFields;
begin
 Finalize(f_TabSetParams);
 inherited;
end;//TvcmTabbedContainerFormDispatcher.ClearFields

function TvcmTabbedContainerFormDispatcher.NeedProcessKeyData(aKey: Byte;
 aShift: TShiftState): Boolean;
//#UC START# *53B24E7A0280_537AEC5E03DD_var*

 function lp_IsActivateTabByIndexKey: Boolean;
 begin
  Result := ((aKey in cTabNumberKeys) or (aKey in cTabNumpadKeys)) AND
   (ssCtrl in aShift);
 end;//lp_IsActivateTabByIndexKey

 function lp_IsActivateTabByOrderKey: Boolean;
 begin
  Result := ((aKey = VK_TAB) and (aShift = [ssCtrl]));
 end;//lp_IsActivateTabByOrderKey

 function lp_IsCloseCurrentTabKey: Boolean;
 begin
  Result := (aKey in [Ord('W'), VK_F4]) and (aShift = [ssCtrl]);
 end;//lp_IsCloseCurrentTabKey

 function lp_IsReopenClosedTabKey: Boolean;
 begin
  Result := (aKey = Ord('T')) and (aShift = [ssCtrl, ssShift]) and
   CanReopenClosedTab(GetCurrentActiveContainer);
 end;

 function lp_IsOpenNewTabKey: Boolean;
 begin
  Result := (aKey = Ord('T')) and (aShift = [ssCtrl]);
 end;//lp_IsOpenNewTabKey

//#UC END# *53B24E7A0280_537AEC5E03DD_var*
begin
//#UC START# *53B24E7A0280_537AEC5E03DD_impl*
 Result := NeedUseTabs AND (FormToContainerMap.Count > 0) AND
  (GetCurrentActiveContainer <> nil) AND
  (lp_IsActivateTabByIndexKey or lp_IsActivateTabByOrderKey or
   lp_IsOpenNewTabKey or lp_IsReopenClosedTabKey or
   (lp_IsCloseCurrentTabKey and (GetTickCount - f_LastTabCloseKeyPressTime > 300)));
//#UC END# *53B24E7A0280_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.NeedProcessKeyData

procedure TvcmTabbedContainerFormDispatcher.DoProcessKeyData(aKey: Byte;
 aShift: TShiftState);
//#UC START# *53B24F1D034F_537AEC5E03DD_var*
const
 cNumberKeyToTabIndexMap : array[Ord('0')..Ord('9')] of Integer =
  (9, 0, 1, 2, 3, 4, 5, 6, 7, 8);
 cNumpadKeyToTabIndexMap : array[VK_NUMPAD0..VK_NUMPAD9] of Integer =
  (9, 0, 1, 2, 3, 4, 5, 6, 7, 8);
var
 l_TabIndex: Integer;
 l_CurrentActiveContainer: TvcmTabbedContainerForm;
//#UC END# *53B24F1D034F_537AEC5E03DD_var*
begin
//#UC START# *53B24F1D034F_537AEC5E03DD_impl*
 if (not IsAnyModalFormShowing) then
 begin
  l_CurrentActiveContainer := GetCurrentActiveContainer;
  Assert(l_CurrentActiveContainer <> nil);
  l_TabIndex := 0;
  Assert(l_CurrentActiveContainer <> nil);
  if (aKey = VK_TAB) then
  begin
   if (ssShift in aShift) then
    l_CurrentActiveContainer.ActivatePrevTab
   else
    l_CurrentActiveContainer.ActivateNextTab;
  end
  else
  begin
   if (aKey in cTabNumberKeys) then
    ActivateTabByIndex(l_CurrentActiveContainer, cNumberKeyToTabIndexMap[aKey])
   else
   if (aKey in cTabNumpadKeys) then
    ActivateTabByIndex(l_CurrentActiveContainer, cNumpadKeyToTabIndexMap[aKey])
   else
   if (aShift = [ssCtrl]) and (aKey in [Ord('W'), VK_F4]) then
   begin
    f_LastTabCloseKeyPressTime := GetTickCount;
    l_CurrentActiveContainer.CloseSelectedForm;
   end
   else
   if (aShift = [ssCtrl]) and (aKey = Ord('T')) then
    l_CurrentActiveContainer.AddNewTab
   else
   if (aKey = Ord('T')) and (aShift = [ssCtrl, ssShift]) and
    CanReopenClosedTab(l_CurrentActiveContainer) then
    ReopenClosedTab(l_CurrentActiveContainer)
   else
    Assert(False);
  end;
 end;//not IsAnyModalFormShowing
//#UC END# *53B24F1D034F_537AEC5E03DD_impl*
end;//TvcmTabbedContainerFormDispatcher.DoProcessKeyData

class function TvcmChromeLikeMainFormProvider.Make: IvcmMainFormProvider;
var
 l_Inst : TvcmChromeLikeMainFormProvider;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TvcmChromeLikeMainFormProvider.Make

function TvcmChromeLikeMainFormProvider.pm_GetCurrentMainForm: IvcmEntityForm;
//#UC START# *54619A0C00D4_54619B6300EFget_var*
var
 l_ActiveContainer: TvcmTabbedContainerForm;
 l_MainForm: IafwMainForm;
//#UC END# *54619A0C00D4_54619B6300EFget_var*
begin
//#UC START# *54619A0C00D4_54619B6300EFget_impl*
 if TvcmTabbedContainerFormDispatcher.Instance.NeedUseTabs then
 begin
  l_ActiveContainer := TvcmTabbedContainerFormDispatcher.Instance.ActiveContainer;
  if (l_ActiveContainer <> nil) then
   Result := l_ActiveContainer.GetInnerEntityForm
  else
   Result := nil;
 end
 else
 begin
  l_MainForm := afw.Application.CurrentMainForm;
  if (l_MainForm <> nil) then
  try
   Supports(l_MainForm, IvcmEntityForm, Result);
  finally
   l_MainForm := nil;
  end;//try..finally end;
 end;
//#UC END# *54619A0C00D4_54619B6300EFget_impl*
end;//TvcmChromeLikeMainFormProvider.pm_GetCurrentMainForm

function TvcmChromeLikeMainFormProvider.pm_GetCurrentVCMContainer: IvcmContainer;
//#UC START# *54619A290279_54619B6300EFget_var*
var
 l_CurrentEntityForm: IvcmEntityForm;
//#UC END# *54619A290279_54619B6300EFget_var*
begin
//#UC START# *54619A290279_54619B6300EFget_impl*
 l_CurrentEntityForm := pm_GetCurrentMainForm;
 if (l_CurrentEntityForm <> nil) then
  Result := l_CurrentEntityForm.AsContainer
 else
  Result := nil;
//#UC END# *54619A290279_54619B6300EFget_impl*
end;//TvcmChromeLikeMainFormProvider.pm_GetCurrentVCMContainer

constructor TvcmContainerWithTabMaker.Create(const aRealContainerMaker: IvcmContainerMaker);
//#UC START# *5583D5F301E7_5583D5B8012C_var*
//#UC END# *5583D5F301E7_5583D5B8012C_var*
begin
//#UC START# *5583D5F301E7_5583D5B8012C_impl*
 Assert(aRealContainerMaker <> nil);
 inherited Create;
 f_ContainerMaker := aRealContainerMaker;
//#UC END# *5583D5F301E7_5583D5B8012C_impl*
end;//TvcmContainerWithTabMaker.Create

class function TvcmContainerWithTabMaker.Make(const aRealContainerMaker: IvcmContainerMaker): IvcmContainerMaker;
var
 l_Inst : TvcmContainerWithTabMaker;
begin
 l_Inst := Create(aRealContainerMaker);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TvcmContainerWithTabMaker.Make

function TvcmContainerWithTabMaker.MakeContainer: IvcmContainer;
//#UC START# *53ABACBB02D0_5583D5B8012C_var*
//#UC END# *53ABACBB02D0_5583D5B8012C_var*
begin
//#UC START# *53ABACBB02D0_5583D5B8012C_impl*
 with TvcmTabbedContainerFormDispatcher.Instance do
  Result := MakeAndPlaceVCMContainer(f_ContainerMaker, ActiveVCMContainer, vcm_okInNewTab, True, False);
//#UC END# *53ABACBB02D0_5583D5B8012C_impl*
end;//TvcmContainerWithTabMaker.MakeContainer

initialization
 TvcmTabbedContainersService.Instance.Alien := TvcmTabbedContainerFormDispatcher.Instance;
 {* ����������� TvcmTabbedContainerFormDispatcher }
{$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)

end.
