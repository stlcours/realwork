unit k2InterfaceMapper;

// ������: "w:\common\components\rtl\Garant\K2\k2InterfaceMapper.pas"
// ���������: "SimpleClass"
// ������� ������: "Tk2InterfaceMapper" MUID: (53D6399F03E1)

{$Include w:\common\components\rtl\Garant\K2\k2Define.inc}

interface

uses
 l3IntfUses
 , l3Variant
 , l3IID
;

type
 Tk2InterfaceMapper = {abstract} class
  public
   class function Make(aTag: Tl3Variant;
    const IID: Tl3GUID;
    out Tool;
    const aProcessor: Ik2Processor): Boolean; virtual; abstract;
 end;//Tk2InterfaceMapper

implementation

uses
 l3ImplUses
 //#UC START# *53D6399F03E1impl_uses*
 //#UC END# *53D6399F03E1impl_uses*
;

end.
