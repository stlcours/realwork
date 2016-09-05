unit NOT_FINISHED_csMessageRecepient;

// ������: "w:\common\components\rtl\Garant\cs\NOT_FINISHED_csMessageRecepient.pas"
// ���������: "SimpleClass"
// ������� ������: "TcsMessageRecepient" MUID: (52FB9F4F029B)

{$Include w:\common\components\rtl\Garant\cs\CsDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , l3ProtoObject
 , ddClientMessageSortableList
;

type
 TcsMessageRecepient = class(Tl3ProtoObject)
  private
   f_Messages: TddClientMessageSortableList;
  public
   property Messages: TddClientMessageSortableList
    read f_Messages;
 end;//TcsMessageRecepient
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
 //#UC START# *52FB9F4F029Bimpl_uses*
 //#UC END# *52FB9F4F029Bimpl_uses*
;
{$IfEnd} // NOT Defined(Nemesis)

end.
