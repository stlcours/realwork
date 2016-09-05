unit InterfacedNodeWords;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\InterfacedNodeWords.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "InterfacedNodeWords" MUID: (53B532DE0203)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , l3Interfaces
 , l3Tree_TLB
 , l3TreeInterfaces
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwPropertyLike
 , tfwScriptingInterfaces
 , TypInfo
 , tfwTypeInfo
 , tfwAxiomaticsResNameGetter
 , SysUtils
 , TtfwTypeRegistrator_Proxy
 , tfwScriptingTypes
 //#UC START# *53B532DE0203impl_uses*
 //#UC END# *53B532DE0203impl_uses*
;

type
 TkwNodeCaption = {final} class(TtfwPropertyLike)
  {* ����� ������� Node:Caption }
  private
   function Caption(const aCtx: TtfwContext;
    const aNode: Il3Node): Tl3WString;
    {* ���������� ����� ������� Node:Caption }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwNodeCaption

 TkwNodeIndex = {final} class(TtfwPropertyLike)
  {* ����� ������� Node:Index }
  private
   function Index(const aCtx: TtfwContext;
    const aNode: Il3Node): Integer;
    {* ���������� ����� ������� Node:Index }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwNodeIndex

 TkwNodeIndexInTree = {final} class(TtfwPropertyLike)
  {* ����� ������� Node:IndexInTree }
  private
   function IndexInTree(const aCtx: TtfwContext;
    const aNode: Il3Node): Integer;
    {* ���������� ����� ������� Node:IndexInTree }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwNodeIndexInTree

 TInterfacedNodeWordsResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* ����������� ������������ ����������� }
  public
   class function ResName: AnsiString; override;
 end;//TInterfacedNodeWordsResNameGetter

function TkwNodeCaption.Caption(const aCtx: TtfwContext;
 const aNode: Il3Node): Tl3WString;
 {* ���������� ����� ������� Node:Caption }
//#UC START# *54F99E960080_54F99E960080_476BF22B03E1_Word_var*
//#UC END# *54F99E960080_54F99E960080_476BF22B03E1_Word_var*
begin
//#UC START# *54F99E960080_54F99E960080_476BF22B03E1_Word_impl*
 Result := aNode.Text;
//#UC END# *54F99E960080_54F99E960080_476BF22B03E1_Word_impl*
end;//TkwNodeCaption.Caption

class function TkwNodeCaption.GetWordNameForRegister: AnsiString;
begin
 Result := 'Node:Caption';
end;//TkwNodeCaption.GetWordNameForRegister

function TkwNodeCaption.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiString;
end;//TkwNodeCaption.GetResultTypeInfo

function TkwNodeCaption.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwNodeCaption.GetAllParamsCount

function TkwNodeCaption.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(Il3Node)]);
end;//TkwNodeCaption.ParamsTypes

procedure TkwNodeCaption.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� Caption', aCtx);
end;//TkwNodeCaption.SetValuePrim

procedure TkwNodeCaption.DoDoIt(const aCtx: TtfwContext);
var l_aNode: Il3Node;
begin
 try
  l_aNode := Il3Node(aCtx.rEngine.PopIntf(Il3Node));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aNode: Il3Node : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString(Caption(aCtx, l_aNode));
end;//TkwNodeCaption.DoDoIt

function TkwNodeIndex.Index(const aCtx: TtfwContext;
 const aNode: Il3Node): Integer;
 {* ���������� ����� ������� Node:Index }
//#UC START# *54F99EB00271_54F99EB00271_476BF22B03E1_Word_var*
//#UC END# *54F99EB00271_54F99EB00271_476BF22B03E1_Word_var*
begin
//#UC START# *54F99EB00271_54F99EB00271_476BF22B03E1_Word_impl*
 Result := aNode.GetNumInParent;
//#UC END# *54F99EB00271_54F99EB00271_476BF22B03E1_Word_impl*
end;//TkwNodeIndex.Index

