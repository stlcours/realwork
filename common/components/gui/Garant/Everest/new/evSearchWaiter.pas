unit evSearchWaiter;

// ������: "w:\common\components\gui\Garant\Everest\new\evSearchWaiter.pas"
// ���������: "SimpleClass"
// ������� ������: "TevSearchWaiter" MUID: (4EA6A47C0260)

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
 l3IntfUses
 , l3Tool
 , nevTools
 , l3Variant
;

type
 TevSearchWaiter = class(Tl3Tool, InevWaiter)
  private
   f_Searcher: IevSearcher;
   f_FoundBlock: InevDataObjectPrim2;
   f_WasFound: Boolean;
   f_ChildPara: Tl3Variant;
  protected
   function TrySelect(const aContainer: InevDocumentContainer): Boolean;
   function TrySelectObj(const aContainer: InevDocumentContainer;
    aParent: Tl3Variant;
    aChild: Tl3Variant): Boolean;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
  public
   constructor Create(const aControl: InevControl;
    const aSearcher: IevSearcher); reintroduce;
   class function Make(const aControl: InevControl;
    const aSearcher: IevSearcher): InevWaiter;
 end;//TevSearchWaiter

implementation

uses
 l3ImplUses
 , l3Interfaces
 , l3Base
 , SysUtils
 , LeafPara_Const
 , evdInterfaces
 {$If Defined(k2ForEditor)}
 , evParaTools
 {$IfEnd} // Defined(k2ForEditor)
 , k2Tags
 //#UC START# *4EA6A47C0260impl_uses*
 //#UC END# *4EA6A47C0260impl_uses*
;

constructor TevSearchWaiter.Create(const aControl: InevControl;
 const aSearcher: IevSearcher);
//#UC START# *4EA6A573010B_4EA6A47C0260_var*
//#UC END# *4EA6A573010B_4EA6A47C0260_var*
begin
//#UC START# *4EA6A573010B_4EA6A47C0260_impl*
 inherited Create(aControl As Il3ToolOwner);
 f_Searcher := aSearcher;
 f_FoundBlock := nil;
 f_WasFound := False;
 f_ChildPara := nil;
//#UC END# *4EA6A573010B_4EA6A47C0260_impl*
end;//TevSearchWaiter.Create

class function TevSearchWaiter.Make(const aControl: InevControl;
 const aSearcher: IevSearcher): InevWaiter;
//#UC START# *4EA6A5C500A2_4EA6A47C0260_var*
var
 l_Waiter : TevSearchWaiter;
//#UC END# *4EA6A5C500A2_4EA6A47C0260_var*
begin
//#UC START# *4EA6A5C500A2_4EA6A47C0260_impl*
 l_Waiter := Create(aControl, aSearcher);
 try
  Result := l_Waiter;
 finally
  l3Free(l_Waiter);
 end;//try..finally
//#UC END# *4EA6A5C500A2_4EA6A47C0260_impl*
end;//TevSearchWaiter.Make

function TevSearchWaiter.TrySelect(const aContainer: InevDocumentContainer): Boolean;
//#UC START# *47C6B3040133_4EA6A47C0260_var*
var
 l_Sel     : InevSelection;
 l_Para    : InevPara;
 l_NewPt   : InevPoint;
 l_Start   : InevBasePoint;
 l_Finish  : InevBasePoint;
 l_NewSel  : InevRange;
 l_Control : InevControl;
//#UC END# *47C6B3040133_4EA6A47C0260_var*
begin
//#UC START# *47C6B3040133_4EA6A47C0260_impl*
 if (f_Owner = nil) then
 // - ��� ��� ����� �� ���� �����������������
  Result := True
 else
  if f_FoundBlock <> nil then
  begin
   l_Control := (IUnknown(f_Owner) As InevControl);
   l_Sel := l_Control.Selection;
   if (l_Sel = nil) then
    Result := False
   else
   begin
    if (f_ChildPara <> nil) and f_ChildPara.QT(InevObject, l_Para) then
    begin
     l_NewPt := l_Para.OwnerPara.MakePoint;
     l_NewPt.SetEntryPoint(l_Para.PID + 1);
     l_Start := l_NewPt.ClonePoint(l_Control.View).Inner;
     l_Start.SetEntryPoint(f_FoundBlock.Borders.rStart);
     l_Start := l_Start.PointToParent;
     l_Finish := l_NewPt.ClonePoint(l_Control.View).Inner;
     l_Finish.SetEntryPoint(f_FoundBlock.Borders.rFinish);
     l_Finish := l_Finish.PointToParent;
     l_NewSel := l_Sel.GetBlock;
     (l_NewSel as InevRangeFactory).Init(l_Start, l_Finish);
     l_Sel.Select(l_NewSel, false);
    end; // if l_Handle > 0 then
    Result := True;
   end;
  end;
//#UC END# *47C6B3040133_4EA6A47C0260_impl*
end;//TevSearchWaiter.TrySelect

function TevSearchWaiter.TrySelectObj(const aContainer: InevDocumentContainer;
 aParent: Tl3Variant;
 aChild: Tl3Variant): Boolean;
//#UC START# *47C6B30F0277_4EA6A47C0260_var*

var
 l_Sel        : InevSelection;
 l_Para       : InevObject;
 l_OutPara    : InevObject;
 l_FoundBlock : IevdDataObject;
//#UC END# *47C6B30F0277_4EA6A47C0260_var*
begin
//#UC START# *47C6B30F0277_4EA6A47C0260_impl*
 Result := False;
 if (f_Owner = nil) then
 // - ��� ��� ����� �� ���� �����������������
  Result := True
 else
 begin
  Result := False;
  if not f_WasFound and (f_Searcher <> nil) AND aChild.IsKindOf(k2_typLeafPara) then
   if aChild.QT(InevObject, l_Para) then
    try
     if evSearchPara(l_Para, f_Searcher, l_OutPara, False, @l_FoundBlock) then
     begin
      f_ChildPara := aChild;
      f_FoundBlock := l_FoundBlock As InevDataObjectPrim2;
      f_WasFound := True;
     end; // if evSearchPara(l_Para, f_Searcher, l_OutPara, False, @l_FoundBlock) then
    finally
     l_Para := nil;
    end//try..finally
   else
    Assert(false);
 end;   
//#UC END# *47C6B30F0277_4EA6A47C0260_impl*
end;//TevSearchWaiter.TrySelectObj

procedure TevSearchWaiter.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_4EA6A47C0260_var*
//#UC END# *479731C50290_4EA6A47C0260_var*
begin
//#UC START# *479731C50290_4EA6A47C0260_impl*
 f_Searcher := nil;
 f_FoundBlock := nil;
 f_WasFound := False;
 f_ChildPara := nil;
 inherited;
//#UC END# *479731C50290_4EA6A47C0260_impl*
end;//TevSearchWaiter.Cleanup

end.
