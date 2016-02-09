unit TreeNodeWordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\TreeNodeWordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3IntfUses
 , ComCtrls
 , tfwClassLike
 , tfwScriptingInterfaces
 , TypInfo
;
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

implementation

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3ImplUses
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , SysUtils
;

type
 TkwPopTreeNodeGetNext = {final} class(TtfwClassLike)
  {* ����� ������� pop:TreeNode:GetNext
*��� ����������:* TTreeNode
*������:*
[code]
OBJECT VAR l_TTreeNode
 aTreeNode pop:TreeNode:GetNext >>> l_TTreeNode
[code]  }
  private
   function GetNext(const aCtx: TtfwContext;
    aTreeNode: TTreeNode): TTreeNode;
    {* ���������� ����� ������� pop:TreeNode:GetNext }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopTreeNodeGetNext

 TkwPopTreeNodeHasChildren = {final} class(TtfwClassLike)
  {* ����� ������� pop:TreeNode:HasChildren
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aTreeNode pop:TreeNode:HasChildren >>> l_Boolean
[code]  }
  private
   function HasChildren(const aCtx: TtfwContext;
    aTreeNode: TTreeNode): Boolean;
    {* ���������� ����� ������� pop:TreeNode:HasChildren }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopTreeNodeHasChildren

 TkwPopTreeNodeGetPrev = {final} class(TtfwClassLike)
  {* ����� ������� pop:TreeNode:GetPrev
*��� ����������:* TTreeNode
*������:*
[code]
OBJECT VAR l_TTreeNode
 aTreeNode pop:TreeNode:GetPrev >>> l_TTreeNode
[code]  }
  private
   function GetPrev(const aCtx: TtfwContext;
    aTreeNode: TTreeNode): TTreeNode;
    {* ���������� ����� ������� pop:TreeNode:GetPrev }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopTreeNodeGetPrev

 TkwPopTreeNodeGetFirstChild = {final} class(TtfwClassLike)
  {* ����� ������� pop:TreeNode:GetFirstChild
*��� ����������:* TTreeNode
*������:*
[code]
OBJECT VAR l_TTreeNode
 aTreeNode pop:TreeNode:GetFirstChild >>> l_TTreeNode
[code]  }
  private
   function GetFirstChild(const aCtx: TtfwContext;
    aTreeNode: TTreeNode): TTreeNode;
    {* ���������� ����� ������� pop:TreeNode:GetFirstChild }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopTreeNodeGetFirstChild

 TkwPopTreeNodeGetLastChild = {final} class(TtfwClassLike)
  {* ����� ������� pop:TreeNode:GetLastChild
*��� ����������:* TTreeNode
*������:*
[code]
OBJECT VAR l_TTreeNode
 aTreeNode pop:TreeNode:GetLastChild >>> l_TTreeNode
[code]  }
  private
   function GetLastChild(const aCtx: TtfwContext;
    aTreeNode: TTreeNode): TTreeNode;
    {* ���������� ����� ������� pop:TreeNode:GetLastChild }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopTreeNodeGetLastChild

 TkwPopTreeNodeGetNextSibling = {final} class(TtfwClassLike)
  {* ����� ������� pop:TreeNode:GetNextSibling
*��� ����������:* TTreeNode
*������:*
[code]
OBJECT VAR l_TTreeNode
 aTreeNode pop:TreeNode:GetNextSibling >>> l_TTreeNode
[code]  }
  private
   function GetNextSibling(const aCtx: TtfwContext;
    aTreeNode: TTreeNode): TTreeNode;
    {* ���������� ����� ������� pop:TreeNode:GetNextSibling }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopTreeNodeGetNextSibling

 TkwPopTreeNodeGetPrevSibling = {final} class(TtfwClassLike)
  {* ����� ������� pop:TreeNode:GetPrevSibling
*��� ����������:* TTreeNode
*������:*
[code]
OBJECT VAR l_TTreeNode
 aTreeNode pop:TreeNode:GetPrevSibling >>> l_TTreeNode
[code]  }
  private
   function GetPrevSibling(const aCtx: TtfwContext;
    aTreeNode: TTreeNode): TTreeNode;
    {* ���������� ����� ������� pop:TreeNode:GetPrevSibling }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopTreeNodeGetPrevSibling

 TkwPopTreeNodeGetNextVisible = {final} class(TtfwClassLike)
  {* ����� ������� pop:TreeNode:GetNextVisible
*��� ����������:* TTreeNode
*������:*
[code]
OBJECT VAR l_TTreeNode
 aTreeNode pop:TreeNode:GetNextVisible >>> l_TTreeNode
[code]  }
  private
   function GetNextVisible(const aCtx: TtfwContext;
    aTreeNode: TTreeNode): TTreeNode;
    {* ���������� ����� ������� pop:TreeNode:GetNextVisible }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopTreeNodeGetNextVisible

 TkwPopTreeNodeGetPrevVisible = {final} class(TtfwClassLike)
  {* ����� ������� pop:TreeNode:GetPrevVisible
*��� ����������:* TTreeNode
*������:*
[code]
OBJECT VAR l_TTreeNode
 aTreeNode pop:TreeNode:GetPrevVisible >>> l_TTreeNode
[code]  }
  private
   function GetPrevVisible(const aCtx: TtfwContext;
    aTreeNode: TTreeNode): TTreeNode;
    {* ���������� ����� ������� pop:TreeNode:GetPrevVisible }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopTreeNodeGetPrevVisible

 TkwPopTreeNodeExpand = {final} class(TtfwClassLike)
  {* ����� ������� pop:TreeNode:Expand
*������:*
[code]
 aRecurse aTreeNode pop:TreeNode:Expand
[code]  }
  private
   procedure Expand(const aCtx: TtfwContext;
    aTreeNode: TTreeNode;
    aRecurse: Boolean);
    {* ���������� ����� ������� pop:TreeNode:Expand }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopTreeNodeExpand

