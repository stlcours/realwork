unit NOT_FINISHED_alcuMdpSyncDicts;

// ������: "w:\archi\source\projects\PipeInAuto\Tasks\NOT_FINISHED_alcuMdpSyncDicts.pas"
// ���������: "SimpleClass"
// ������� ������: "TalcuMdpSyncDicts" MUID: (55E978530295)

{$Include w:\archi\source\projects\PipeInAuto\alcuDefine.inc}

interface

{$If Defined(ServerTasks)}
uses
 l3IntfUses
 {$If NOT Defined(Nemesis)}
 , csMdpSyncDicts
 {$IfEnd} // NOT Defined(Nemesis)
;

type
 TalcuMdpSyncDicts = class({$If NOT Defined(Nemesis)}
 TcsMdpSyncDicts
 {$IfEnd} // NOT Defined(Nemesis)
 )
 end;//TalcuMdpSyncDicts
{$IfEnd} // Defined(ServerTasks)

implementation

{$If Defined(ServerTasks)}
uses
 l3ImplUses
 , alcuMdpSyncParamUtils
 //#UC START# *55E978530295impl_uses*
 //#UC END# *55E978530295impl_uses*
;

{$If NOT Defined(Nemesis)}
{$IfEnd} // NOT Defined(Nemesis)
{$IfEnd} // Defined(ServerTasks)
end.
