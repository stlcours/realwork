unit NOT_FINISHED_DT_DbInfo;

// ������: "w:\common\components\rtl\Garant\DT\NOT_FINISHED_DT_DbInfo.pas"
// ���������: "UtilityPack"
// ������� ������: "DT_DbInfo" MUID: (537F79160044)

{$Include w:\common\components\rtl\Garant\DT\DtDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , l3ProtoObject
 , dtFamilyInfoList
;

type
 TDbInfo = class(Tl3ProtoObject)
  private
   f_FamiliesData: TdtFamilyInfoList;
 end;//TDbInfo
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
 //#UC START# *537F79160044impl_uses*
 //#UC END# *537F79160044impl_uses*
;
{$IfEnd} // NOT Defined(Nemesis)

end.