function TkwPopTreeNodeGetNext.GetNext(const aCtx: TtfwContext;
 aTreeNode: TTreeNode): TTreeNode;
 {* ���������� ����� ������� pop:TreeNode:GetNext }
//#UC START# *F036C8335C15_A78303612230_var*
//#UC END# *F036C8335C15_A78303612230_var*
begin
//#UC START# *F036C8335C15_A78303612230_impl*
 Result := aTreeNode.GetNext;
//#UC END# *F036C8335C15_A78303612230_impl*
end;//TkwPopTreeNodeGetNext.GetNext

procedure TkwPopTreeNodeGetNext.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_A78303612230_var*
//#UC END# *4DAEEDE10285_A78303612230_var*
begin
//#UC START# *4DAEEDE10285_A78303612230_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_A78303612230_impl*
end;//TkwPopTreeNodeGetNext.DoDoIt

class function TkwPopTreeNodeGetNext.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TreeNode:GetNext';
end;//TkwPopTreeNodeGetNext.GetWordNameForRegister

function TkwPopTreeNodeGetNext.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TTreeNode);
end;//TkwPopTreeNodeGetNext.GetResultTypeInfo

function TkwPopTreeNodeGetNext.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopTreeNodeGetNext.GetAllParamsCount

function TkwPopTreeNodeGetNext.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_A78303612230_var*
//#UC END# *5617F4D00243_A78303612230_var*
begin
//#UC START# *5617F4D00243_A78303612230_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_A78303612230_impl*
end;//TkwPopTreeNodeGetNext.ParamsTypes

function TkwPopTreeNodeHasChildren.HasChildren(const aCtx: TtfwContext;
 aTreeNode: TTreeNode): Boolean;
 {* ���������� ����� ������� pop:TreeNode:HasChildren }
//#UC START# *A5D06F0C77D0_5E7363490ED0_var*
//#UC END# *A5D06F0C77D0_5E7363490ED0_var*
begin
//#UC START# *A5D06F0C77D0_5E7363490ED0_impl*
 Result := aTreeNode.HasChildren;
//#UC END# *A5D06F0C77D0_5E7363490ED0_impl*
end;//TkwPopTreeNodeHasChildren.HasChildren

