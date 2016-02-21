unit tfwCachedTokens;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\tfwCachedTokens.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

uses
 l3IntfUses
 , tfwCStringList
;

type
 TtfwCachedTokens = class(TtfwCStringList)
  protected
   {$If NOT Defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
    {* ������� ������, ������������ ����� �� ������� ������� ������ �������� � ��� ���������� �������������. }
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
 end;//TtfwCachedTokens

implementation

uses
 l3ImplUses
;

{$If NOT Defined(DesignTimeLibrary)}
class function TtfwCachedTokens.IsCacheable: Boolean;
 {* ������� ������, ������������ ����� �� ������� ������� ������ �������� � ��� ���������� �������������. }
//#UC START# *47A6FEE600FC_52F1221701EB_var*
//#UC END# *47A6FEE600FC_52F1221701EB_var*
begin
//#UC START# *47A6FEE600FC_52F1221701EB_impl*
 Result := true;
//#UC END# *47A6FEE600FC_52F1221701EB_impl*
end;//TtfwCachedTokens.IsCacheable
{$IfEnd} // NOT Defined(DesignTimeLibrary)

end.
