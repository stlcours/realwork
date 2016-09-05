unit l3ProtoPersistentWithHandle;

// ������: "w:\common\components\rtl\Garant\L3\l3ProtoPersistentWithHandle.pas"
// ���������: "SimpleClass"
// ������� ������: "Tl3ProtoPersistentWithHandle" MUID: (52FCC6C002D7)

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoPersistent
 , l3Types
;

type
 Tl3ProtoPersistentWithHandle = class(Tl3ProtoPersistent)
  protected
   function pm_GetHandle: Tl3Handle; virtual; abstract;
   procedure pm_SetHandle(aValue: Tl3Handle); virtual; abstract;
  public
   function CompareWith(anOther: Tl3ProtoPersistentWithHandle): Integer; virtual; abstract;
  public
   property Handle: Tl3Handle
    read pm_GetHandle
    write pm_SetHandle;
 end;//Tl3ProtoPersistentWithHandle

implementation

uses
 l3ImplUses
 //#UC START# *52FCC6C002D7impl_uses*
 //#UC END# *52FCC6C002D7impl_uses*
;

end.
