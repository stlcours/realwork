unit k2SortTagsList;

// ������: "w:\common\components\rtl\Garant\K2\k2SortTagsList.pas"
// ���������: "SimpleClass"
// ������� ������: "Tk2SortTagsList" MUID: (4DDA76400330)

{$Include w:\common\components\rtl\Garant\K2\k2Define.inc}

interface

uses
 l3IntfUses
 , k2SortTagsListPrim
;

type
 Tk2SortTagsList = class(Tk2SortTagsListPrim)
  public
   class function Instance: Tk2SortTagsList;
    {* ����� ��������� ���������� ���������� Tk2SortTagsList }
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
 end;//Tk2SortTagsList

implementation

uses
 l3ImplUses
 , SysUtils
 , l3Base
 //#UC START# *4DDA76400330impl_uses*
 //#UC END# *4DDA76400330impl_uses*
;

var g_Tk2SortTagsList: Tk2SortTagsList = nil;
 {* ��������� ���������� Tk2SortTagsList }

procedure Tk2SortTagsListFree;
 {* ����� ������������ ���������� ���������� Tk2SortTagsList }
begin
 l3Free(g_Tk2SortTagsList);
end;//Tk2SortTagsListFree

class function Tk2SortTagsList.Instance: Tk2SortTagsList;
 {* ����� ��������� ���������� ���������� Tk2SortTagsList }
begin
 if (g_Tk2SortTagsList = nil) then
 begin
  l3System.AddExitProc(Tk2SortTagsListFree);
  g_Tk2SortTagsList := Create;
 end;
 Result := g_Tk2SortTagsList;
end;//Tk2SortTagsList.Instance

class function Tk2SortTagsList.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_Tk2SortTagsList <> nil;
end;//Tk2SortTagsList.Exists

end.
