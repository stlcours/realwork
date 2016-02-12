unit nsBaseSearchServiceImpl;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Search\nsBaseSearchServiceImpl.pas"
// ���������: "ServiceImplementation"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , l3ProtoObject
 , nsBaseSearchService
 , BaseSearchInterfaces
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3ProtoDataContainer
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _KeyType_ = Pointer;
 _ValueType_ = Pointer;
 _l3Map_Parent_ = Tl3ProtoDataContainer;
 {$Include w:\common\components\rtl\Garant\L3\l3Map.imp.pas}
 TnsContainerToBaseSearcherMap = class(_l3Map_)
 end;//TnsContainerToBaseSearcherMap

 TnsBaseSearchServiceImpl = {final} class(Tl3ProtoObject, InsBaseSearchService)
  private
   f_SearcherMap: TnsContainerToBaseSearcherMap;
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure InitFields; override;
  public
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
   function GetBaseSearcher(const aEntityForm: IvcmEntityForm): InsBaseSearcher;
   procedure RegisterBaseSearcherProvider(const aContainer: IvcmContainer;
    const aProvider: InsBaseSearcherProvider);
   procedure UnregisterBaseSearcherProvider(const aContainer: IvcmContainer;
    const aProvider: InsBaseSearcherProvider);
   class function Instance: TnsBaseSearchServiceImpl;
    {* ����� ��������� ���������� ���������� TnsBaseSearchServiceImpl }
 end;//TnsBaseSearchServiceImpl
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , SysUtils
 , l3Base
 , l3MinMax
 , RTLConsts
;

var g_TnsBaseSearchServiceImpl: TnsBaseSearchServiceImpl = nil;
 {* ��������� ���������� TnsBaseSearchServiceImpl }

procedure TnsBaseSearchServiceImplFree;
 {* ����� ������������ ���������� ���������� TnsBaseSearchServiceImpl }
begin
 l3Free(g_TnsBaseSearchServiceImpl);
end;//TnsBaseSearchServiceImplFree

function CompareKeys(const aA: _KeyType_;
 const aB: _KeyType_): Integer;
//#UC START# *5609091B00C0_56320A830305_var*
//#UC END# *5609091B00C0_56320A830305_var*
begin
//#UC START# *5609091B00C0_56320A830305_impl*
 Result := Integer(aB) - Integer(aA);
//#UC END# *5609091B00C0_56320A830305_impl*
end;//CompareKeys

type _Instance_R_ = TnsContainerToBaseSearcherMap;

{$Include w:\common\components\rtl\Garant\L3\l3Map.imp.pas}

class function TnsBaseSearchServiceImpl.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TnsBaseSearchServiceImpl <> nil;
end;//TnsBaseSearchServiceImpl.Exists

function TnsBaseSearchServiceImpl.GetBaseSearcher(const aEntityForm: IvcmEntityForm): InsBaseSearcher;
//#UC START# *4923CA8F0CFB_563208C60299_var*
var
 l_MainForm: IvcmContainer;
 l_Provider: InsBaseSearcherProvider;
//#UC END# *4923CA8F0CFB_563208C60299_var*
begin
//#UC START# *4923CA8F0CFB_563208C60299_impl*
 Result := nil;
 l_MainForm := aEntityForm.NativeMainForm;
 if f_SearcherMap.Has(Pointer(l_MainForm)) then
 begin
  l_Provider := InsBaseSearcherProvider(f_SearcherMap.ValueByKey(Pointer(l_MainForm)));
  Result := l_Provider.BaseSearcher;
 end; 
//#UC END# *4923CA8F0CFB_563208C60299_impl*
end;//TnsBaseSearchServiceImpl.GetBaseSearcher

procedure TnsBaseSearchServiceImpl.RegisterBaseSearcherProvider(const aContainer: IvcmContainer;
 const aProvider: InsBaseSearcherProvider);
//#UC START# *B86FD3ED4532_563208C60299_var*
//#UC END# *B86FD3ED4532_563208C60299_var*
begin
//#UC START# *B86FD3ED4532_563208C60299_impl*
f_SearcherMap.Add(Pointer(aContainer), Pointer(aProvider));
//#UC END# *B86FD3ED4532_563208C60299_impl*
end;//TnsBaseSearchServiceImpl.RegisterBaseSearcherProvider

procedure TnsBaseSearchServiceImpl.UnregisterBaseSearcherProvider(const aContainer: IvcmContainer;
 const aProvider: InsBaseSearcherProvider);
//#UC START# *CB784FFDCCE4_563208C60299_var*
var
 l_Index: Integer;
//#UC END# *CB784FFDCCE4_563208C60299_var*
begin
//#UC START# *CB784FFDCCE4_563208C60299_impl*
 if f_SearcherMap.FindData(Tl3KeyValuePair_ForFind(Pointer(aContainer)), l_Index) then
  f_SearcherMap.Delete(l_Index);
//#UC END# *CB784FFDCCE4_563208C60299_impl*
end;//TnsBaseSearchServiceImpl.UnregisterBaseSearcherProvider

class function TnsBaseSearchServiceImpl.Instance: TnsBaseSearchServiceImpl;
 {* ����� ��������� ���������� ���������� TnsBaseSearchServiceImpl }
begin
 if (g_TnsBaseSearchServiceImpl = nil) then
 begin
  l3System.AddExitProc(TnsBaseSearchServiceImplFree);
  g_TnsBaseSearchServiceImpl := Create;
 end;
 Result := g_TnsBaseSearchServiceImpl;
end;//TnsBaseSearchServiceImpl.Instance

procedure TnsBaseSearchServiceImpl.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_563208C60299_var*
//#UC END# *479731C50290_563208C60299_var*
begin
//#UC START# *479731C50290_563208C60299_impl*
 FreeAndNil(f_SearcherMap);
 inherited;
//#UC END# *479731C50290_563208C60299_impl*
end;//TnsBaseSearchServiceImpl.Cleanup

procedure TnsBaseSearchServiceImpl.InitFields;
//#UC START# *47A042E100E2_563208C60299_var*
//#UC END# *47A042E100E2_563208C60299_var*
begin
//#UC START# *47A042E100E2_563208C60299_impl*
 f_SearcherMap := TnsContainerToBaseSearcherMap.Create; 
//#UC END# *47A042E100E2_563208C60299_impl*
end;//TnsBaseSearchServiceImpl.InitFields

initialization
 TnsBaseSearchService.Instance.Alien := TnsBaseSearchServiceImpl.Instance;
 {* ����������� TnsBaseSearchServiceImpl }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
