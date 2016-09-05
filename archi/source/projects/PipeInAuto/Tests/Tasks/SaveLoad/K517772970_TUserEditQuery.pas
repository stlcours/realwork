unit K517772970_TUserEditQuery;
 {* [RequestLink:517772970] }

// ������: "w:\archi\source\projects\PipeInAuto\Tests\Tasks\SaveLoad\K517772970_TUserEditQuery.pas"
// ���������: "TestCase"
// ������� ������: "K517772970_TUserEditQuery" MUID: (53214EEB036D)
// ��� ����: "TK517772970_TUserEditQuery"

{$Include w:\archi\source\projects\PipeInAuto\alcuDefine.inc}

interface

{$If Defined(AppServerSide) AND Defined(InsiderTest)}
uses
 l3IntfUses
 , K517772970_TddProcessTask
 {$If NOT Defined(Nemesis)}
 , ddServerTask
 {$IfEnd} // NOT Defined(Nemesis)
;

type
 TK517772970_TUserEditQuery = class(TK517772970_TddProcessTask)
  {* [RequestLink:517772970] }
  protected
   function TaskClass: TddTaskClass; override;
   procedure InitTask(Task: TddTaskItem); override;
   {$If Defined(nsTest)}
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   {$IfEnd} // Defined(nsTest)
   {$If Defined(nsTest)}
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
   {$IfEnd} // Defined(nsTest)
 end;//TK517772970_TUserEditQuery
{$IfEnd} // Defined(AppServerSide) AND Defined(InsiderTest)

implementation

{$If Defined(AppServerSide) AND Defined(InsiderTest)}
uses
 l3ImplUses
 {$If NOT Defined(Nemesis)}
 , csServerTaskTypes
 {$IfEnd} // NOT Defined(Nemesis)
 {$If Defined(nsTest)}
 , TestFrameWork
 {$IfEnd} // Defined(nsTest)
 //#UC START# *53214EEB036Dimpl_uses*
 //#UC END# *53214EEB036Dimpl_uses*
;

function TK517772970_TUserEditQuery.TaskClass: TddTaskClass;
//#UC START# *5320088202FB_53214EEB036D_var*
//#UC END# *5320088202FB_53214EEB036D_var*
begin
//#UC START# *5320088202FB_53214EEB036D_impl*
 result := TUserEditQuery;
//#UC END# *5320088202FB_53214EEB036D_impl*
end;//TK517772970_TUserEditQuery.TaskClass

procedure TK517772970_TUserEditQuery.InitTask(Task: TddTaskItem);
//#UC START# *532008D203BA_53214EEB036D_var*
const
 IntConst = 123;
//#UC END# *532008D203BA_53214EEB036D_var*
begin
//#UC START# *532008D203BA_53214EEB036D_impl*
 inherited InitTask(Task);
 with (Task as TUserEditQuery) do begin
  IsGroup := true;
  ID := IntConst;
 end;
//#UC END# *532008D203BA_53214EEB036D_impl*
end;//TK517772970_TUserEditQuery.InitTask

{$If Defined(nsTest)}
function TK517772970_TUserEditQuery.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TaskSaveLoad';
end;//TK517772970_TUserEditQuery.GetFolder
{$IfEnd} // Defined(nsTest)

{$If Defined(nsTest)}
function TK517772970_TUserEditQuery.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '53214EEB036D';
end;//TK517772970_TUserEditQuery.GetModelElementGUID
{$IfEnd} // Defined(nsTest)

initialization
 TestFramework.RegisterTest(TK517772970_TUserEditQuery.Suite);
{$IfEnd} // Defined(AppServerSide) AND Defined(InsiderTest)

end.
