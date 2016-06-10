{$IfNDef sdsBaseDocumentWithAttributes_imp}

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Business\Document\sdsBaseDocumentWithAttributes.imp.pas"
// ���������: "UseCaseControllerImp"
// ������� ������: "sdsBaseDocumentWithAttributes" MUID: (47F0849400D0)
// ��� ����: "_sdsBaseDocumentWithAttributes_"

{$Define sdsBaseDocumentWithAttributes_imp}

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\Business\Document\sdsBaseDocument.imp.pas}
 _sdsBaseDocumentWithAttributes_ = {abstract} class(_sdsBaseDocument_, IsdsBaseDocumentWithAttributes)
  {* �������� � ���������� }
  protected
   procedure DoOpenAttributes; virtual;
    {* - ��������. }
   function NeedMakeDSAttributes: Boolean; virtual;
    {* - ������������� �������� ��� ���������. }
   function GetHasAttributes: Boolean; virtual;
    {* ���������� HasAttributes }
   procedure OpenAttributes;
    {* �������� }
   function pm_GetDsAttributes: IdsAttributes;
   function DoGet_DsAttributes: IdsAttributes;
   function pm_GetHasAttributes: Boolean;
   function pm_GetDsAttributesRef: IvcmViewAreaControllerRef;
   procedure ClearAllDS; override;
   {$If NOT Defined(NoVCM)}
   procedure ClearAreas; override;
    {* ������� ������ �� ������� ����� }
   {$IfEnd} // NOT Defined(NoVCM)
 end;//_sdsBaseDocumentWithAttributes_

{$Else NOT Defined(Admin) AND NOT Defined(Monitorings)}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\Business\Document\sdsBaseDocument.imp.pas}
_sdsBaseDocumentWithAttributes_ = _sdsBaseDocument_;

{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)
{$Else sdsBaseDocumentWithAttributes_imp}

{$IfNDef sdsBaseDocumentWithAttributes_imp_impl}

{$Define sdsBaseDocumentWithAttributes_imp_impl}

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
{$Include w:\garant6x\implementation\Garant\GbaNemesis\Business\Document\sdsBaseDocument.imp.pas}

procedure _sdsBaseDocumentWithAttributes_.DoOpenAttributes;
 {* - ��������. }
//#UC START# *47FDDACC0101_47F0849400D0_var*
//#UC END# *47FDDACC0101_47F0849400D0_var*
begin
//#UC START# *47FDDACC0101_47F0849400D0_impl*
 with pm_GetdsAttributesRef do
  if IsEmpty then
   SetIfNeedMakeNo(vcm_nmForce);
 Refresh;
//#UC END# *47FDDACC0101_47F0849400D0_impl*
end;//_sdsBaseDocumentWithAttributes_.DoOpenAttributes

function _sdsBaseDocumentWithAttributes_.NeedMakeDSAttributes: Boolean;
 {* - ������������� �������� ��� ���������. }
//#UC START# *47FE03AE0225_47F0849400D0_var*
//#UC END# *47FE03AE0225_47F0849400D0_var*
begin
//#UC START# *47FE03AE0225_47F0849400D0_impl*
 Result := pm_GetHasAttributes;
//#UC END# *47FE03AE0225_47F0849400D0_impl*
end;//_sdsBaseDocumentWithAttributes_.NeedMakeDSAttributes

function _sdsBaseDocumentWithAttributes_.GetHasAttributes: Boolean;
 {* ���������� HasAttributes }
//#UC START# *49352CEF0222_47F0849400D0_var*
var
 l_HasAttributes: Tl3Bool;
//#UC END# *49352CEF0222_47F0849400D0_var*
begin
//#UC START# *49352CEF0222_47F0849400D0_impl*
 Result := False;
 if pm_GetHasDocument and
  not l3BoolCheck(SetData.HasAttributes, Result) then
 begin
  Result := l3BoolSet(pm_GetDocInfo.Doc.HasAttributes, l_HasAttributes);
  SetData.HasAttributes := l_HasAttributes;
 end;
