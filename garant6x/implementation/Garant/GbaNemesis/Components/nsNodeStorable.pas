unit nsNodeStorable;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Components\nsNodeStorable.pas"
// ���������: "SimpleClass"
// ������� ������: "TnsNodeStorable" MUID: (468271030094)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
 l3IntfUses
 , evNodeStorable
 , afwNavigation
;

type
 TnsNodeStorable = class(TevNodeStorable)
  protected
   procedure GetAddress(var Addr: TevAddress); override;
 end;//TnsNodeStorable

implementation

uses
 l3ImplUses
 , FoldersUnit
 , DocumentUnit
 , SysUtils
 , BaseTypesUnit
 , BaseTreeSupportUnit
 , nevTools
 , evdTypes
 //#UC START# *468271030094impl_uses*
 //#UC END# *468271030094impl_uses*
;

procedure TnsNodeStorable.GetAddress(var Addr: TevAddress);
//#UC START# *48F494F102DD_468271030094_var*
var
 l_Document   : IevDocument;
 l_Bookmark   : IBookmark;
 l_PID        : TPId;
 l_Entity     : IEntityBase;
 l_BaseEntity : IUnknown;
 l_Node       : INode;
 l_Sub        : IevSub;
//#UC END# *48F494F102DD_468271030094_var*
begin
//#UC START# *48F494F102DD_468271030094_impl*
 inherited;
 if (Addr{$IfDef XE4}.rTafwAddress{$EndIf}.TypeID = ev_NullAddressType) then
 begin
  if Supports(Node, INode, l_Node) then
   try
    if not (TFoldersItemType(l_Node.GetObjectType) in
     [FIT_FOLDER, FIT_CONSULTATION, FIT_OLD_HISTORY]) then
     // - ���� ��� ����� ��� ������������, �� ��������� ������ �����������
    begin
     l_Node.Open(l_BaseEntity);
     if Supports(l_BaseEntity, IBookmark, l_Bookmark) then
      try
       l_Bookmark.GetPid(l_PID);
       Addr{$IfDef XE4}.rTafwAddress{$EndIf}.DocID := l_PID.rObjectId;
       Addr{$IfDef XE4}.rTafwAddress{$EndIf}.SubID := Integer(l_Bookmark.GetParagraph or POSITION_TYPE_PARA_ID);
       Addr{$IfDef XE4}.rTafwAddress{$EndIf}.TypeID := CI_Topic;
      finally
       l_Bookmark := nil;
      end//try..finall
     else
     if Supports(l_BaseEntity, IEntityBase, l_Entity) then
      try
       Addr{$IfDef XE4}.rTafwAddress{$EndIf}.DocID := l_Entity.GetEid;
       Addr{$IfDef XE4}.rTafwAddress{$EndIf}.SubID := 0;
       Addr{$IfDef XE4}.rTafwAddress{$EndIf}.TypeID := CI_FolderLink;
      finally
       l_Entity := nil;
      end;//try..finally
    end;//l_Node.GetObjectType <> otFolder
   finally
    l_Node := nil;
   end;//try..finally
 end;//Addr.TypeID = ev_NullAddressType
 if (Addr{$IfDef XE4}.rTafwAddress{$EndIf}.TypeID = ev_NullAddressType) then
 begin
  if Supports(Node, IevSub, l_Sub) then
   try
    if (l_Sub.LayerID = Ord(ev_sbtSub)) then
    begin
     l_Document := l_Sub.Document;
     if l_Document <> nil then // http://mdp.garant.ru/pages/viewpage.action?pageId=391841270
     begin
      Addr{$IfDef XE4}.rTafwAddress{$EndIf}.DocID := l_Document.ExternalHandle;
      Addr{$IfDef XE4}.rTafwAddress{$EndIf}.SubID := l_Sub.ID;
      Addr{$IfDef XE4}.rTafwAddress{$EndIf}.TypeID := CI_Topic;
     end; // if l_Document <> nil then
    end;//l_Sub.LayerID = ev_sbtSub
   finally
    l_Sub := nil;
    l_Document := nil;
   end;//try..finally
 end;//Result.TypeID = ev_NullAddressType
//#UC END# *48F494F102DD_468271030094_impl*
end;//TnsNodeStorable.GetAddress

end.
