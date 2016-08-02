{$IfNDef atEntity_imp}

// ������: "w:\quality\test\garant6x\AdapterTest\AdapterHelpers\atEntity.imp.pas"
// ���������: "Impurity"
// ������� ������: "atEntity" MUID: (4FC8E3BF0125)
// ��� ����: "_atEntity_"

{$Define atEntity_imp}

 _atEntity_ = class(Tl3_Base)
  private
   f_Entity: _EntityInterface_;
  protected
   {$If NOT Defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
    {* ������� ������, ������������ ����� �� ������� ������� ������ �������� � ��� ���������� �������������. }
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
   procedure ClearFields; override;
  public
   class function IsItMe(const anEntity: IEntityBase): Boolean; virtual;
   constructor Create(const anEntityBase: IEntityBase); reintroduce; overload; virtual;
   constructor Create(const anEntity: _EntityInterface_); reintroduce; overload; virtual;
   constructor Create(const aNodeBase: INodeBase); reintroduce; overload; virtual;
  public
   property Entity: _EntityInterface_
    read f_Entity;
 end;//_atEntity_

{$Else atEntity_imp}

{$IfNDef atEntity_imp_impl}

{$Define atEntity_imp_impl}

class function _atEntity_.IsItMe(const anEntity: IEntityBase): Boolean;
//#UC START# *4FC8E4970307_4FC8E3BF0125_var*
//#UC END# *4FC8E4970307_4FC8E3BF0125_var*
begin
//#UC START# *4FC8E4970307_4FC8E3BF0125_impl*
  Result := Supports(anEntity, _EntityInterface_);
//#UC END# *4FC8E4970307_4FC8E3BF0125_impl*
end;//_atEntity_.IsItMe

constructor _atEntity_.Create(const anEntityBase: IEntityBase);
//#UC START# *4FC8E5780345_4FC8E3BF0125_var*
//#UC END# *4FC8E5780345_4FC8E3BF0125_var*
begin
//#UC START# *4FC8E5780345_4FC8E3BF0125_impl*
  if NOT Supports(anEntityBase, _EntityInterface_, f_Entity) then
    Raise Exception.Create('Interface unsupported!');
//#UC END# *4FC8E5780345_4FC8E3BF0125_impl*
end;//_atEntity_.Create

constructor _atEntity_.Create(const anEntity: _EntityInterface_);
//#UC START# *4FD0E3B80139_4FC8E3BF0125_var*
//#UC END# *4FD0E3B80139_4FC8E3BF0125_var*
begin
//#UC START# *4FD0E3B80139_4FC8E3BF0125_impl*
  f_Entity := anEntity;
//#UC END# *4FD0E3B80139_4FC8E3BF0125_impl*
end;//_atEntity_.Create

constructor _atEntity_.Create(const aNodeBase: INodeBase);
//#UC START# *5051EAD80280_4FC8E3BF0125_var*
  var
    l_Entity : IEntityBase;
//#UC END# *5051EAD80280_4FC8E3BF0125_var*
begin
//#UC START# *5051EAD80280_4FC8E3BF0125_impl*
  aNodeBase.GetEntity(l_Entity); // ���� �� ���������, �� ������ ���� ���������� ENoEntity
  Create(l_Entity);
//#UC END# *5051EAD80280_4FC8E3BF0125_impl*
end;//_atEntity_.Create

{$If NOT Defined(DesignTimeLibrary)}
class function _atEntity_.IsCacheable: Boolean;
 {* ������� ������, ������������ ����� �� ������� ������� ������ �������� � ��� ���������� �������������. }
//#UC START# *47A6FEE600FC_4FC8E3BF0125_var*
//#UC END# *47A6FEE600FC_4FC8E3BF0125_var*
begin
//#UC START# *47A6FEE600FC_4FC8E3BF0125_impl*
  Result := true;
//#UC END# *47A6FEE600FC_4FC8E3BF0125_impl*
end;//_atEntity_.IsCacheable
{$IfEnd} // NOT Defined(DesignTimeLibrary)

procedure _atEntity_.ClearFields;
begin
 Finalize(f_Entity);
 inherited;
end;//_atEntity_.ClearFields

{$EndIf atEntity_imp_impl}

{$EndIf atEntity_imp}

