unit sdsSituation;
 {* ������ ������ ������ ������ ��������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Search\sdsSituation.pas"
// ���������: "UseCaseControllerImp"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin)}
uses
 l3IntfUses
 , QueryCardInterfaces
 , SearchInterfaces
 {$If NOT Defined(NoVCM)}
 , vcmControllers
 {$IfEnd} // NOT Defined(NoVCM)
 , SimpleListInterfaces
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3ProtoObjectWithCOMQI
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3Interfaces
 , l3NotifyPtrList
 , l3TreeInterfaces
;

type
 _InitDataType_ = IdeSearch;
 _SetType_ = IsdsSituation;
 {$Include w:\common\components\gui\Garant\VCM\implementation\vcmFormSetDataSourceWithoutData.imp.pas}
 _CurrentChangedListener_Parent_ = _vcmFormSetDataSourceWithoutData_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\Search\CurrentChangedListener.imp.pas}
 TsdsSituation = class(_CurrentChangedListener_, IsdsSituation, IucpFilters, IbsCurrentChangedListener, IbsSelectedAttributes)
  {* ������ ������ ������ ������ ��������� }
  private
   f_dsFilters: IvcmViewAreaControllerRef;
    {* ���� ��� ������� ������ dsFilters }
   f_dsTreeAttributeFirstLevel: IvcmViewAreaControllerRef;
    {* ���� ��� ������� ������ dsTreeAttributeFirstLevel }
   f_dsSaveLoad: IvcmViewAreaControllerRef;
    {* ���� ��� ������� ������ dsSaveLoad }
   f_dsSelectedAttributes: IvcmViewAreaControllerRef;
    {* ���� ��� ������� ������ dsSelectedAttributes }
   f_dsTreeAttributeSelect: IvcmViewAreaControllerRef;
    {* ���� ��� ������� ������ dsTreeAttributeSelect }
   f_dsAttributeSelect: IvcmViewAreaControllerRef;
    {* ���� ��� ������� ������ dsAttributeSelect }
  protected
   function As_IucpFilters: IucpFilters;
    {* ����� ���������� ������ ���������� � IucpFilters }
   function As_IbsCurrentChangedListener: IbsCurrentChangedListener;
    {* ����� ���������� ������ ���������� � IbsCurrentChangedListener }
   function As_IbsSelectedAttributes: IbsSelectedAttributes;
    {* ����� ���������� ������ ���������� � IbsSelectedAttributes }
   procedure Open;
    {* ������� ����� ������� }
   function pm_GetSearch: IdeSearch;
   function pm_GetdsFilters: IdsFilters;
   function pm_GetdsTreeAttributeFirstLevel: IdsTreeAttributeFirstLevel;
   function pm_GetdsSaveLoad: IdsSaveLoad;
   function pm_GetdsSelectedAttributes: IdsSelectedAttributes;
   function pm_GetdsTreeAttributeSelect: IdsTreeAttributeSelect;
   function pm_GetdsAttributeSelect: IdsAttributeSelect;
   {$If NOT Defined(NoVCM)}
   procedure ClearAreas; override;
    {* ������� ������ �� ������� ����� }
   {$IfEnd} // NOT Defined(NoVCM)
  public
   procedure UpdateSelectedAttributes;
    {* �������� ������ � ����� ��������� ��������� }
 end;//TsdsSituation
{$IfEnd} // NOT Defined(Admin)

implementation

{$If NOT Defined(Admin)}
uses
 l3ImplUses
 , dsTreeAttributeSelect
 , dsSelectedAttributes
 , deSelectedAttributes
 , dsSaveLoad
 , dsTreeAttributeFirstLevel
 , dsFilters
 , afwFacade
 , nsConst
 , dsAttributeSelect
 , deSearch
 {$If NOT Defined(NoVCM)}
 , vcmLocalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3Base
 , SysUtils
;

{$If not Declared(_SetDataType_)}type _SetDataType_ = IvcmData;{$IfEnd}

type _Instance_R_ = TsdsSituation;

{$Include w:\common\components\gui\Garant\VCM\implementation\vcmFormSetDataSourceWithoutData.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\Search\CurrentChangedListener.imp.pas}

function TsdsSituation.As_IucpFilters: IucpFilters;
 {* ����� ���������� ������ ���������� � IucpFilters }
begin
 Result := Self;
end;//TsdsSituation.As_IucpFilters

function TsdsSituation.As_IbsCurrentChangedListener: IbsCurrentChangedListener;
 {* ����� ���������� ������ ���������� � IbsCurrentChangedListener }
begin
 Result := Self;
end;//TsdsSituation.As_IbsCurrentChangedListener

function TsdsSituation.As_IbsSelectedAttributes: IbsSelectedAttributes;
 {* ����� ���������� ������ ���������� � IbsSelectedAttributes }
begin
 Result := Self;
end;//TsdsSituation.As_IbsSelectedAttributes

procedure TsdsSituation.Open;
 {* ������� ����� ������� }