procedure TkwPopTreeNodeHasChildren.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5E7363490ED0_var*
//#UC END# *4DAEEDE10285_5E7363490ED0_var*
begin
//#UC START# *4DAEEDE10285_5E7363490ED0_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_5E7363490ED0_impl*
end;//TkwPopTreeNodeHasChildren.DoDoIt

class function TkwPopTreeNodeHasChildren.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TreeNode:HasChildren';
end;//TkwPopTreeNodeHasChildren.GetWordNameForRegister

function TkwPopTreeNodeHasChildren.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Boolean);
end;//TkwPopTreeNodeHasChildren.GetResultTypeInfo

function TkwPopTreeNodeHasChildren.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopTreeNodeHasChildren.GetAllParamsCount

function TkwPopTreeNodeHasChildren.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_5E7363490ED0_var*
//#UC END# *5617F4D00243_5E7363490ED0_var*
begin
//#UC START# *5617F4D00243_5E7363490ED0_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_5E7363490ED0_impl*
end;//TkwPopTreeNodeHasChildren.ParamsTypes

function TkwPopTreeNodeGetPrev.GetPrev(const aCtx: TtfwContext;
 aTreeNode: TTreeNode): TTreeNode;
 {* ���������� ����� ������� pop:TreeNode:GetPrev }
//#UC START# *AB6849BAAE6B_55B024C23EBF_var*
//#UC END# *AB6849BAAE6B_55B024C23EBF_var*
begin
//#UC START# *AB6849BAAE6B_55B024C23EBF_impl*
 Result := aTreeNode.GetPrev;
//#UC END# *AB6849BAAE6B_55B024C23EBF_impl*
end;//TkwPopTreeNodeGetPrev.GetPrev

procedure TkwPopTreeNodeGetPrev.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_55B024C23EBF_var*
//#UC END# *4DAEEDE10285_55B024C23EBF_var*
begin
//#UC START# *4DAEEDE10285_55B024C23EBF_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_55B024C23EBF_impl*
end;//TkwPopTreeNodeGetPrev.DoDoIt

class function TkwPopTreeNodeGetPrev.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TreeNode:GetPrev';
end;//TkwPopTreeNodeGetPrev.GetWordNameForRegister

function TkwPopTreeNodeGetPrev.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TTreeNode);
end;//TkwPopTreeNodeGetPrev.GetResultTypeInfo

function TkwPopTreeNodeGetPrev.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopTreeNodeGetPrev.GetAllParamsCount

function TkwPopTreeNodeGetPrev.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_55B024C23EBF_var*
//#UC END# *5617F4D00243_55B024C23EBF_var*
begin
//#UC START# *5617F4D00243_55B024C23EBF_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_55B024C23EBF_impl*
end;//TkwPopTreeNodeGetPrev.ParamsTypes

function TkwPopTreeNodeGetFirstChild.GetFirstChild(const aCtx: TtfwContext;
 aTreeNode: TTreeNode): TTreeNode;
 {* ���������� ����� ������� pop:TreeNode:GetFirstChild }
//#UC START# *200474EC25F0_5EA990C4D795_var*
//#UC END# *200474EC25F0_5EA990C4D795_var*
begin
//#UC START# *200474EC25F0_5EA990C4D795_impl*
 Result := aTreeNode.GetFirstChild; 
//#UC END# *200474EC25F0_5EA990C4D795_impl*
end;//TkwPopTreeNodeGetFirstChild.GetFirstChild

procedure TkwPopTreeNodeGetFirstChild.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5EA990C4D795_var*
//#UC END# *4DAEEDE10285_5EA990C4D795_var*
begin
//#UC START# *4DAEEDE10285_5EA990C4D795_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_5EA990C4D795_impl*
end;//TkwPopTreeNodeGetFirstChild.DoDoIt

class function TkwPopTreeNodeGetFirstChild.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TreeNode:GetFirstChild';
end;//TkwPopTreeNodeGetFirstChild.GetWordNameForRegister

function TkwPopTreeNodeGetFirstChild.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TTreeNode);
end;//TkwPopTreeNodeGetFirstChild.GetResultTypeInfo

function TkwPopTreeNodeGetFirstChild.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopTreeNodeGetFirstChild.GetAllParamsCount

