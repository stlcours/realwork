unit deListSet;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Business\Document\deListSet.pas"
// ���������: "SimpleClass"
// ������� ������: "TdeListSet" MUID: (4926AE3900B9)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , deDocumentList
 , WorkWithListInterfaces
 , DynamicDocListUnit
 , bsTypes
 , l3TreeInterfaces
 , PrimPrimListInterfaces
;

type
 TdeListSet = class(TdeDocumentList, IdeDocumentListSet)
  private
   f_List_SynchroView_Form: TList_SynchroView_Areas;
    {* ����� ����������� ��������� }
  protected
   function pm_GetListSynchroViewForm: TList_SynchroView_Areas;
   procedure AssignClonned(aClone: TdeDocumentList); override;
  public
   constructor Create(const aList: IDynList;
    aWhatDoingIfOneDoc: TbsWhatDoingIfOneDoc;
    aOpenFrom: TbsListOpenFrom;
    aTimeMachineOff: Boolean;
    const aNodeForPositioning: Il3SimpleNode;
    const aSearchInfo: IdeSearchInfo;
    aAllDocumentsFiltered: Boolean;
    aNeedApplyPermanentFilters: Boolean;
    aIsChanged: Boolean); reintroduce;
   class function Make(const aList: IDynList;
    aWhatDoingIfOneDoc: TbsWhatDoingIfOneDoc = bsTypes.wdAlwaysOpen;
    aOpenFrom: TbsListOpenFrom = bsTypes.lofNone;
    aTimeMachineOff: Boolean = True;
    const aNodeForPositioning: Il3SimpleNode = nil;
    const aSearchInfo: IdeSearchInfo = nil;
    aAllDocumentsFiltered: Boolean = False;
    aNeedApplyPermanentFilters: Boolean = True;
    aIsChanged: Boolean = False): IdeDocumentListSet; reintroduce;
 end;//TdeListSet
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 //#UC START# *4926AE3900B9impl_uses*
 //#UC END# *4926AE3900B9impl_uses*
;

constructor TdeListSet.Create(const aList: IDynList;
 aWhatDoingIfOneDoc: TbsWhatDoingIfOneDoc;
 aOpenFrom: TbsListOpenFrom;
 aTimeMachineOff: Boolean;
 const aNodeForPositioning: Il3SimpleNode;
 const aSearchInfo: IdeSearchInfo;
 aAllDocumentsFiltered: Boolean;
 aNeedApplyPermanentFilters: Boolean;
 aIsChanged: Boolean);
//#UC START# *4B1F7C63023F_4926AE3900B9_var*
//#UC END# *4B1F7C63023F_4926AE3900B9_var*
begin
//#UC START# *4B1F7C63023F_4926AE3900B9_impl*
 inherited Create(aList,
                  aOpenFrom,
                  aTimeMachineOff,
                  aWhatDoingIfOneDoc,
                  aNodeForPositioning,
                  aSearchInfo,
                  aAllDocumentsFiltered,
                  aNeedApplyPermanentFilters,
                  aIsChanged);
 f_List_SynchroView_Form := sva_List_SynchroView_Document;
//#UC END# *4B1F7C63023F_4926AE3900B9_impl*
end;//TdeListSet.Create

class function TdeListSet.Make(const aList: IDynList;
 aWhatDoingIfOneDoc: TbsWhatDoingIfOneDoc = bsTypes.wdAlwaysOpen;
 aOpenFrom: TbsListOpenFrom = bsTypes.lofNone;
 aTimeMachineOff: Boolean = True;
 const aNodeForPositioning: Il3SimpleNode = nil;
 const aSearchInfo: IdeSearchInfo = nil;
 aAllDocumentsFiltered: Boolean = False;
 aNeedApplyPermanentFilters: Boolean = True;
 aIsChanged: Boolean = False): IdeDocumentListSet;
var
 l_Inst : TdeListSet;
begin
 l_Inst := Create(aList, aWhatDoingIfOneDoc, aOpenFrom, aTimeMachineOff, aNodeForPositioning, aSearchInfo, aAllDocumentsFiltered, aNeedApplyPermanentFilters, aIsChanged);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TdeListSet.Make

function TdeListSet.pm_GetListSynchroViewForm: TList_SynchroView_Areas;
begin
 Result := f_List_SynchroView_Form;
end;//TdeListSet.pm_GetListSynchroViewForm

procedure TdeListSet.AssignClonned(aClone: TdeDocumentList);
//#UC START# *4B1F7AE80158_4926AE3900B9_var*
//#UC END# *4B1F7AE80158_4926AE3900B9_var*
begin
//#UC START# *4B1F7AE80158_4926AE3900B9_impl*
 inherited;
 if aClone is TdeListSet then
 begin
  f_List_SynchroView_Form := TdeListSet(aClone).f_List_SynchroView_Form;
 end;//aClone is TdeListSet
//#UC END# *4B1F7AE80158_4926AE3900B9_impl*
end;//TdeListSet.AssignClonned
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