//#UC START# *47FB2086026D_493027CE015A_var*
//#UC END# *47FB2086026D_493027CE015A_var*
begin
//#UC START# *47FB2086026D_493027CE015A_impl*
 if f_dsFilters.IsEmpty then
 begin
  f_dsFilters.NeedMake := vcm_nmForce;
  Refresh;
 end;//if f_dsFilters.IsEmpty then
//#UC END# *47FB2086026D_493027CE015A_impl*
end;//TsdsSituation.Open

function TsdsSituation.pm_GetSearch: IdeSearch;
//#UC START# *492EF70F0275_493027CE015Aget_var*
//#UC END# *492EF70F0275_493027CE015Aget_var*
begin
//#UC START# *492EF70F0275_493027CE015Aget_impl*
 Result := InitialUseCaseData;
//#UC END# *492EF70F0275_493027CE015Aget_impl*
end;//TsdsSituation.pm_GetSearch

function TsdsSituation.pm_GetdsFilters: IdsFilters;
//#UC START# *492EF8440252_493027CE015Aget_var*
//#UC END# *492EF8440252_493027CE015Aget_var*
begin
//#UC START# *492EF8440252_493027CE015Aget_impl*
 !!! Needs to be implemented !!!
//#UC END# *492EF8440252_493027CE015Aget_impl*
end;//TsdsSituation.pm_GetdsFilters

function TsdsSituation.pm_GetdsTreeAttributeFirstLevel: IdsTreeAttributeFirstLevel;
//#UC START# *492EF877026C_493027CE015Aget_var*
//#UC END# *492EF877026C_493027CE015Aget_var*
begin
//#UC START# *492EF877026C_493027CE015Aget_impl*
 !!! Needs to be implemented !!!
//#UC END# *492EF877026C_493027CE015Aget_impl*
end;//TsdsSituation.pm_GetdsTreeAttributeFirstLevel

function TsdsSituation.pm_GetdsSaveLoad: IdsSaveLoad;
//#UC START# *492EF8AA024F_493027CE015Aget_var*
//#UC END# *492EF8AA024F_493027CE015Aget_var*
begin
//#UC START# *492EF8AA024F_493027CE015Aget_impl*
 !!! Needs to be implemented !!!
//#UC END# *492EF8AA024F_493027CE015Aget_impl*
end;//TsdsSituation.pm_GetdsSaveLoad

function TsdsSituation.pm_GetdsSelectedAttributes: IdsSelectedAttributes;
//#UC START# *492EF8E10244_493027CE015Aget_var*
//#UC END# *492EF8E10244_493027CE015Aget_var*
begin
//#UC START# *492EF8E10244_493027CE015Aget_impl*
 !!! Needs to be implemented !!!
//#UC END# *492EF8E10244_493027CE015Aget_impl*
end;//TsdsSituation.pm_GetdsSelectedAttributes

function TsdsSituation.pm_GetdsTreeAttributeSelect: IdsTreeAttributeSelect;
//#UC START# *492EF8F20381_493027CE015Aget_var*
//#UC END# *492EF8F20381_493027CE015Aget_var*
begin
//#UC START# *492EF8F20381_493027CE015Aget_impl*
 !!! Needs to be implemented !!!
//#UC END# *492EF8F20381_493027CE015Aget_impl*
end;//TsdsSituation.pm_GetdsTreeAttributeSelect

function TsdsSituation.pm_GetdsAttributeSelect: IdsAttributeSelect;
//#UC START# *493027030386_493027CE015Aget_var*
//#UC END# *493027030386_493027CE015Aget_var*
begin
//#UC START# *493027030386_493027CE015Aget_impl*
 !!! Needs to be implemented !!!
//#UC END# *493027030386_493027CE015Aget_impl*
end;//TsdsSituation.pm_GetdsAttributeSelect

procedure TsdsSituation.UpdateSelectedAttributes;
 {* �������� ������ � ����� ��������� ��������� }
//#UC START# *4959149300F9_493027CE015A_var*
//#UC END# *4959149300F9_493027CE015A_var*
begin
//#UC START# *4959149300F9_493027CE015A_impl*
 if (f_dsSelectedAttributes <> nil) then
  f_dsSelectedAttributes.Referred := nil;
 Refresh;
//#UC END# *4959149300F9_493027CE015A_impl*
end;//TsdsSituation.UpdateSelectedAttributes

{$If NOT Defined(NoVCM)}
procedure TsdsSituation.ClearAreas;
 {* ������� ������ �� ������� ����� }
//#UC START# *4938F7E702B7_493027CE015A_var*
//#UC END# *4938F7E702B7_493027CE015A_var*
begin
//#UC START# *4938F7E702B7_493027CE015A_impl*
 !!! Needs to be implemented !!!
//#UC END# *4938F7E702B7_493027CE015A_impl*
end;//TsdsSituation.ClearAreas
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // NOT Defined(Admin)
end.