function TkwPopTreeNodeGetFirstChild.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_5EA990C4D795_var*
//#UC END# *5617F4D00243_5EA990C4D795_var*
begin
//#UC START# *5617F4D00243_5EA990C4D795_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_5EA990C4D795_impl*
end;//TkwPopTreeNodeGetFirstChild.ParamsTypes

function TkwPopTreeNodeGetLastChild.GetLastChild(const aCtx: TtfwContext;
 aTreeNode: TTreeNode): TTreeNode;
 {* ���������� ����� ������� pop:TreeNode:GetLastChild }
//#UC START# *E2F8A6090E56_C6C1AF6914F1_var*
//#UC END# *E2F8A6090E56_C6C1AF6914F1_var*
begin
//#UC START# *E2F8A6090E56_C6C1AF6914F1_impl*
 Result := aTreeNode.GetLastChild;
//#UC END# *E2F8A6090E56_C6C1AF6914F1_impl*
end;//TkwPopTreeNodeGetLastChild.GetLastChild

procedure TkwPopTreeNodeGetLastChild.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_C6C1AF6914F1_var*
//#UC END# *4DAEEDE10285_C6C1AF6914F1_var*
begin
//#UC START# *4DAEEDE10285_C6C1AF6914F1_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_C6C1AF6914F1_impl*
end;//TkwPopTreeNodeGetLastChild.DoDoIt

class function TkwPopTreeNodeGetLastChild.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TreeNode:GetLastChild';
end;//TkwPopTreeNodeGetLastChild.GetWordNameForRegister

function TkwPopTreeNodeGetLastChild.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TTreeNode);
end;//TkwPopTreeNodeGetLastChild.GetResultTypeInfo

function TkwPopTreeNodeGetLastChild.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopTreeNodeGetLastChild.GetAllParamsCount

function TkwPopTreeNodeGetLastChild.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_C6C1AF6914F1_var*
//#UC END# *5617F4D00243_C6C1AF6914F1_var*
begin
//#UC START# *5617F4D00243_C6C1AF6914F1_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_C6C1AF6914F1_impl*
end;//TkwPopTreeNodeGetLastChild.ParamsTypes

function TkwPopTreeNodeGetNextSibling.GetNextSibling(const aCtx: TtfwContext;
 aTreeNode: TTreeNode): TTreeNode;
 {* ���������� ����� ������� pop:TreeNode:GetNextSibling }
//#UC START# *B86DC202F7D8_D75C1EAFB29F_var*
//#UC END# *B86DC202F7D8_D75C1EAFB29F_var*
begin
//#UC START# *B86DC202F7D8_D75C1EAFB29F_impl*
 Result := aTreeNode.GetNextSibling;
//#UC END# *B86DC202F7D8_D75C1EAFB29F_impl*
end;//TkwPopTreeNodeGetNextSibling.GetNextSibling

procedure TkwPopTreeNodeGetNextSibling.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_D75C1EAFB29F_var*
//#UC END# *4DAEEDE10285_D75C1EAFB29F_var*
begin
//#UC START# *4DAEEDE10285_D75C1EAFB29F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_D75C1EAFB29F_impl*
end;//TkwPopTreeNodeGetNextSibling.DoDoIt

class function TkwPopTreeNodeGetNextSibling.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TreeNode:GetNextSibling';
end;//TkwPopTreeNodeGetNextSibling.GetWordNameForRegister

function TkwPopTreeNodeGetNextSibling.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TTreeNode);
end;//TkwPopTreeNodeGetNextSibling.GetResultTypeInfo

function TkwPopTreeNodeGetNextSibling.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopTreeNodeGetNextSibling.GetAllParamsCount

function TkwPopTreeNodeGetNextSibling.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_D75C1EAFB29F_var*
//#UC END# *5617F4D00243_D75C1EAFB29F_var*
begin
//#UC START# *5617F4D00243_D75C1EAFB29F_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_D75C1EAFB29F_impl*
end;//TkwPopTreeNodeGetNextSibling.ParamsTypes

function TkwPopTreeNodeGetPrevSibling.GetPrevSibling(const aCtx: TtfwContext;
 aTreeNode: TTreeNode): TTreeNode;
 {* ���������� ����� ������� pop:TreeNode:GetPrevSibling }
