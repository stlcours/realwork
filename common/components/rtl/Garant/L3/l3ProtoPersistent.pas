unit l3ProtoPersistent;

// ������: "w:\common\components\rtl\Garant\L3\l3ProtoPersistent.pas"
// ���������: "SimpleClass"
// ������� ������: "Tl3ProtoPersistent" MUID: (49E7725102DA)

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
 , l3CastablePersistent
 , l3PureMixIns
;

type
 _l3Unknown_Parent_ = Tl3CastablePersistent;
 {$Include w:\common\components\rtl\Garant\L3\l3Unknown.imp.pas}
 Tl3ProtoPersistent = {abstract} class(_l3Unknown_)
 end;//Tl3ProtoPersistent

implementation

uses
 l3ImplUses
 , SysUtils
 , l3Base
 , l3Core
 , Windows
 , Classes
 , l3MemUtils
 , l3Interlocked
 //#UC START# *49E7725102DAimpl_uses*
 //#UC END# *49E7725102DAimpl_uses*
;

{$Include w:\common\components\rtl\Garant\L3\l3Unknown.imp.pas}

end.
