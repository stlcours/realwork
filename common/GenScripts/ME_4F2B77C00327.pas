unit evTableTools;
 {* ������ �������� ����������� ��� ������ � ���������. }

// ������: "w:\common\components\gui\Garant\Everest\evTableTools.pas"
// ���������: "UtilityPack"
// ������� ������: "evTableTools" MUID: (4F2B77C00327)

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
 l3IntfUses
 , nevTools
 , evEditorInterfaces
 , l3Interfaces
;

{$If NOT Defined(Nemesis)}
function evMakeTableRegular(const aRange: IedRange;
 const aProgress: Il3Progress = nil): Boolean; overload;
 {* ������ ������� "����������" ���������, �.�. ��������� ������ �����. }
{$IfEnd} // NOT Defined(Nemesis)
{$If NOT Defined(Nemesis)}
function evTable_FixNSRCWidth(const aRange: IedRange;
 aWidth: LongInt = 0): Boolean; overload;
 {* ������������� ������ ������� ������� ��� ������� � NSRC. }
{$IfEnd} // NOT Defined(Nemesis)
{$If NOT Defined(Nemesis)}
function evTable_FixNSRCWidth(const aColumnsIterator: IedColumnsIterator;
 aWidth: LongInt = 0): Boolean; overload;
{$IfEnd} // NOT Defined(Nemesis)
{$If NOT Defined(Nemesis)}
function evTable_FixNSRCWidth(const aColumn: IedColumn;
 aWidth: LongInt = 0): Boolean; overload;
{$IfEnd} // NOT Defined(Nemesis)
{$If NOT Defined(Nemesis)}
function evMakeTableRegular(const aTable: IedTable;
 aSeparateOp: Boolean;
 const aProgress: Il3Progress = nil): Boolean; overload;
{$IfEnd} // NOT Defined(Nemesis)
function evTable_GetNeighbour(const aView: InevView;
 const aCell: InevPara;
 anUp: TevNeighbourPos): InevPara;

implementation

uses
 l3ImplUses
 , k2Tags
 , l3Variant
 , k2Interfaces
 , l3CustomString
 , evCellsWidthCorrecter
 , l3Base
 , evMsgCode
 , afwFacade
 , k2Op
 , evExcept
 , l3MinMax
 , l3String
 , l3Chars
 , l3UnitsTools
 , l3InterfacesMisc
 {$If Defined(k2ForEditor)}
 , evTableCellUtils
 {$IfEnd} // Defined(k2ForEditor)
 , evOp
 , evConst
 , nevFacade
;

{$If NOT Defined(Nemesis)}
function evTable_CalculateNSRCWidth(const aColumn: IedColumn;
 out theWidth: LongInt): Boolean;
 {* ��������� ������ ������� ������� ��� ������� � NSRC. }
//#UC START# *4F2B7DD502A3_4F2B77C00327_var*
var
 l_MaxWidth : LongInt;
 l_CellGap  : LongInt;

 function lp_CheckPara(aPara: Tl3Variant; Index: LongInt): Boolean; 
 var
  l_Text : Tl3CustomString;
 begin
  Result := true;
  with aPara.Attr[k2_tiText] do
   if IsValid then
    l_Text := AsObject As Tl3CustomString
   else
    l_Text := nil;
  if not l_Text.Empty then
   with l_Text do
   begin
    if not l3CharSetPresent(St, Len, cc_ANSILetter) then
    begin
     l_MaxWidth := Max(l_MaxWidth, evChar2Inch(Len) + l_CellGap);
     evTable_CalculateNSRCWidth := true;
    end;//l3CountOfChar..
   end;//not l_Text.Empty
 end;
                                         
var
 l_CellsIterator : IedCellsIterator;
 l_Cell          : IedCell;
//#UC END# *4F2B7DD502A3_4F2B77C00327_var*
begin
//#UC START# *4F2B7DD502A3_4F2B77C00327_impl*
 Result := false;
 if (aColumn <> nil) then begin
  l_CellsIterator := aColumn.CellsIterator;
  if (l_CellsIterator <> nil) then
   try
    l_MaxWidth := 0;
    l_Cell := l_CellsIterator.First(False);
    while (l_Cell <> nil) do
    begin
       with l_Cell.AsObject do
       begin
        l_CellGap := IntA[k2_tiLeftIndent];
        Inc(l_CellGap, IntA[k2_tiRightIndent]);
        if (aColumn.ID = 0) then
         Inc(l_CellGap, evChar2Inch(1));
        IterateChildrenF(L2Mk2ChildrenIterateChildrenFAction(@lp_CheckPara));
       end;//with l_TagWrap
       theWidth := l_MaxWidth;
     l_Cell := l_CellsIterator.Next;
    end;//l_Cell <> nil
   finally
    l_CellsIterator := nil;
   end;//try..finally
 end;//aColumn <> nil 