//#UC START# *CBAF62383CA2_35C934477819_var*
//#UC END# *CBAF62383CA2_35C934477819_var*
begin
//#UC START# *CBAF62383CA2_35C934477819_impl*
 Result := aTreeNode.GetPrevSibling;
//#UC END# *CBAF62383CA2_35C934477819_impl*
end;//TkwPopTreeNodeGetPrevSibling.GetPrevSibling

procedure TkwPopTreeNodeGetPrevSibling.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_35C934477819_var*
//#UC END# *4DAEEDE10285_35C934477819_var*
begin
//#UC START# *4DAEEDE10285_35C934477819_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_35C934477819_impl*
end;//TkwPopTreeNodeGetPrevSibling.DoDoIt

class function TkwPopTreeNodeGetPrevSibling.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TreeNode:GetPrevSibling';
end;//TkwPopTreeNodeGetPrevSibling.GetWordNameForRegister

function TkwPopTreeNodeGetPrevSibling.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TTreeNode);
end;//TkwPopTreeNodeGetPrevSibling.GetResultTypeInfo

function TkwPopTreeNodeGetPrevSibling.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopTreeNodeGetPrevSibling.GetAllParamsCount

function TkwPopTreeNodeGetPrevSibling.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_35C934477819_var*
//#UC END# *5617F4D00243_35C934477819_var*
begin
//#UC START# *5617F4D00243_35C934477819_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_35C934477819_impl*
end;//TkwPopTreeNodeGetPrevSibling.ParamsTypes

function TkwPopTreeNodeGetNextVisible.GetNextVisible(const aCtx: TtfwContext;
 aTreeNode: TTreeNode): TTreeNode;
 {* ���������� ����� ������� pop:TreeNode:GetNextVisible }
//#UC START# *8DB4489FF36F_4D009DB53D61_var*
//#UC END# *8DB4489FF36F_4D009DB53D61_var*
begin
//#UC START# *8DB4489FF36F_4D009DB53D61_impl*
 Result := aTreeNode.GetNextVisible;
//#UC END# *8DB4489FF36F_4D009DB53D61_impl*
end;//TkwPopTreeNodeGetNextVisible.GetNextVisible

procedure TkwPopTreeNodeGetNextVisible.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4D009DB53D61_var*
//#UC END# *4DAEEDE10285_4D009DB53D61_var*
begin
//#UC START# *4DAEEDE10285_4D009DB53D61_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_4D009DB53D61_impl*
end;//TkwPopTreeNodeGetNextVisible.DoDoIt

class function TkwPopTreeNodeGetNextVisible.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TreeNode:GetNextVisible';
end;//TkwPopTreeNodeGetNextVisible.GetWordNameForRegister

function TkwPopTreeNodeGetNextVisible.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TTreeNode);
end;//TkwPopTreeNodeGetNextVisible.GetResultTypeInfo

function TkwPopTreeNodeGetNextVisible.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopTreeNodeGetNextVisible.GetAllParamsCount

function TkwPopTreeNodeGetNextVisible.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_4D009DB53D61_var*
//#UC END# *5617F4D00243_4D009DB53D61_var*
begin
//#UC START# *5617F4D00243_4D009DB53D61_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_4D009DB53D61_impl*
end;//TkwPopTreeNodeGetNextVisible.ParamsTypes

function TkwPopTreeNodeGetPrevVisible.GetPrevVisible(const aCtx: TtfwContext;
 aTreeNode: TTreeNode): TTreeNode;
 {* ���������� ����� ������� pop:TreeNode:GetPrevVisible }
//#UC START# *4529C267C83B_CA039569FA58_var*
//#UC END# *4529C267C83B_CA039569FA58_var*
begin
//#UC START# *4529C267C83B_CA039569FA58_impl*
 Result := aTreeNode.GetPrevVisible;
//#UC END# *4529C267C83B_CA039569FA58_impl*
end;//TkwPopTreeNodeGetPrevVisible.GetPrevVisible

