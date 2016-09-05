unit nsDocumentContextHistory;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\rtl\Garant\ContextHistory\nsDocumentContextHistory.pas"
// ���������: "SimpleClass"
// ������� ������: "TnsDocumentContextHistory" MUID: (4AD8466301A3)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin)}
uses
 l3IntfUses
 , nsDocumentContextHistoryPrim
 , ContextHistoryInterfaces
;

type
 TnsDocumentContextHistory = class(TnsDocumentContextHistoryPrim)
  public
   class function Make: InsContextSearchHistory; reintroduce;
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
 end;//TnsDocumentContextHistory
{$IfEnd} // NOT Defined(Admin)

implementation

{$If NOT Defined(Admin)}
uses
 l3ImplUses
 , SysUtils
 , l3Base
 //#UC START# *4AD8466301A3impl_uses*
 //#UC END# *4AD8466301A3impl_uses*
;

var g_TnsDocumentContextHistory: Pointer = nil;
 {* ��������� ���������� TnsDocumentContextHistory }

procedure TnsDocumentContextHistoryFree;
 {* ����� ������������ ���������� ���������� TnsDocumentContextHistory }
begin
 IUnknown(g_TnsDocumentContextHistory) := nil;
end;//TnsDocumentContextHistoryFree

class function TnsDocumentContextHistory.Make: InsContextSearchHistory;
begin
 if (g_TnsDocumentContextHistory = nil) then
 begin
  l3System.AddExitProc(TnsDocumentContextHistoryFree);
  InsContextSearchHistory(g_TnsDocumentContextHistory) := inherited Make;
 end;
 Result := InsContextSearchHistory(g_TnsDocumentContextHistory);
end;//TnsDocumentContextHistory.Make

class function TnsDocumentContextHistory.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TnsDocumentContextHistory <> nil;
end;//TnsDocumentContextHistory.Exists
{$IfEnd} // NOT Defined(Admin)

end.
