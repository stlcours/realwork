unit nsBaseMainMenuTree;
 {* ������� ������ ���� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Common\nsBaseMainMenuTree.pas"
// ���������: "SimpleClass"
// ������� ������: "TnsBaseMainMenuTree" MUID: (4909EF3B02B1)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , nsDataResetTree
 , l3Tree_TLB
 , DynamicTreeUnit
 , nsTypes
 , l3Interfaces
;

type
 TnsBaseMainMenuTree = class(TnsDataResetTree)
  {* ������� ������ ���� }
  protected
   function MakeRoot: Il3RootNode; virtual;
    {* ������ ������ ������ }
   class procedure nsAddMainMenuItem(const aRoot: Il3RootNode;
    aMenuItem: Integer;
    const aNavigatorItem: TnsNavigatorItemParams;
    const aParent: INodeBase = nil); overload;
   class procedure nsAddMainMenuItem(const aRoot: Il3RootNode;
    aMenuItem: Integer;
    const aCaption: Il3CString); overload;
   procedure InitFields; override;
   procedure AfterReget; override;
   function RegetRootNode: Il3RootNode; override;
  public
   class function nsFindNavigatorItem(const aParams: TnsNavigatorItemParams;
    const aParent: INodeBase = nil): INodeBase;
    {* ����� ������� � ������ ����������. ���� �������� �� ������, �� ������������ ������ ������. }
 end;//TnsBaseMainMenuTree
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , nsNodes
 , SysUtils
 , nsRubricatorCache
 , BaseTypesUnit
 , nsNewCachableNode
 , nsMainMenuNode
 //#UC START# *4909EF3B02B1impl_uses*
 //#UC END# *4909EF3B02B1impl_uses*
;

function TnsBaseMainMenuTree.MakeRoot: Il3RootNode;
 {* ������ ������ ������ }
//#UC START# *4909EF6E0361_4909EF3B02B1_var*
//#UC END# *4909EF6E0361_4909EF3B02B1_var*
begin
//#UC START# *4909EF6E0361_4909EF3B02B1_impl*
 Supports(TnsNewCachableNode.Make(nil), Il3RootNode, Result);
//#UC END# *4909EF6E0361_4909EF3B02B1_impl*
end;//TnsBaseMainMenuTree.MakeRoot

class function TnsBaseMainMenuTree.nsFindNavigatorItem(const aParams: TnsNavigatorItemParams;
 const aParent: INodeBase = nil): INodeBase;
 {* ����� ������� � ������ ����������. ���� �������� �� ������, �� ������������ ������ ������. }
//#UC START# *490B08670285_4909EF3B02B1_var*
var
 l_Item   : INodeBase;
 l_Temp   : INodeBase;
 l_Parent : INodeBase;
 l_Params : TnsNavigatorItemParams;
//#UC END# *490B08670285_4909EF3B02B1_var*
begin
//#UC START# *490B08670285_4909EF3B02B1_impl*
 Result := nil;
 if aParent = nil then
  l_Parent := TnsRubricatorCache.Instance.RubricatorRoot
 else
  l_Parent := aParent;
 l_Parent.GetFirstChild(l_Item);
 while Assigned(l_Item) do
 begin
  if TNavigatorMenuItemType(l_Item.GetType) = aParams.rId then
  begin
   Result := l_Item;
   Break;
  end;//if TNavigatorMenuItemType(l_Item.GetType) = aParams.rId then
  if aParams.rLevel > 0 then
  begin
   l_Params := aParams;
   Dec(l_Params.rLevel);
   Result := nsFindNavigatorItem(l_Params, l_Item);
  end;//if aParams.rLevel > 0 then
  if Assigned(Result) then
   Break;
  l_Item.GetNext(l_Temp);
  try
   l_Item := l_Temp;
  finally
   l_Temp := nil;
  end;//try..finally
 end;//while Assigned(l_Item) do
//#UC END# *490B08670285_4909EF3B02B1_impl*
end;//TnsBaseMainMenuTree.nsFindNavigatorItem

class procedure TnsBaseMainMenuTree.nsAddMainMenuItem(const aRoot: Il3RootNode;
 aMenuItem: Integer;
 const aNavigatorItem: TnsNavigatorItemParams;
 const aParent: INodeBase = nil);
//#UC START# *490B12C6035E_4909EF3B02B1_var*
var
 l_Node: INodeBase;
//#UC END# *490B12C6035E_4909EF3B02B1_var*
begin
//#UC START# *490B12C6035E_4909EF3B02B1_impl*
 l_Node := nsFindNavigatorItem(aNavigatorItem, aParent);
 if l_Node <> nil then
 try
  aRoot.InsertChild(TnsMainMenuNode.Make(aMenuItem, nil, l_Node));
 finally
  l_Node := nil;
 end;{try..finally}
//#UC END# *490B12C6035E_4909EF3B02B1_impl*
end;//TnsBaseMainMenuTree.nsAddMainMenuItem

class procedure TnsBaseMainMenuTree.nsAddMainMenuItem(const aRoot: Il3RootNode;
 aMenuItem: Integer;
 const aCaption: Il3CString);
//#UC START# *53A988E703D5_4909EF3B02B1_var*
//#UC END# *53A988E703D5_4909EF3B02B1_var*
begin
//#UC START# *53A988E703D5_4909EF3B02B1_impl*
 aRoot.InsertChild(TnsMainMenuNode.Make(aMenuItem, aCaption, nil));
//#UC END# *53A988E703D5_4909EF3B02B1_impl*
end;//TnsBaseMainMenuTree.nsAddMainMenuItem

procedure TnsBaseMainMenuTree.InitFields;
//#UC START# *47A042E100E2_4909EF3B02B1_var*
//#UC END# *47A042E100E2_4909EF3B02B1_var*
begin
//#UC START# *47A042E100E2_4909EF3B02B1_impl*
 inherited;
 RootNode := MakeRoot;
 if RootNode <> nil then
  ExpandSubDir(RootNode, True);
//#UC END# *47A042E100E2_4909EF3B02B1_impl*
end;//TnsBaseMainMenuTree.InitFields

procedure TnsBaseMainMenuTree.AfterReget;
//#UC START# *4908AAF6015C_4909EF3B02B1_var*
//#UC END# *4908AAF6015C_4909EF3B02B1_var*
begin
//#UC START# *4908AAF6015C_4909EF3B02B1_impl*
 inherited;
 if RootNode <> nil then
  ExpandSubDir(RootNode, True);
//#UC END# *4908AAF6015C_4909EF3B02B1_impl*
end;//TnsBaseMainMenuTree.AfterReget

function TnsBaseMainMenuTree.RegetRootNode: Il3RootNode;
//#UC START# *4908AB070319_4909EF3B02B1_var*
//#UC END# *4908AB070319_4909EF3B02B1_var*
begin
//#UC START# *4908AB070319_4909EF3B02B1_impl*
 case BeenReseted of
  rtsRoot:
   begin
    Result := MakeRoot;
    RootNode := Result;
   end;
  else
   Result := inherited RegetRootNode;
 end;//case BeenReseted of
//#UC END# *4908AB070319_4909EF3B02B1_impl*
end;//TnsBaseMainMenuTree.RegetRootNode
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