procedure TkwPopTreeNodeGetPrevVisible.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_CA039569FA58_var*
//#UC END# *4DAEEDE10285_CA039569FA58_var*
begin
//#UC START# *4DAEEDE10285_CA039569FA58_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_CA039569FA58_impl*
end;//TkwPopTreeNodeGetPrevVisible.DoDoIt

class function TkwPopTreeNodeGetPrevVisible.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TreeNode:GetPrevVisible';
end;//TkwPopTreeNodeGetPrevVisible.GetWordNameForRegister

function TkwPopTreeNodeGetPrevVisible.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TTreeNode);
end;//TkwPopTreeNodeGetPrevVisible.GetResultTypeInfo

function TkwPopTreeNodeGetPrevVisible.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopTreeNodeGetPrevVisible.GetAllParamsCount

function TkwPopTreeNodeGetPrevVisible.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_CA039569FA58_var*
//#UC END# *5617F4D00243_CA039569FA58_var*
begin
//#UC START# *5617F4D00243_CA039569FA58_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_CA039569FA58_impl*
end;//TkwPopTreeNodeGetPrevVisible.ParamsTypes

procedure TkwPopTreeNodeExpand.Expand(const aCtx: TtfwContext;
 aTreeNode: TTreeNode;
 aRecurse: Boolean);
 {* ���������� ����� ������� pop:TreeNode:Expand }
//#UC START# *64F2C36D9582_53AEF2794BFD_var*
//#UC END# *64F2C36D9582_53AEF2794BFD_var*
begin
//#UC START# *64F2C36D9582_53AEF2794BFD_impl*
 aTreeNode.Expand(aRecurse);
//#UC END# *64F2C36D9582_53AEF2794BFD_impl*
end;//TkwPopTreeNodeExpand.Expand

procedure TkwPopTreeNodeExpand.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53AEF2794BFD_var*
//#UC END# *4DAEEDE10285_53AEF2794BFD_var*
begin
//#UC START# *4DAEEDE10285_53AEF2794BFD_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_53AEF2794BFD_impl*
end;//TkwPopTreeNodeExpand.DoDoIt

class function TkwPopTreeNodeExpand.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TreeNode:Expand';
end;//TkwPopTreeNodeExpand.GetWordNameForRegister

function TkwPopTreeNodeExpand.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiVoid;
end;//TkwPopTreeNodeExpand.GetResultTypeInfo

function TkwPopTreeNodeExpand.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopTreeNodeExpand.GetAllParamsCount

function TkwPopTreeNodeExpand.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_53AEF2794BFD_var*
//#UC END# *5617F4D00243_53AEF2794BFD_var*
begin
//#UC START# *5617F4D00243_53AEF2794BFD_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_53AEF2794BFD_impl*
end;//TkwPopTreeNodeExpand.ParamsTypes

initialization
 TkwPopTreeNodeGetNext.RegisterInEngine;
 {* ����������� pop_TreeNode_GetNext }
 TkwPopTreeNodeHasChildren.RegisterInEngine;
 {* ����������� pop_TreeNode_HasChildren }
 TkwPopTreeNodeGetPrev.RegisterInEngine;
 {* ����������� pop_TreeNode_GetPrev }
 TkwPopTreeNodeGetFirstChild.RegisterInEngine;
 {* ����������� pop_TreeNode_GetFirstChild }
 TkwPopTreeNodeGetLastChild.RegisterInEngine;
 {* ����������� pop_TreeNode_GetLastChild }
 TkwPopTreeNodeGetNextSibling.RegisterInEngine;
 {* ����������� pop_TreeNode_GetNextSibling }
 TkwPopTreeNodeGetPrevSibling.RegisterInEngine;
 {* ����������� pop_TreeNode_GetPrevSibling }
 TkwPopTreeNodeGetNextVisible.RegisterInEngine;
 {* ����������� pop_TreeNode_GetNextVisible }
 TkwPopTreeNodeGetPrevVisible.RegisterInEngine;
 {* ����������� pop_TreeNode_GetPrevVisible }
 TkwPopTreeNodeExpand.RegisterInEngine;
 {* ����������� pop_TreeNode_Expand }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TTreeNode));
 {* ����������� ���� TTreeNode }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
 {* ����������� ���� Boolean }
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

end.