//#UC END# *49352CEF0222_47F0849400D0_impl*
end;//_sdsBaseDocumentWithAttributes_.GetHasAttributes

procedure _sdsBaseDocumentWithAttributes_.OpenAttributes;
 {* �������� }
//#UC START# *492598700162_47F0849400D0_var*
//#UC END# *492598700162_47F0849400D0_var*
begin
//#UC START# *492598700162_47F0849400D0_impl*
 DoOpenAttributes;
//#UC END# *492598700162_47F0849400D0_impl*
end;//_sdsBaseDocumentWithAttributes_.OpenAttributes

function _sdsBaseDocumentWithAttributes_.pm_GetDsAttributes: IdsAttributes;
//#UC START# *5009A78501A6_47F0849400D0get_var*
//#UC END# *5009A78501A6_47F0849400D0get_var*
begin
 with pm_GetdsAttributesRef do
 begin
  if IsEmpty
  //#UC START# *5009A78501A6_47F0849400D0get_need*
     AND (NeedMake <> vcm_nmNo)
     AND NeedMakeDSAttributes
   // - ������� �������� ViewArea
  //#UC END# *5009A78501A6_47F0849400D0get_need*
   then
    Referred := DoGet_dsAttributes;
  Result := IdsAttributes(Referred);
 end;// with pm_GetdsAttributesRef
end;//_sdsBaseDocumentWithAttributes_.pm_GetDsAttributes

function _sdsBaseDocumentWithAttributes_.DoGet_DsAttributes: IdsAttributes;
//#UC START# *5009A78501A6_47F0849400D0area_var*
//#UC END# *5009A78501A6_47F0849400D0area_var*
begin
//#UC START# *5009A78501A6_47F0849400D0area_impl*
 Result := TdsAttributes.Make(Self, pm_GetDocInfo.Clone);
//#UC END# *5009A78501A6_47F0849400D0area_impl*
end;//_sdsBaseDocumentWithAttributes_.DoGet_DsAttributes

function _sdsBaseDocumentWithAttributes_.pm_GetHasAttributes: Boolean;
//#UC START# *6DBD21E52E04_47F0849400D0get_var*
//#UC END# *6DBD21E52E04_47F0849400D0get_var*
begin
//#UC START# *6DBD21E52E04_47F0849400D0get_impl*
 Result := GetHasAttributes;
//#UC END# *6DBD21E52E04_47F0849400D0get_impl*
end;//_sdsBaseDocumentWithAttributes_.pm_GetHasAttributes

function _sdsBaseDocumentWithAttributes_.pm_GetDsAttributesRef: IvcmViewAreaControllerRef;
begin
 Result := SetData.dsAttributesRef;
end;//_sdsBaseDocumentWithAttributes_.pm_GetDsAttributesRef

procedure _sdsBaseDocumentWithAttributes_.ClearAllDS;
//#UC START# *4925B7F00156_47F0849400D0_var*
//#UC END# *4925B7F00156_47F0849400D0_var*
begin
//#UC START# *4925B7F00156_47F0849400D0_impl*
 inherited;
 pm_GetdsAttributesRef.Referred := nil;
//#UC END# *4925B7F00156_47F0849400D0_impl*
end;//_sdsBaseDocumentWithAttributes_.ClearAllDS

{$If NOT Defined(NoVCM)}
procedure _sdsBaseDocumentWithAttributes_.ClearAreas;
 {* ������� ������ �� ������� ����� }
begin
 pm_GetdsAttributesRef.Referred := nil;
 inherited;
end;//_sdsBaseDocumentWithAttributes_.ClearAreas
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)
{$EndIf sdsBaseDocumentWithAttributes_imp_impl}

{$EndIf sdsBaseDocumentWithAttributes_imp}

