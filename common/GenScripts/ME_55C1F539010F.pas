unit MakeCORunner;

// ������: "w:\common\components\MakeCO\MakeCORunner.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\MakeCO\MakeCO.inc}

interface

uses
 l3IntfUses
;

type
 TMakeCORunner = {final} class
  public
   class procedure Run;
 end;//TMakeCORunner

implementation

uses
 l3ImplUses
 , tfwCOMaker
 , SysUtils
;

class procedure TMakeCORunner.Run;
//#UC START# *55C1F54A0327_55C1F539010F_var*
//#UC END# *55C1F54A0327_55C1F539010F_var*
begin
//#UC START# *55C1F54A0327_55C1F539010F_impl*
 TtfwCOMaker.Make(ParamStr(1));
//#UC END# *55C1F54A0327_55C1F539010F_impl*
end;//TMakeCORunner.Run

end.
