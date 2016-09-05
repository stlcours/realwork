unit mmmReferencePharmaceuticalInformation;
 {* ���������� ���������������� ���������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Medic\mmmReferencePharmaceuticalInformation.pas"
// ���������: "SimpleClass"
// ������� ������: "TmmmReferencePharmaceuticalInformation" MUID: (490C47190273)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , mmmTree
 , l3Tree_TLB
;

type
 TmmmReferencePharmaceuticalInformation = class(TmmmTree)
  {* ���������� ���������������� ���������� }
  protected
   function MakeRoot: Il3RootNode; override;
    {* ������ ������ ������ }
 end;//TmmmReferencePharmaceuticalInformation
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , l3StringIDEx
 , nsTypes
 //#UC START# *490C47190273impl_uses*
 //#UC END# *490C47190273impl_uses*
;

const
 {* ������������ ������ Local }
 str_mmmiHelp: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'mmmiHelp'; rValue : '����������� ������������');
  {* '����������� ������������' }

function TmmmReferencePharmaceuticalInformation.MakeRoot: Il3RootNode;
 {* ������ ������ ������ }
//#UC START# *4909EF6E0361_490C47190273_var*
const
 c_Documents: array [0..3] of Longint = (52390025, 52390014, 52390003, 52390001);
//#UC END# *4909EF6E0361_490C47190273_var*
begin
//#UC START# *4909EF6E0361_490C47190273_impl*
 Result := inherited MakeRoot;
 nsAddMainMenuDocumentItem(Result, Ord(ns_mntDocument), c_Documents);
 //AddItem(Result, ns_mntHelp, str_mmmiHelp);
//#UC END# *4909EF6E0361_490C47190273_impl*
end;//TmmmReferencePharmaceuticalInformation.MakeRoot

initialization
 str_mmmiHelp.Init;
 {* ������������� str_mmmiHelp }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
