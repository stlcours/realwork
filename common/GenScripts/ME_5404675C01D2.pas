unit NOT_FINISHED_alcuRegionAutoExportTask;

// ������: "w:\archi\source\projects\PipeInAuto\Tasks\NOT_FINISHED_alcuRegionAutoExportTask.pas"
// ���������: "SimpleClass"
// ������� ������: "TalcuRegionAutoExportTask" MUID: (5404675C01D2)

{$Include w:\archi\source\projects\PipeInAuto\alcuDefine.inc}

interface

{$If Defined(ServerTasks)}
uses
 l3IntfUses
 , alcuRegionAutoExportTaskPrim
;

type
 TalcuRegionAutoExportTask = class(TalcuRegionAutoExportTaskPrim)
 end;//TalcuRegionAutoExportTask
{$IfEnd} // Defined(ServerTasks)

implementation

{$If Defined(ServerTasks)}
uses
 l3ImplUses
 , alcuFTPBrowser
 , alcuFTPBrowserParams
;
{$IfEnd} // Defined(ServerTasks)

end.
