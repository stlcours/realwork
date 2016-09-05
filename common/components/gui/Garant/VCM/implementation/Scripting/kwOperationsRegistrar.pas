unit kwOperationsRegistrar;

// ������: "w:\common\components\gui\Garant\VCM\implementation\Scripting\kwOperationsRegistrar.pas"
// ���������: "SimpleClass"
// ������� ������: "TkwOperationsRegistrar" MUID: (52A73D1701B9)

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
uses
 l3IntfUses
 , l3ProtoObject
 , vcmOperationsManager
 , vcmBaseEntitiesCollectionItem
 , vcmBaseOperationsCollectionItem
;

type
 TkwOperationsRegistrar = class(Tl3ProtoObject, IvcmOperationsRegistrar)
  protected
   procedure Register(anEn: TvcmBaseEntitiesCollectionItem;
    anOp: TvcmBaseOperationsCollectionItem);
  public
   class function Instance: TkwOperationsRegistrar;
    {* ����� ��������� ���������� ���������� TkwOperationsRegistrar }
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
 end;//TkwOperationsRegistrar
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
uses
 l3ImplUses
 , kwEntityOperation
 , SysUtils
 , l3Base
 //#UC START# *52A73D1701B9impl_uses*
 //#UC END# *52A73D1701B9impl_uses*
;

var g_TkwOperationsRegistrar: TkwOperationsRegistrar = nil;
 {* ��������� ���������� TkwOperationsRegistrar }

procedure TkwOperationsRegistrarFree;
 {* ����� ������������ ���������� ���������� TkwOperationsRegistrar }
begin
 l3Free(g_TkwOperationsRegistrar);
end;//TkwOperationsRegistrarFree

procedure TkwOperationsRegistrar.Register(anEn: TvcmBaseEntitiesCollectionItem;
 anOp: TvcmBaseOperationsCollectionItem);
//#UC START# *52A73C7103C7_52A73D1701B9_var*
//#UC END# *52A73C7103C7_52A73D1701B9_var*
begin
//#UC START# *52A73C7103C7_52A73D1701B9_impl*
 TkwEntityOperation.Register(anEn, anOp);
//#UC END# *52A73C7103C7_52A73D1701B9_impl*
end;//TkwOperationsRegistrar.Register

class function TkwOperationsRegistrar.Instance: TkwOperationsRegistrar;
 {* ����� ��������� ���������� ���������� TkwOperationsRegistrar }
begin
 if (g_TkwOperationsRegistrar = nil) then
 begin
  l3System.AddExitProc(TkwOperationsRegistrarFree);
  g_TkwOperationsRegistrar := Create;
 end;
 Result := g_TkwOperationsRegistrar;
end;//TkwOperationsRegistrar.Instance

class function TkwOperationsRegistrar.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TkwOperationsRegistrar <> nil;
end;//TkwOperationsRegistrar.Exists

initialization
//#UC START# *52A73D57020D*
 TvcmOperationsManager.Instance.Registrar := TkwOperationsRegistrar.Instance;
//#UC END# *52A73D57020D*
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)

end.