//#UC END# *4F2B7DD502A3_4F2B77C00327_impl*
end;//evTable_CalculateNSRCWidth
{$IfEnd} // NOT Defined(Nemesis)

{$If NOT Defined(Nemesis)}
procedure evCheckTableRegular(const aTable: IedTable);
//#UC START# *4F2BBCB400BF_4F2B77C00327_var*
var
 l_Iterator    : IedColumnsIterator;
 l_Column      : IedColumn;
 l_Width       : Integer;
 l_MakeRegular : Boolean;
//#UC END# *4F2BBCB400BF_4F2B77C00327_var*
begin
//#UC START# *4F2BBCB400BF_4F2B77C00327_impl*
 l_Iterator := aTable.ColumnsIterator;
 if (l_Iterator = nil) then
  l_Column := aTable.Column
 else
  l_Column := l_Iterator.First;
 l_MakeRegular := False;
 while (l_Column <> nil) do
 begin
  l_Width := l_Column.Width;
  l_Width := evCheckCellWidth(l_Width, True);
  if l_Width <> l_Column.Width then
  begin
   l_MakeRegular := True;
   Break;
  end; // if l_Width <> l_Column.Width then
  if (l_Iterator = nil) then
   l_Column := nil
  else
   l_Column := l_Iterator.Next;
 end;//while (l_Column <> nil)
 if l_MakeRegular then
  evMakeTableRegular(aTable, False);
//#UC END# *4F2BBCB400BF_4F2B77C00327_impl*
end;//evCheckTableRegular
{$IfEnd} // NOT Defined(Nemesis)

{$If NOT Defined(Nemesis)}
function evMakeTableRegular(const aRange: IedRange;
 const aProgress: Il3Progress = nil): Boolean;
 {* ������ ������� "����������" ���������, �.�. ��������� ������ �����. }
//#UC START# *4F2B77FD0024_4F2B77C00327_var*
//#UC END# *4F2B77FD0024_4F2B77C00327_var*
begin
//#UC START# *4F2B77FD0024_4F2B77C00327_impl*
 if (aRange = nil) then
  Result := False
 else
  Result := evMakeTableRegular(aRange.Table, True, aProgress);
//#UC END# *4F2B77FD0024_4F2B77C00327_impl*
end;//evMakeTableRegular
{$IfEnd} // NOT Defined(Nemesis)

{$If NOT Defined(Nemesis)}
function evTable_FixNSRCWidth(const aRange: IedRange;
 aWidth: LongInt = 0): Boolean;
 {* ������������� ������ ������� ������� ��� ������� � NSRC. }
//#UC START# *4F2B781C0164_4F2B77C00327_var*
var
 l_Table : IedTable;

 function lp_CalcColumnMaxWidth: Integer;
 var
  l_Row     : IedRow;
  l_Cell    : IedCell;
  l_Iterator: IedCellsIterator;
 begin
  Result := 0;
  l_Row := l_Table.RowsIterator.First;
  l_Iterator := l_Row.CellsIterator;
  l_Cell := l_Iterator.First(False);
  while (l_Cell <> nil) do
  begin
   Inc(Result, l_Cell.Width);
   l_Cell := l_Iterator.Next;
  end; // while (l_Column <> nil) do
  Result := Result div 2;
 end;

//#UC END# *4F2B781C0164_4F2B77C00327_var*
begin
//#UC START# *4F2B781C0164_4F2B77C00327_impl*
 Result := false;
 if (aRange <> nil) then
 begin
  l_Table := aRange.Table;
  if (l_Table <> nil) then
  begin
   if aWidth > lp_CalcColumnMaxWidth then
    raise EevTooLargeColumnWidth.Create(ev_errTooLargeColumnWidth);
   evCheckTableRegular(l_Table);
   Result := evTable_FixNSRCWidth(l_Table.Column, aWidth);
   if not Result then
    Result := evTable_FixNSRCWidth(l_Table.ColumnsIterator, aWidth);
  end;//l_Table <> nil
 end;//aRange <> nil
//#UC END# *4F2B781C0164_4F2B77C00327_impl*
end;//evTable_FixNSRCWidth
{$IfEnd} // NOT Defined(Nemesis)

{$If NOT Defined(Nemesis)}
function evTable_FixNSRCWidth(const aColumnsIterator: IedColumnsIterator;
 aWidth: LongInt = 0): Boolean;
//#UC START# *4F2BBD58017D_4F2B77C00327_var*
var
 l_Column : IedColumn;
 l_Op     : InevOp;