class function TkwNodeIndex.GetWordNameForRegister: AnsiString;
begin
 Result := 'Node:Index';
end;//TkwNodeIndex.GetWordNameForRegister

function TkwNodeIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Integer);
end;//TkwNodeIndex.GetResultTypeInfo

function TkwNodeIndex.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwNodeIndex.GetAllParamsCount

function TkwNodeIndex.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(Il3Node)]);
end;//TkwNodeIndex.ParamsTypes

procedure TkwNodeIndex.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� Index', aCtx);
end;//TkwNodeIndex.SetValuePrim

procedure TkwNodeIndex.DoDoIt(const aCtx: TtfwContext);
var l_aNode: Il3Node;
begin
 try
  l_aNode := Il3Node(aCtx.rEngine.PopIntf(Il3Node));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aNode: Il3Node : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(Index(aCtx, l_aNode));
end;//TkwNodeIndex.DoDoIt

function TkwNodeIndexInTree.IndexInTree(const aCtx: TtfwContext;
 const aNode: Il3Node): Integer;
 {* ���������� ����� ������� Node:IndexInTree }
//#UC START# *54F99EBA0231_54F99EBA0231_476BF22B03E1_Word_var*
var
 l_Index: Integer;
 l_P: Il3Node;
//#UC END# *54F99EBA0231_54F99EBA0231_476BF22B03E1_Word_var*
begin
//#UC START# *54F99EBA0231_54F99EBA0231_476BF22B03E1_Word_impl*
 l_Index := aNode.GetNumInParent;
 l_P := aNode.ParentNode;
 try
  while Assigned(l_P) do
  begin
   l_Index := l_Index + l_P.GetNumInParent;
   l_P := l_P.ParentNode;
  end;//while Assigned(l_P)
 finally
  l_P := nil;
 end;//try..finally
//#UC END# *54F99EBA0231_54F99EBA0231_476BF22B03E1_Word_impl*
end;//TkwNodeIndexInTree.IndexInTree

class function TkwNodeIndexInTree.GetWordNameForRegister: AnsiString;
begin
 Result := 'Node:IndexInTree';
end;//TkwNodeIndexInTree.GetWordNameForRegister

function TkwNodeIndexInTree.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Integer);
end;//TkwNodeIndexInTree.GetResultTypeInfo

function TkwNodeIndexInTree.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwNodeIndexInTree.GetAllParamsCount

function TkwNodeIndexInTree.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(Il3Node)]);
end;//TkwNodeIndexInTree.ParamsTypes

procedure TkwNodeIndexInTree.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� IndexInTree', aCtx);
end;//TkwNodeIndexInTree.SetValuePrim

procedure TkwNodeIndexInTree.DoDoIt(const aCtx: TtfwContext);
var l_aNode: Il3Node;
begin
 try
  l_aNode := Il3Node(aCtx.rEngine.PopIntf(Il3Node));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aNode: Il3Node : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(IndexInTree(aCtx, l_aNode));
end;//TkwNodeIndexInTree.DoDoIt

class function TInterfacedNodeWordsResNameGetter.ResName: AnsiString;
begin
 Result := 'InterfacedNodeWords';
end;//TInterfacedNodeWordsResNameGetter.ResName

{$R InterfacedNodeWords.res}

initialization
 TkwNodeCaption.RegisterInEngine;
 {* ����������� Node_Caption }
 TkwNodeIndex.RegisterInEngine;
 {* ����������� Node_Index }
 TkwNodeIndexInTree.RegisterInEngine;
 {* ����������� Node_IndexInTree }
 TInterfacedNodeWordsResNameGetter.Register;
 {* ����������� ������������ ����������� }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Il3Node));
 {* ����������� ���� Il3Node }
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
 {* ����������� ���� Tl3WString }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
{$IfEnd} // NOT Defined(NoScripts)

end.
