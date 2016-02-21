unit K517772970_TcsAutoAnnoExport;
 {* [RequestLink:517772970] }

// ������: "w:\archi\source\projects\PipeInAuto\Tests\Tasks\SaveLoad\K517772970_TcsAutoAnnoExport.pas"
// ���������: "TestCase"

{$Include w:\archi\source\projects\PipeInAuto\alcuDefine.inc}

interface

{$If Defined(AppServerSide) AND Defined(InsiderTest)}
uses
 l3IntfUses
 , K517772970_TcsExport
 {$If NOT Defined(Nemesis)}
 , ddServerTask
 {$IfEnd} // NOT Defined(Nemesis)
;

type
 TK517772970_TcsAutoAnnoExport = class(TK517772970_TcsExport)
  {* [RequestLink:517772970] }
  protected
   {$If Defined(nsTest)}
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   {$IfEnd} // Defined(nsTest)
   {$If Defined(nsTest)}
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
   {$IfEnd} // Defined(nsTest)
   function TaskClass: TddTaskClass; override;
 end;//TK517772970_TcsAutoAnnoExport
{$IfEnd} // Defined(AppServerSide) AND Defined(InsiderTest)

implementation

{$If Defined(AppServerSide) AND Defined(InsiderTest)}
uses
 l3ImplUses
 {$If NOT Defined(Nemesis)}
 , csAutoAnnoExport
 {$IfEnd} // NOT Defined(Nemesis)
 {$If Defined(nsTest)}
 , TestFrameWork
 {$IfEnd} // Defined(nsTest)
;

{$If Defined(nsTest)}
function TK517772970_TcsAutoAnnoExport.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TaskSaveLoad';
end;//TK517772970_TcsAutoAnnoExport.GetFolder
{$IfEnd} // Defined(nsTest)

{$If Defined(nsTest)}
function TK517772970_TcsAutoAnnoExport.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '53217E7F02A0';
end;//TK517772970_TcsAutoAnnoExport.GetModelElementGUID
{$IfEnd} // Defined(nsTest)

function TK517772970_TcsAutoAnnoExport.TaskClass: TddTaskClass;
//#UC START# *5320088202FB_53217E7F02A0_var*
//#UC END# *5320088202FB_53217E7F02A0_var*
begin
//#UC START# *5320088202FB_53217E7F02A0_impl*
 result := TcsAutoAnnoExport;
//#UC END# *5320088202FB_53217E7F02A0_impl*
end;//TK517772970_TcsAutoAnnoExport.TaskClass

initialization
 TestFramework.RegisterTest(TK517772970_TcsAutoAnnoExport.Suite);
{$IfEnd} // Defined(AppServerSide) AND Defined(InsiderTest)

end.
