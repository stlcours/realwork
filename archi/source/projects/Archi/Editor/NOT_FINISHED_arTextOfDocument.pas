unit NOT_FINISHED_arTextOfDocument;

// ������: "w:\archi\source\projects\Archi\Editor\NOT_FINISHED_arTextOfDocument.pas"
// ���������: "SimpleClass"
// ������� ������: "TarTextOfDocument" MUID: (4E0072E100DB)

{$Include w:\archi\source\projects\Archi\arDefine.inc}

interface

{$If Defined(AppClientSide)}
uses
 l3IntfUses
 , evTextSource
 , nevTools
;

type
 TarTextOfDocument = class(TevTextSource)
  protected
   function DoMakeDocumentContainer: InevDocumentContainer; override;
 end;//TarTextOfDocument

 RarTextOfDocument = TarTextOfDocument;
{$IfEnd} // Defined(AppClientSide)

implementation

{$If Defined(AppClientSide)}
uses
 l3ImplUses
 , arDocumentContainer
;

function TarTextOfDocument.DoMakeDocumentContainer: InevDocumentContainer;
//#UC START# *482D9A030221_4E0072E100DB_var*
//#UC END# *482D9A030221_4E0072E100DB_var*
begin
//#UC START# *482D9A030221_4E0072E100DB_impl*
 !!! Needs to be implemented !!!
//#UC END# *482D9A030221_4E0072E100DB_impl*
end;//TarTextOfDocument.DoMakeDocumentContainer
{$IfEnd} // Defined(AppClientSide)

end.
