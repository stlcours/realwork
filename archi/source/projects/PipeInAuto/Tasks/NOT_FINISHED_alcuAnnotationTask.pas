unit NOT_FINISHED_alcuAnnotationTask;

// ������: "w:\archi\source\projects\PipeInAuto\Tasks\NOT_FINISHED_alcuAnnotationTask.pas"
// ���������: "SimpleClass"
// ������� ������: "TalcuAnnotationTask" MUID: (531705AC001C)

{$Include w:\archi\source\projects\PipeInAuto\alcuDefine.inc}

interface

{$If Defined(ServerTasks)}
uses
 l3IntfUses
 {$If NOT Defined(Nemesis)}
 , csAnnotationTask
 {$IfEnd} // NOT Defined(Nemesis)
;

type
 TalcuAnnotationTask = class({$If NOT Defined(Nemesis)}
 TcsAnnotationTask
 {$IfEnd} // NOT Defined(Nemesis)
 )
 end;//TalcuAnnotationTask
{$IfEnd} // Defined(ServerTasks)

implementation

{$If Defined(ServerTasks)}
uses
 l3ImplUses
 , alcuAnnotationTaskResult
 //#UC START# *531705AC001Cimpl_uses*
 //#UC END# *531705AC001Cimpl_uses*
;

{$If NOT Defined(Nemesis)}
{$IfEnd} // NOT Defined(Nemesis)
{$IfEnd} // Defined(ServerTasks)
end.
