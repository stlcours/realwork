unit csTaskChangeHelper;

// ������: "w:\common\components\rtl\Garant\cs\csTaskChangeHelper.pas"
// ���������: "Service"

{$Include w:\common\components\rtl\Garant\cs\CsDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , l3ProtoObject
;

 (*
 McsTaskChangeHelper = interface
  {* �������� ������� TcsTaskChangeHelper }
  procedure TaskGotErrorStatus;
 end;//McsTaskChangeHelper
 *)

type
 IcsTaskChangeHelper = interface
  {* ��������� ������� TcsTaskChangeHelper }
  ['{9337EC2E-743E-421E-994C-15DEC812DC61}']
  procedure TaskGotErrorStatus;
 end;//IcsTaskChangeHelper

 TcsTaskChangeHelper = {final} class(Tl3ProtoObject)
  private
   f_Alien: IcsTaskChangeHelper;
    {* ���� ��� �������� Alien }
  protected
   procedure pm_SetAlien(const aValue: IcsTaskChangeHelper);
   procedure ClearFields; override;
  public
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
   procedure TaskGotErrorStatus;
   class function Instance: TcsTaskChangeHelper;
    {* ����� ��������� ���������� ���������� TcsTaskChangeHelper }
  public
   property Alien: IcsTaskChangeHelper
    write pm_SetAlien;
    {* ������� ���������� ������� IcsTaskChangeHelper }
 end;//TcsTaskChangeHelper
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
 , SysUtils
 , l3Base
;

var g_TcsTaskChangeHelper: TcsTaskChangeHelper = nil;
 {* ��������� ���������� TcsTaskChangeHelper }

procedure TcsTaskChangeHelperFree;
 {* ����� ������������ ���������� ���������� TcsTaskChangeHelper }
begin
 l3Free(g_TcsTaskChangeHelper);
end;//TcsTaskChangeHelperFree

procedure TcsTaskChangeHelper.pm_SetAlien(const aValue: IcsTaskChangeHelper);
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//TcsTaskChangeHelper.pm_SetAlien

class function TcsTaskChangeHelper.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TcsTaskChangeHelper <> nil;
end;//TcsTaskChangeHelper.Exists

procedure TcsTaskChangeHelper.TaskGotErrorStatus;
//#UC START# *F75B4443B80B_5583BE960064_var*
//#UC END# *F75B4443B80B_5583BE960064_var*
begin
//#UC START# *F75B4443B80B_5583BE960064_impl*
 if Assigned(f_Alien) then
  f_Alien.TaskGotErrorStatus;
//#UC END# *F75B4443B80B_5583BE960064_impl*
end;//TcsTaskChangeHelper.TaskGotErrorStatus

class function TcsTaskChangeHelper.Instance: TcsTaskChangeHelper;
 {* ����� ��������� ���������� ���������� TcsTaskChangeHelper }
begin
 if (g_TcsTaskChangeHelper = nil) then
 begin
  l3System.AddExitProc(TcsTaskChangeHelperFree);
  g_TcsTaskChangeHelper := Create;
 end;
 Result := g_TcsTaskChangeHelper;
end;//TcsTaskChangeHelper.Instance

procedure TcsTaskChangeHelper.ClearFields;
begin
 Alien := nil;
 inherited;
end;//TcsTaskChangeHelper.ClearFields
{$IfEnd} // NOT Defined(Nemesis)

end.