//#UC END# *4F2BBD58017D_4F2B77C00327_var*
begin
//#UC START# *4F2BBD58017D_4F2B77C00327_impl*
 Result := False;
 if (aColumnsIterator <> nil) then
 begin
  l_Op := aColumnsIterator.Processor.StartOp;
  try
   l_Column := aColumnsIterator.First;
   while (l_Column <> nil) do
   begin
    if evTable_FixNSRCWidth(l_Column, aWidth) then
     Result := true;
    l_Column := aColumnsIterator.Next;
   end;//while (l_Column <> nil)
  finally
   l_Op := nil;
  end;
 end;//aColumnsIterator <> nil
//#UC END# *4F2BBD58017D_4F2B77C00327_impl*
end;//evTable_FixNSRCWidth
{$IfEnd} // NOT Defined(Nemesis)

{$If NOT Defined(Nemesis)}
function evTable_FixNSRCWidth(const aColumn: IedColumn;
 aWidth: LongInt = 0): Boolean;
//#UC START# *4F2BBD9400E2_4F2B77C00327_var*
var
 l_Width : LongInt;
//#UC END# *4F2BBD9400E2_4F2B77C00327_var*
begin
//#UC START# *4F2BBD9400E2_4F2B77C00327_impl*
 if (aWidth = 0) then
  Result := evTable_CalculateNSRCWidth(aColumn, l_Width)
 else
 begin
  if (aColumn = nil) then
   Result := False
  else
  begin
   Result := True;
   Inc(aWidth);
   l_Width := evChar2Inch(aWidth);
  end;//aColumn = nil
 end;//aWidth = 0
 if Result then
  aColumn.Width := l_Width;
//#UC END# *4F2BBD9400E2_4F2B77C00327_impl*
end;//evTable_FixNSRCWidth
{$IfEnd} // NOT Defined(Nemesis)

{$If NOT Defined(Nemesis)}
function evMakeTableRegular(const aTable: IedTable;
 aSeparateOp: Boolean;
 const aProgress: Il3Progress = nil): Boolean;
//#UC START# *4F2BBFAC0192_4F2B77C00327_var*
//#UC END# *4F2BBFAC0192_4F2B77C00327_var*
begin
//#UC START# *4F2BBFAC0192_4F2B77C00327_impl*
 Result := TevCellsWidthCorrecter.DoCorrection(aTable, nil, aSeparateOp, aProgress);
//#UC END# *4F2BBFAC0192_4F2B77C00327_impl*
end;//evMakeTableRegular
{$IfEnd} // NOT Defined(Nemesis)

function evTable_GetNeighbour(const aView: InevView;
 const aCell: InevPara;
 anUp: TevNeighbourPos): InevPara;
//#UC START# *4F2BC0450156_4F2B77C00327_var*
var
 l_RowCursor  : InevBasePoint;
 l_Op         : LongInt;
 l_Point      : InevBasePoint;
 l_CellCursor : InevBasePoint; 
//#UC END# *4F2BC0450156_4F2B77C00327_var*
begin
//#UC START# *4F2BC0450156_4F2B77C00327_impl*
 Result := nev.NullPara;
 if aCell = nil then Exit;
 l_Point := aCell.MakePoint.PointToParent(aCell.OwnerPara.OwnerPara);
 try
  l_RowCursor := l_Point.Inner;
  if (anUp = ev_npUp) then
  begin
   if (l_Point.Position <= 1) then Exit;
   //���� ����������� ��������� ����...
   l_Op := ev_ocParaUp;
  end//anUp = ev_npUp
  else
  begin
   if (l_Point.Position >= l_Point.Obj.AsObject.ChildrenCount) then Exit;
   if not l_RowCursor.Inner.Move(aView, ev_ocBottomRight) then Exit;
   //���� ����������� ���������� ����...
   if (anUp = ev_npDown) then
    l_Op := ev_ocParaDown
   else
    l_Op := ev_ocNextPara;
  end;//anUp
  l_CellCursor := l_RowCursor.Inner;
  if l_CellCursor.Move(aView, l_Op) then
  begin
   if l_Point.Inner.HasInner then
   begin
    Result := l_Point.Inner.Inner.Obj.AsPara;
    if Result.AsObject.IsValid then
    begin
     if (Abs(aCell.AsObject.IntA[k2_tiWidth] -
             Result.AsObject.IntA[k2_tiWidth]) > 2 * evEpsilon) then
     begin
      Result := nev.NullPara;
      Exit;
     end;//Abs(aCell.IntA[k2_tiWidth]
    end;//anExact
   end;//l_Point.Inner.Inner
  end;//evMoveCursor(..
 finally
  l_Point := nil;
 end;//try..finally
//#UC END# *4F2BC0450156_4F2B77C00327_impl*
end;//evTable_GetNeighbour

end.
