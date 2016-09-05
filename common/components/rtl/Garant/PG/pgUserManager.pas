unit pgUserManager;

// ������: "w:\common\components\rtl\Garant\PG\pgUserManager.pas"
// ���������: "UtilityPack"
// ������� ������: "pgUserManager" MUID: (57AB03D00397)

{$Include w:\common\components\rtl\Garant\PG\pgDefine.inc}

interface

{$If Defined(UsePostgres)}
uses
 l3IntfUses
 , Classes
 , daTypes
 , l3ProtoObject
 , daInterfaces
 , l3DatLst
 , daArchiUserList
 , daUserStatusChangedSubscriberList
 , pgConnection
 , pgFunctionFactory
 , pgFreeIDHelperHolder
 , pgTableModifier
 , l3LongintList
;

type
 TpgUserManager = class(Tl3ProtoObject, IdaUserManager, IdaComboAccessUserManagerHelper)
  private
   f_Factory: IdaTableQueryFactory;
   f_PasswordQuery: IdaTabledQuery;
   f_UserFlagsQuery: IdaTabledQuery;
   f_AllUsers: Tl3StringDataList;
   f_AllGroups: Tl3StringDataList;
   f_UserNameQuery: IdaTabledQuery;
   f_ArchiUsers: TdaArchiUserList;
   f_UserStatusChangedSubscriberList: TdaUserStatusChangedSubscriberList;
   f_UserLoginQuery: IdaTabledQuery;
   f_PriorityCalculator: IdaPriorityCalculator;
   f_AllArchiUsersQuery: IdaTabledQuery;
   f_AllGroupsQuery: IdaTabledQuery;
   f_IsMemberOfGroupQuery: IdaTabledQuery;
   f_UserGroupsQuery: IdaTabledQuery;
   f_Connection: TpgConnection;
   f_FunctionFactory: TpgFunctionFactory;
   f_FreeIDHelperHolder: TpgFreeIDHelperHolder;
   f_Journal: IdaJournal;
   f_GroupModifier: TpgTableModifier;
   f_GroupUsersQuery: IdaTabledQuery;
   f_CacheActiveUserList: TStringList;
  private
   procedure FillListByResultSet(aList: Tl3StringDataList;
    const aResultSet: IdaResultSet;
    const anIDFieldName: AnsiString;
    aDataSize: Integer;
    const aNameFieldName: AnsiString;
    AddRegion: Boolean);
   procedure FillAllUsers(aList: Tl3StringDataList);
   procedure FillAllGroups(aList: Tl3StringDataList);
   procedure SortUsersInList(aList: Tl3StringDataList);
   function UserNameQuery: IdaTabledQuery;
   function UserLoginQuery: IdaTabledQuery;
   function AllArchiUsersQuery: IdaTabledQuery;
   function AllGroupsQuery: IdaTabledQuery;
   function IsMemberOfGroupQuery: IdaTabledQuery;
   function UserGroupsQuery: IdaTabledQuery;
   procedure AddUserGroupWithID(anID: TdaUserGroupID;
    const aName: AnsiString);
   function GroupModifier: TpgTableModifier;
   function GroupUsersQuery: IdaTabledQuery;
   procedure LoadFiltredUserList(aList: TStringList;
    aOnlyActive: Boolean);
  protected
   function CheckPassword(const aLogin: AnsiString;
    const aPassword: AnsiString;
    RequireAdminRights: Boolean;
    out theUserID: TdaUserID): TdaLoginError;
   function IsUserAdmin(anUserID: TdaUserID): Boolean;
   function Get_AllUsers: Tl3StringDataList;
   function Get_AllGroups: Tl3StringDataList;
   function GetUserName(anUserID: TdaUserID): AnsiString;
   function GetUserPriorities(aGroupId: TdaUserID;
    var aImportPriority: TdaPriority;
    var aExportPriority: TdaPriority): Boolean;
   procedure ReSortUserList;
   function Get_ArchiUsersCount: Integer;
   function UserByID(aID: TdaUserID): IdaArchiUser;
   function UserByLogin(const aLogin: AnsiString): IdaArchiUser;
   procedure UpdateUserInfo(aUserID: TdaUserID;
    aIsGroup: Boolean);
   procedure MakeFullArchiUsersList;
   function GetUserDisplayName(anID: TdaUserID): AnsiString;
   function IsUserExists(anID: TdaUserID): Boolean;
   procedure RegisterUserStatusChangedSubscriber(const aSubscriber: IdaUserStatusChangedSubscriber);
   procedure UnRegisterUserStatusChangedSubscriber(const aSubscriber: IdaUserStatusChangedSubscriber);
   procedure NotifyUserActiveChanged(anUserID: TdaUserID;
    anActive: Boolean);
   function CSCheckPassword(const aLogin: AnsiString;
    const aPassword: AnsiString;
    RequireAdminRights: Boolean;
    out theUserID: TdaUserID): Boolean;
   procedure GetUserInfo(aUser: TdaUserID;
    var aUserName: AnsiString;
    var aLoginName: AnsiString;
    var aActFlag: Byte);
   function Get_PriorityCalculator: IdaPriorityCalculator;
   function IsMemberOfGroup(aUserGroupID: TdaUserGroupID;
    aUserID: TdaUserID): Boolean;
   function GetUserGroups(aUserID: TdaUserID): TdaUserGroupIDArray;
   procedure GetUserGroupsList(aUser: TdaUserID;
    aList: Tl3StringDataList); overload;
   procedure GetUserGroupsList(aUser: TdaUserID;
    aList: Tl3LongintList); overload;
   procedure SetUserGroupsList(aUser: TdaUserID;
    aList: Tl3StringDataList);
   function AddUserGroup(const aName: AnsiString): TdaUserGroupID;
   procedure EditUserGroup(aGroupID: TdaUserGroupID;
    const aName: AnsiString;
    aImportPriority: TdaPriority;
    aExportPriority: TdaPriority);
   procedure DelUserGroup(aGroupID: TdaUserGroupID);
   procedure AddUserGroupShadow(anID: TdaUserGroupID;
    const aName: AnsiString);
   procedure RemoveUserFromAllGroups(aUser: TdaUserID);
   procedure SetUserGroup(aUser: TdaUserID;
    aGroup: TdaUserGroupID;
    Add: Boolean = True);
   procedure AdminChangePassWord(aUser: TdaUserID;
    const NewPass: AnsiString);
   procedure GetHostUserListOnGroup(aGroupID: TdaUserGroupID;
    aList: Tl3StringDataList;
    NeedSort: Boolean = False);
   procedure SetHostUserListOnGroup(aGroupID: TdaUserGroupID;
    aList: Tl3StringDataList);
   function AddUser(const aUserName: AnsiString;
    const aLoginName: AnsiString;
    const aPassword: AnsiString;
    ActFlag: Byte): TdaUserID;
   function AddUserID(anID: TdaUserID;
    const aUserName: AnsiString;
    const aLoginName: AnsiString;
    const aPassword: AnsiString;
    ActFlag: Byte): TdaUserID;
   procedure EditUser(aUser: TdaUserID;
    const aUserName: AnsiString;
    const aLoginName: AnsiString;
    ActFlag: Byte;
    const EditMask: TdaUserEditMask);
   procedure DelUser(aUser: TdaUserID);
   procedure GetUserListOnGroup(aUsGroup: TdaUserGroupID;
    aList: Tl3StringDataList;
    GetActiveUsersOnly: Boolean = False);
   procedure GetFiltredUserList(aList: TStrings;
    aOnlyActive: Boolean = False);
   procedure GetDocGroupData(aUserGroup: TdaUserGroupID;
    aFamily: TdaFamilyID;
    aDocDataList: Tl3StringDataList);
   procedure PutDocGroupData(aUserGroup: TdaUserGroupID;
    aFamily: TdaFamilyID;
    aDocDataList: Tl3StringDataList);
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
  public
   constructor Create(const aTableFactory: IdaTableQueryFactory;
    const aJournal: IdaJournal;
    aFunctionFactory: TpgFunctionFactory;
    aFreeIDHelperHolder: TpgFreeIDHelperHolder;
    aConnection: TpgConnection); reintroduce;
   class function Make(const aTableFactory: IdaTableQueryFactory;
    const aJournal: IdaJournal;
    aFunctionFactory: TpgFunctionFactory;
    aFreeIDHelperHolder: TpgFreeIDHelperHolder;
    aConnection: TpgConnection): IdaUserManager; reintroduce;
   procedure IterateArchiUsersF(anAction: ArchiUsersIterator_IterateArchiUsersF_Action);
   procedure IterateUserGroupsF(anAction: ArchiUsersIterator_IterateUserGroupsF_Action);
 end;//TpgUserManager

function CompareUsers(anID1: TdaUserID;
 const aName1: AnsiString;
 anID2: TdaUserID;
 const aName2: AnsiString): Integer;
{$IfEnd} // Defined(UsePostgres)

implementation

{$If Defined(UsePostgres)}
uses
 l3ImplUses
 , SysUtils
 , daScheme
 , daUserManagerUtils
 , l3Base
 , daDataProvider
 , pgPriorityCalculator
 , daArchiUser
 , daSchemeConsts
 , l3MinMax
 , pgInterfaces
 , daUtils
 //#UC START# *57AB03D00397impl_uses*
 //#UC END# *57AB03D00397impl_uses*
;

function CompareStringsUser(List: TStringList;
 Index1: Integer;
 Index2: Integer): Integer;
//#UC START# *57AB04080295_57AB03D00397_var*
//#UC END# *57AB04080295_57AB03D00397_var*
begin
//#UC START# *57AB04080295_57AB03D00397_impl*
 Result := CompareUsers(TdaUserID(List.Objects[Index1]), List[Index1], TdaUserID(List.Objects[Index2]), List[Index2]);
//#UC END# *57AB04080295_57AB03D00397_impl*
end;//CompareStringsUser

function CompareUsers(anID1: TdaUserID;
 const aName1: AnsiString;
 anID2: TdaUserID;
 const aName2: AnsiString): Integer;
//#UC START# *57AB04B800BA_57AB03D00397_var*
var
 l_Reg1, l_Reg2: TdaRegionID;
//#UC END# *57AB04B800BA_57AB03D00397_var*
begin
//#UC START# *57AB04B800BA_57AB03D00397_impl*
 // ������� ���������� �������
 l_Reg1 := GetUserRegion(anID1);
 l_Reg2 := GetUserRegion(anID2);
 if l_Reg1 <> l_Reg2 then
 begin
  // ���� ������ ���, ������, �� �� ������ ���� �������, ����������!
  if l_Reg1 = GlobalDataProvider.RegionID then
  begin
   Result := -1;
   Exit;
  end
  else
   if l_Reg2 = GlobalDataProvider.RegionID then
   begin
    Result := 1;
    Exit;
   end
 end;
 // �� ������� �� ����� ������. ��������� �� ����� (� �������� �������� ������� ��� ���������)
 if aName1 < aName2 then
  Result := -1
 else
  if aName1 > aName2 then
   Result := 1
  else
   Result := 0;
//#UC END# *57AB04B800BA_57AB03D00397_impl*
end;//CompareUsers

constructor TpgUserManager.Create(const aTableFactory: IdaTableQueryFactory;
 const aJournal: IdaJournal;
 aFunctionFactory: TpgFunctionFactory;
 aFreeIDHelperHolder: TpgFreeIDHelperHolder;
 aConnection: TpgConnection);
//#UC START# *562A074E0321_5629FC88034B_var*
//#UC END# *562A074E0321_5629FC88034B_var*
begin
//#UC START# *562A074E0321_5629FC88034B_impl*
 inherited Create;
 f_Factory := aTableFactory;
 f_Journal := aJournal;

 aConnection.SetRefTo(f_Connection);
 aFunctionFactory.SetRefTo(f_FunctionFactory);
 aFreeIDHelperHolder.SetRefTo(f_FreeIDHelperHolder);

 f_ArchiUsers := TdaArchiUserList.Create;
 f_UserStatusChangedSubscriberList := TdaUserStatusChangedSubscriberList.Make;

 f_PasswordQuery := f_Factory.MakeTabledQuery(f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtPassword)));
 f_PasswordQuery.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtPassword)['Password']));
 f_PasswordQuery.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtPassword)['User_ID']));
 f_PasswordQuery.WhereCondition := f_Factory.MakeParamsCondition('', TdaScheme.Instance.Table(da_mtPassword)['ShortName'], da_copEqual, 'p_ShortName');
 f_PasswordQuery.Prepare;

 f_UserFlagsQuery := f_Factory.MakeTabledQuery(f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtUsers)));
 f_UserFlagsQuery.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtUsers)['user_name']));
 f_UserFlagsQuery.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtUsers)['Active']));
 f_UserFlagsQuery.WhereCondition := f_Factory.MakeParamsCondition('', TdaScheme.Instance.Table(da_mtUsers)['ID'], da_copEqual, 'p_UserID');
 f_UserFlagsQuery.Prepare;
//#UC END# *562A074E0321_5629FC88034B_impl*
end;//TpgUserManager.Create

class function TpgUserManager.Make(const aTableFactory: IdaTableQueryFactory;
 const aJournal: IdaJournal;
 aFunctionFactory: TpgFunctionFactory;
 aFreeIDHelperHolder: TpgFreeIDHelperHolder;
 aConnection: TpgConnection): IdaUserManager;
var
 l_Inst : TpgUserManager;
begin
 l_Inst := Create(aTableFactory, aJournal, aFunctionFactory, aFreeIDHelperHolder, aConnection);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TpgUserManager.Make

procedure TpgUserManager.FillListByResultSet(aList: Tl3StringDataList;
 const aResultSet: IdaResultSet;
 const anIDFieldName: AnsiString;
 aDataSize: Integer;
 const aNameFieldName: AnsiString;
 AddRegion: Boolean);
//#UC START# *57172C740069_5629FC88034B_var*
var
 l_ID: TdaUserID;
 l_Name: AnsiString;
//#UC END# *57172C740069_5629FC88034B_var*
begin
//#UC START# *57172C740069_5629FC88034B_impl*
 aList.Changing;
 try
  aList.Clear;
  aList.DataSize := aDataSize;
  aList.NeedAllocStr := True;
  while not aResultSet.EOF do
  begin
   l_ID := aResultSet.Field[anIDFieldName].AsLargeInt;
   l_Name := aResultSet.Field[aNameFieldName].AsString;
   if AddRegion then
    l_Name := ConcatRegionAndUserNames(l_ID,  l_Name);
   aList.AddStr(l_Name, @l_ID);
   aResultSet.Next;
  end;
 finally
  aList.Changed;
 end;
//#UC END# *57172C740069_5629FC88034B_impl*
end;//TpgUserManager.FillListByResultSet

procedure TpgUserManager.FillAllUsers(aList: Tl3StringDataList);
//#UC START# *5715E71600DD_5629FC88034B_var*
var
 l_Query: IdaTabledQuery;
 l_ResultSet: IdaResultSet;
//#UC END# *5715E71600DD_5629FC88034B_var*
begin
//#UC START# *5715E71600DD_5629FC88034B_impl*
 l_Query := f_Factory.MakeTabledQuery(f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtUsers)));
 try
  l_Query.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtUsers)['id']));
  l_Query.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtUsers)['user_name']));
  l_Query.Prepare;
  l_ResultSet := l_Query.OpenResultSet;
  try
   FillListByResultSet(aList, l_ResultSet, 'id', cUserIDSize, 'user_name', True);
  finally
   l_ResultSet := nil;
  end;
 finally
  l_Query := nil;
 end;
//#UC END# *5715E71600DD_5629FC88034B_impl*
end;//TpgUserManager.FillAllUsers

procedure TpgUserManager.FillAllGroups(aList: Tl3StringDataList);
//#UC START# *5715E74402CA_5629FC88034B_var*
var
 l_Query: IdaTabledQuery;
 l_ResultSet: IdaResultSet;
//#UC END# *5715E74402CA_5629FC88034B_var*
begin
//#UC START# *5715E74402CA_5629FC88034B_impl*
 l_Query := f_Factory.MakeTabledQuery(f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtGroups)));
 try
  l_Query.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtGroups)['id']));
  l_Query.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtGroups)['group_name']));
  l_Query.Prepare;
  l_ResultSet := l_Query.OpenResultSet;
  try
   FillListByResultSet(aList, l_ResultSet, 'id', cGroupIDSize, 'group_name', False);
  finally
   l_ResultSet := nil;
  end;
 finally
  l_Query := nil;
 end;
//#UC END# *5715E74402CA_5629FC88034B_impl*
end;//TpgUserManager.FillAllGroups

procedure TpgUserManager.SortUsersInList(aList: Tl3StringDataList);
//#UC START# *5715ED0002E0_5629FC88034B_var*

 function l_CompareUsers(I, J: Integer): Integer;
 begin
  Result := CompareUsers(TdaUserID(aList.DataInt[I]), aList.PasStr[I], TdaUserID(aList.DataInt[J]), aList.PasStr[J]);
 end;

//#UC END# *5715ED0002E0_5629FC88034B_var*
begin
//#UC START# *5715ED0002E0_5629FC88034B_impl*
 aList.SortF(l3LocalStub(@l_CompareUsers));
//#UC END# *5715ED0002E0_5629FC88034B_impl*
end;//TpgUserManager.SortUsersInList

function TpgUserManager.UserNameQuery: IdaTabledQuery;
//#UC START# *5718C16B036E_5629FC88034B_var*
//#UC END# *5718C16B036E_5629FC88034B_var*
begin
//#UC START# *5718C16B036E_5629FC88034B_impl*
 if f_UserNameQuery = nil then
 begin
  f_UserNameQuery := f_Factory.MakeTabledQuery(f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtUsers)));
  f_UserNameQuery.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtUsers)['user_name']));
  f_UserNameQuery.WhereCondition := f_Factory.MakeParamsCondition('', TdaScheme.Instance.Table(da_mtUsers)['ID'], da_copEqual, 'p_UserID');
  f_UserNameQuery.Prepare;
 end;
 Result := f_UserNameQuery;
//#UC END# *5718C16B036E_5629FC88034B_impl*
end;//TpgUserManager.UserNameQuery

function TpgUserManager.UserLoginQuery: IdaTabledQuery;
//#UC START# *573B0837013B_5629FC88034B_var*
//#UC END# *573B0837013B_5629FC88034B_var*
begin
//#UC START# *573B0837013B_5629FC88034B_impl*
 if f_UserLoginQuery = nil then
 begin
  f_UserLoginQuery := f_Factory.MakeTabledQuery(f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtPassword)));
  f_UserLoginQuery.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtPassword)['ShortName']));
  f_UserLoginQuery.WhereCondition := f_Factory.MakeParamsCondition('', TdaScheme.Instance.Table(da_mtPassword)['User_ID'], da_copEqual, 'p_UserID');
  f_UserLoginQuery.Prepare;
 end;
 Result := f_UserLoginQuery;
//#UC END# *573B0837013B_5629FC88034B_impl*
end;//TpgUserManager.UserLoginQuery

function TpgUserManager.AllArchiUsersQuery: IdaTabledQuery;
//#UC START# *57514203013A_5629FC88034B_var*
//#UC END# *57514203013A_5629FC88034B_var*
begin
//#UC START# *57514203013A_5629FC88034B_impl*
 if f_AllArchiUsersQuery = nil then
 begin
  f_AllArchiUsersQuery := f_Factory.MakeTabledQuery(
   f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtUsers), 'u').Join(
    f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtPassword), 'p'),
    da_jkLeftOuter).SetCondition(f_Factory.MakeJoinCondition('u', TdaScheme.Instance.Table(da_mtUsers)['id'], 'p', TdaScheme.Instance.Table(da_mtPassword)['User_ID']))
  );
  f_AllArchiUsersQuery.AddSelectField(f_Factory.MakeSelectField('u', TdaScheme.Instance.Table(da_mtUsers)['id']));
  f_AllArchiUsersQuery.AddSelectField(f_Factory.MakeSelectField('u', TdaScheme.Instance.Table(da_mtUsers)['user_name']));
  f_AllArchiUsersQuery.AddSelectField(f_Factory.MakeSelectField('u', TdaScheme.Instance.Table(da_mtUsers)['active']));
  f_AllArchiUsersQuery.AddSelectField(f_Factory.MakeSelectField('p', TdaScheme.Instance.Table(da_mtPassword)['ShortName']));
  f_AllArchiUsersQuery.AddSelectField(f_Factory.MakeSelectField('p', TdaScheme.Instance.Table(da_mtPassword)['Password']));
  f_AllArchiUsersQuery.Prepare;
 end;
 Result := f_AllArchiUsersQuery;
//#UC END# *57514203013A_5629FC88034B_impl*
end;//TpgUserManager.AllArchiUsersQuery

function TpgUserManager.AllGroupsQuery: IdaTabledQuery;
//#UC START# *575809C5019A_5629FC88034B_var*
//#UC END# *575809C5019A_5629FC88034B_var*
begin
//#UC START# *575809C5019A_5629FC88034B_impl*
 if f_AllGroupsQuery = nil then
 begin
  f_AllGroupsQuery := f_Factory.MakeTabledQuery(f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtGroups)));
  f_AllGroupsQuery.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtGroups)['id']));
  f_AllGroupsQuery.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtGroups)['group_name']));
  f_AllGroupsQuery.AddOrderBy(f_Factory.MakeSortField(f_AllGroupsQuery.SelectFieldByName('group_name')));
  f_AllGroupsQuery.Prepare;
 end;
 Result := f_AllGroupsQuery;
//#UC END# *575809C5019A_5629FC88034B_impl*
end;//TpgUserManager.AllGroupsQuery

function TpgUserManager.IsMemberOfGroupQuery: IdaTabledQuery;
//#UC START# *575FA96B0019_5629FC88034B_var*
//#UC END# *575FA96B0019_5629FC88034B_var*
begin
//#UC START# *575FA96B0019_5629FC88034B_impl*
 if f_IsMemberOfGroupQuery = nil then
 begin
  f_IsMemberOfGroupQuery := f_Factory.MakeTabledQuery(f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtGroupMembers)));
  f_IsMemberOfGroupQuery.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtGroupMembers)['user_id']));
  f_IsMemberOfGroupQuery.WhereCondition := f_Factory.MakeLogicCondition(f_Factory.MakeParamsCondition('', TdaScheme.Instance.Table(da_mtGroupMembers)['user_id'], da_copEqual, 'p_UserID'), da_loAnd,
    f_Factory.MakeParamsCondition('', TdaScheme.Instance.Table(da_mtGroupMembers)['group_id'], da_copEqual, 'p_GroupID'));
  f_IsMemberOfGroupQuery.Prepare;
 end;
 Result := f_IsMemberOfGroupQuery;
//#UC END# *575FA96B0019_5629FC88034B_impl*
end;//TpgUserManager.IsMemberOfGroupQuery

function TpgUserManager.UserGroupsQuery: IdaTabledQuery;
//#UC START# *5762975302C1_5629FC88034B_var*
//#UC END# *5762975302C1_5629FC88034B_var*
begin
//#UC START# *5762975302C1_5629FC88034B_impl*
 if f_UserGroupsQuery = nil then
 begin
  f_UserGroupsQuery := f_Factory.MakeTabledQuery(f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtGroupMembers)));
  f_UserGroupsQuery.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtGroupMembers)['group_id']));
  f_UserGroupsQuery.WhereCondition := f_Factory.MakeParamsCondition('', TdaScheme.Instance.Table(da_mtGroupMembers)['user_id'], da_copEqual, 'p_UserID');
  f_UserGroupsQuery.Prepare;
 end;
 Result := f_UserGroupsQuery;
//#UC END# *5762975302C1_5629FC88034B_impl*
end;//TpgUserManager.UserGroupsQuery

procedure TpgUserManager.AddUserGroupWithID(anID: TdaUserGroupID;
 const aName: AnsiString);
//#UC START# *5770D18002D5_5629FC88034B_var*
var
 l_Modifier: TpgTableModifier;
//#UC END# *5770D18002D5_5629FC88034B_var*
begin
//#UC START# *5770D18002D5_5629FC88034B_impl*
 l_Modifier := GroupModifier.Use;
 try
  l_Modifier.BeginTransaction;
  try
   l_Modifier.Params['id'].AsLargeInt := anID;
   l_Modifier.Params['group_name'].AsString := aName;
   l_Modifier.Params['name_length'].AsInteger := Length(aName);
   l_Modifier.Params['import_priority'].AsInteger := 0;
   l_Modifier.Params['import_priority'].AsInteger := 0;
   l_Modifier.Insert;
   l_Modifier.CommitTransaction;
  except
   l_Modifier.RollBackTransaction;
   raise;
  end;
 finally
  FreeAndNil(l_Modifier);
 end;

 f_Journal.LogEditDict(TdaScheme.Instance.Table(da_mtGroups).FamilyID, da_dlNone, da_eoAdd);

 if f_AllGroups <> nil then
 begin
  f_AllGroups.NeedAllocStr:=True;
  f_AllGroups.Add(PAnsiChar(aName), @anID);
 end;
//#UC END# *5770D18002D5_5629FC88034B_impl*
end;//TpgUserManager.AddUserGroupWithID

function TpgUserManager.GroupModifier: TpgTableModifier;
//#UC START# *577CC28003A6_5629FC88034B_var*
//#UC END# *577CC28003A6_5629FC88034B_var*
begin
//#UC START# *577CC28003A6_5629FC88034B_impl*
 if f_GroupModifier = nil then
  f_GroupModifier := TpgTableModifier.Create(da_mtGroups, f_Connection, f_Factory.DataConverter);
 Result := f_GroupModifier;
//#UC END# *577CC28003A6_5629FC88034B_impl*
end;//TpgUserManager.GroupModifier

function TpgUserManager.GroupUsersQuery: IdaTabledQuery;
//#UC START# *5784910F00BF_5629FC88034B_var*
//#UC END# *5784910F00BF_5629FC88034B_var*
begin
//#UC START# *5784910F00BF_5629FC88034B_impl*
 if f_GroupUsersQuery = nil then
 begin
  f_GroupUsersQuery := f_Factory.MakeTabledQuery(f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtGroupMembers)));
  f_GroupUsersQuery.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtGroupMembers)['user_id']));
  f_GroupUsersQuery.WhereCondition := f_Factory.MakeParamsCondition('', TdaScheme.Instance.Table(da_mtGroupMembers)['group_id'], da_copEqual, 'p_GroupID');
  f_GroupUsersQuery.Prepare;
 end;
 Result := f_GroupUsersQuery;
//#UC END# *5784910F00BF_5629FC88034B_impl*
end;//TpgUserManager.GroupUsersQuery

procedure TpgUserManager.LoadFiltredUserList(aList: TStringList;
 aOnlyActive: Boolean);
//#UC START# *57AAF3DF0284_5629FC88034B_var*
var
 l_Query: IdaTabledQuery;
 l_ResultSet: IdaResultSet;
 l_IDField: IdaField;
 l_NameField: IdaField;
//#UC END# *57AAF3DF0284_5629FC88034B_var*
begin
//#UC START# *57AAF3DF0284_5629FC88034B_impl*
 aList.Clear;
 l_Query := f_Factory.MakeTabledQuery(f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtUsers), 'u'));
 try
  l_Query.WhereCondition := nil;
  if aOnlyActive then
   l_Query.WhereCondition := f_Factory.MakeBitWiseCondition('u', TdaScheme.Instance.Table(da_mtUsers)['active'], da_bwAnd, usActive);
  l_Query.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtUsers)['id']));
  l_Query.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtUsers)['user_name']));
  l_Query.Prepare;
  l_ResultSet := l_Query.OpenResultSet;
  try
   l_IDField := l_ResultSet.Field['id'];
   l_NameField := l_ResultSet.Field['user_name'];
   while not l_ResultSet.EOF do
   begin
    aList.AddObject(ConcatRegionAndUserNames(l_IDField.AsLargeInt,  l_NameField.AsString), TObject(l_IDField.AsLargeInt));
    l_ResultSet.Next;
   end;
  finally
   l_ResultSet := nil;
  end;
 finally
  l_Query := nil;
 end;
 aList.CustomSort(@CompareStringsUser);
//#UC END# *57AAF3DF0284_5629FC88034B_impl*
end;//TpgUserManager.LoadFiltredUserList

function TpgUserManager.CheckPassword(const aLogin: AnsiString;
 const aPassword: AnsiString;
 RequireAdminRights: Boolean;
 out theUserID: TdaUserID): TdaLoginError;
//#UC START# *5628D14D0151_5629FC88034B_var*
var
 l_ResultSet: IdaResultSet;
 l_Flags: Byte;
//#UC END# *5628D14D0151_5629FC88034B_var*
begin
//#UC START# *5628D14D0151_5629FC88034B_impl*
 theUserID := 0;
 Result := da_leUserParamsWrong;
 if (AnsiLowerCase(aLogin) = c_SupervisorUserName) and not RequireAdminRights then
  Exit;
 f_PasswordQuery.Param['p_ShortName'].AsString := aLogin;
 l_ResultSet := f_PasswordQuery.OpenResultSet;
 try
  if l_ResultSet.IsEmpty then
    Exit;
  if (l_ResultSet.Field['Password'].AsString <> '') and (not AnsiSameText(l_ResultSet.Field['Password'].AsString, aPassword)) then
    Exit;
  theUserID := l_ResultSet.Field['User_ID'].AsLargeInt;
  f_UserFlagsQuery.Param['p_UserID'].AsLargeInt := theUserID;
 finally
  l_ResultSet := nil;
 end;

 if theUserID <> usSupervisor then
 begin
  l_ResultSet := f_UserFlagsQuery.OpenResultSet;
  try
   l_Flags := l_ResultSet.Field['Active'].AsByte;
   if (l_Flags and usActive) <> usActive then
    Exit;
   if RequireAdminRights and ((l_Flags and usAdmin) <> usAdmin) then
   begin
    Result := da_leInsufficientRights;
    Exit;
   end;
   Result := da_leOk;

  finally
   l_ResultSet := nil;
  end;
 end
 else
  Result := da_leOk;
//#UC END# *5628D14D0151_5629FC88034B_impl*
end;//TpgUserManager.CheckPassword

function TpgUserManager.IsUserAdmin(anUserID: TdaUserID): Boolean;
//#UC START# *56EA993D0218_5629FC88034B_var*
var
 l_ResultSet: IdaResultSet;
//#UC END# *56EA993D0218_5629FC88034B_var*
begin
//#UC START# *56EA993D0218_5629FC88034B_impl*
 Result := (anUserID = usSupervisor);
 if not Result then
 begin
  f_UserFlagsQuery.Param['p_UserID'].AsLargeInt := anUserID;
  l_ResultSet := f_UserFlagsQuery.OpenResultSet;
  try
   Result := not l_ResultSet.IsEmpty and ((l_ResultSet.Field['Active'].AsByte and usAdmin) = usAdmin);
  finally
   l_ResultSet := nil;
  end;
 end;
//#UC END# *56EA993D0218_5629FC88034B_impl*
end;//TpgUserManager.IsUserAdmin

function TpgUserManager.Get_AllUsers: Tl3StringDataList;
//#UC START# *5715DEF20209_5629FC88034Bget_var*
//#UC END# *5715DEF20209_5629FC88034Bget_var*
begin
//#UC START# *5715DEF20209_5629FC88034Bget_impl*
 if f_AllUsers = nil then
 begin
  f_AllUsers := Tl3StringDataList.Create;
  FillAllUsers(f_AllUsers);
  SortUsersInList(f_AllUsers);
 end;
 Result:=f_AllUsers;
//#UC END# *5715DEF20209_5629FC88034Bget_impl*
end;//TpgUserManager.Get_AllUsers

function TpgUserManager.Get_AllGroups: Tl3StringDataList;
//#UC START# *5715DF0D03C2_5629FC88034Bget_var*
//#UC END# *5715DF0D03C2_5629FC88034Bget_var*
begin
//#UC START# *5715DF0D03C2_5629FC88034Bget_impl*
 if f_AllGroups = nil then
 begin
  f_AllGroups := Tl3StringDataList.Create;
  FillAllGroups(f_AllGroups);
 end;
 Result := f_AllGroups;
//#UC END# *5715DF0D03C2_5629FC88034Bget_impl*
end;//TpgUserManager.Get_AllGroups

function TpgUserManager.GetUserName(anUserID: TdaUserID): AnsiString;
//#UC START# *5718B5CF0399_5629FC88034B_var*
var
 l_ResultSet: IdaResultSet;
//#UC END# *5718B5CF0399_5629FC88034B_var*
begin
//#UC START# *5718B5CF0399_5629FC88034B_impl*
 UserNameQuery.Param['p_UserID'].AsLargeInt := anUserID;
 l_ResultSet := UserNameQuery.OpenResultSet;
 try
  Result := l_ResultSet.Field['user_name'].AsString;
 finally
  l_ResultSet := nil;
 end;
//#UC END# *5718B5CF0399_5629FC88034B_impl*
end;//TpgUserManager.GetUserName

function TpgUserManager.GetUserPriorities(aGroupId: TdaUserID;
 var aImportPriority: TdaPriority;
 var aExportPriority: TdaPriority): Boolean;
//#UC START# *571DCFB50217_5629FC88034B_var*
var
 l_Query: IdaTabledQuery;
 l_ResultSet: IdaResultSet;
//#UC END# *571DCFB50217_5629FC88034B_var*
begin
//#UC START# *571DCFB50217_5629FC88034B_impl*
 l_Query := f_Factory.MakeTabledQuery(f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtGroups)));
 try
  l_Query.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtGroups)['import_priority']));
  l_Query.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtGroups)['export_priority']));
  l_Query.WhereCondition := f_Factory.MakeParamsCondition('', TdaScheme.Instance.Table(da_mtGroups)['ID'], da_copEqual, 'p_GroupID');
  l_Query.Prepare;
  l_Query.Param['p_GroupID'].AsLargeInt := aGroupId;
  l_ResultSet := l_Query.OpenResultSet;
  try
   Result := not l_ResultSet.IsEmpty;
   if Result then
   begin
    aImportPriority := TdaPriority(l_ResultSet.Field['import_priority'].AsInteger);
    aExportPriority := TdaPriority(l_ResultSet.Field['export_priority'].AsInteger);
   end;
  finally
   l_ResultSet := nil;
  end;
 finally
  l_Query := nil;
 end;
//#UC END# *571DCFB50217_5629FC88034B_impl*
end;//TpgUserManager.GetUserPriorities

procedure TpgUserManager.ReSortUserList;
//#UC START# *5721F5E60367_5629FC88034B_var*
//#UC END# *5721F5E60367_5629FC88034B_var*
begin
//#UC START# *5721F5E60367_5629FC88034B_impl*
 if f_AllUsers <> nil then
  SortUsersInList(f_AllUsers);
//#UC END# *5721F5E60367_5629FC88034B_impl*
end;//TpgUserManager.ReSortUserList

function TpgUserManager.Get_ArchiUsersCount: Integer;
//#UC START# *5729C59E00D5_5629FC88034Bget_var*
//#UC END# *5729C59E00D5_5629FC88034Bget_var*
begin
//#UC START# *5729C59E00D5_5629FC88034Bget_impl*
 if f_ArchiUsers.Count = 0 then
  MakeFullArchiUsersList;
 Result := f_ArchiUsers.Count;
//#UC END# *5729C59E00D5_5629FC88034Bget_impl*
end;//TpgUserManager.Get_ArchiUsersCount

procedure TpgUserManager.IterateArchiUsersF(anAction: ArchiUsersIterator_IterateArchiUsersF_Action);
//#UC START# *5729DD530330_5629FC88034B_var*

 type
  PIdaArchiUser = ^IdaArchiUser;

 function DoIt(aData : PIdaArchiUser; anIndex : Integer) : Boolean;
 begin
  Result := anAction(aData^);
 end;

//#UC END# *5729DD530330_5629FC88034B_var*
begin
//#UC START# *5729DD530330_5629FC88034B_impl*
 f_ArchiUsers.IterateAllF(l3L2IA(@DoIt));
//#UC END# *5729DD530330_5629FC88034B_impl*
end;//TpgUserManager.IterateArchiUsersF

function TpgUserManager.UserByID(aID: TdaUserID): IdaArchiUser;
//#UC START# *57358B940211_5629FC88034B_var*
var
 i: Integer;
 l_AU: IdaArchiUser;
//#UC END# *57358B940211_5629FC88034B_var*
begin
//#UC START# *57358B940211_5629FC88034B_impl*
 Result := nil;
 if f_ArchiUsers.Count = 0 then
  MakeFullArchiUsersList;

 for i := 0 to f_ArchiUsers.Hi do
 begin
  l_AU := f_ArchiUsers.Items[i];
  if l_AU.ID = aID then
  begin
   Result := l_AU;
   break;
  end;
 end
//#UC END# *57358B940211_5629FC88034B_impl*
end;//TpgUserManager.UserByID

function TpgUserManager.UserByLogin(const aLogin: AnsiString): IdaArchiUser;
//#UC START# *57358BCB0360_5629FC88034B_var*
var
 i: Integer;
 l_AU: IdaArchiUser;
//#UC END# *57358BCB0360_5629FC88034B_var*
begin
//#UC START# *57358BCB0360_5629FC88034B_impl*
 Result := nil;
 if f_ArchiUsers.Count = 0 then
  MakeFullArchiUsersList;

 for i := 0 to f_ArchiUsers.Hi do
 begin
  l_AU := f_ArchiUsers.Items[i];
  if CompareText(l_AU.LoginName, aLogin) = 0 then
  begin
   Result := l_AU;
   break;
  end;
 end
//#UC END# *57358BCB0360_5629FC88034B_impl*
end;//TpgUserManager.UserByLogin

procedure TpgUserManager.UpdateUserInfo(aUserID: TdaUserID;
 aIsGroup: Boolean);
//#UC START# *5735AE4D0017_5629FC88034B_var*
//#UC END# *5735AE4D0017_5629FC88034B_var*
begin
//#UC START# *5735AE4D0017_5629FC88034B_impl*
 MakeFullArchiUsersList;
(*
 if not aIsGroup then
 begin
  GetUserInfo(aUserID, l_Username, l_LoginName, l_AFlag);

  l_AU:= xxxUserByID(aUserID);
  if l_AU = nil then
  begin
   l_AU:= IdaArchiUser.Make(CalcUserPriorities);
   try
    l_AU.ID:= aUserID;
    l_AU.UserName:= l_UserName;
    l_AU.LoginName:= l_LoginName;
    l_AU.Active := Boolean(l_AFlag);

   finally
    l3Free(l_AU);
   end;
  end;
 end;
*)
//#UC END# *5735AE4D0017_5629FC88034B_impl*
end;//TpgUserManager.UpdateUserInfo

procedure TpgUserManager.MakeFullArchiUsersList;
//#UC START# *5735AE7F0071_5629FC88034B_var*
var
 l_ResultSet: IdaResultSet;
 l_IDField: IdaField;
 l_NameField: IdaField;
 l_LoginField: IdaField;
 l_PasswordField: IdaField;
 l_FlagsField: IdaField;
 l_UserInfo : IdaArchiUser;
//#UC END# *5735AE7F0071_5629FC88034B_var*
begin
//#UC START# *5735AE7F0071_5629FC88034B_impl*
 l_ResultSet := AllArchiUsersQuery.OpenResultSet;
 try
  l_IDField := l_ResultSet.Field['id'];
  l_NameField := l_ResultSet.Field['user_name'];
  l_LoginField := l_ResultSet.Field['ShortName'];
  l_PasswordField := l_ResultSet.Field['Password'];
  l_FlagsField := l_ResultSet.Field['active'];

  while not l_ResultSet.EOF do
  begin
   l_UserInfo := TdaArchiUser.Make(Get_PriorityCalculator);
   try
    l_UserInfo.ID := l_IDField.AsLargeInt;
    l_UserInfo.UserName := l_NameField.AsString;
    l_UserInfo.LoginName:= l_LoginField.AsString;
    l_UserInfo.Password := l_PasswordField.AsString;
    l_UserInfo.Active := (l_FlagsField.AsByte and usActive) = usActive;
    l_UserInfo.HasAdminRights := (l_UserInfo.ID = usSupervisor) or ((l_FlagsField.AsByte and usAdmin) = usAdmin);
    f_ArchiUsers.Add(l_UserInfo);
   finally
    l_UserInfo := nil;
   end;
   l_ResultSet.Next;
  end;
 finally
  l_ResultSet := nil;
 end;
//#UC END# *5735AE7F0071_5629FC88034B_impl*
end;//TpgUserManager.MakeFullArchiUsersList

function TpgUserManager.GetUserDisplayName(anID: TdaUserID): AnsiString;
//#UC START# *5735AECA0121_5629FC88034B_var*
var
 l_Name  : AnsiString;
 l_Flags : Byte;
 lUser : IdaArchiUser;
//#UC END# *5735AECA0121_5629FC88034B_var*
begin
//#UC START# *5735AECA0121_5629FC88034B_impl*
 lUser := UserByID(anID);
 if lUser <> nil then
  l_Name := lUser.UserName;
 if l_Name = '' then
  l_Name := '������������ #'+ IntToStr(anID);

 Result := ConcatRegionAndUserNames(GetRegionStringFromUserID(anID), l_Name);
//#UC END# *5735AECA0121_5629FC88034B_impl*
end;//TpgUserManager.GetUserDisplayName

function TpgUserManager.IsUserExists(anID: TdaUserID): Boolean;
//#UC START# *5739732402E4_5629FC88034B_var*
var
 l_ResultSet: IdaResultSet;
//#UC END# *5739732402E4_5629FC88034B_var*
begin
//#UC START# *5739732402E4_5629FC88034B_impl*
 UserNameQuery.Param['p_UserID'].AsLargeInt := anID;
 l_ResultSet := UserNameQuery.OpenResultSet;
 try
  Result := not l_ResultSet.IsEmpty;
 finally
  l_ResultSet := nil;
 end;
//#UC END# *5739732402E4_5629FC88034B_impl*
end;//TpgUserManager.IsUserExists

procedure TpgUserManager.RegisterUserStatusChangedSubscriber(const aSubscriber: IdaUserStatusChangedSubscriber);
//#UC START# *5739832A00A2_5629FC88034B_var*
//#UC END# *5739832A00A2_5629FC88034B_var*
begin
//#UC START# *5739832A00A2_5629FC88034B_impl*
 if f_UserStatusChangedSubscriberList.IndexOf(aSubscriber) = -1 then
  f_UserStatusChangedSubscriberList.Add(aSubscriber);
//#UC END# *5739832A00A2_5629FC88034B_impl*
end;//TpgUserManager.RegisterUserStatusChangedSubscriber

procedure TpgUserManager.UnRegisterUserStatusChangedSubscriber(const aSubscriber: IdaUserStatusChangedSubscriber);
//#UC START# *5739834700B2_5629FC88034B_var*
//#UC END# *5739834700B2_5629FC88034B_var*
begin
//#UC START# *5739834700B2_5629FC88034B_impl*
 f_UserStatusChangedSubscriberList.Remove(aSubscriber);
//#UC END# *5739834700B2_5629FC88034B_impl*
end;//TpgUserManager.UnRegisterUserStatusChangedSubscriber

procedure TpgUserManager.NotifyUserActiveChanged(anUserID: TdaUserID;
 anActive: Boolean);
//#UC START# *5739835200CF_5629FC88034B_var*

 type
  PIdaUserStatusChangedSubscriber = ^IdaUserStatusChangedSubscriber;

 function DoIt(aData : PIdaUserStatusChangedSubscriber; anIndex : Integer) : Boolean;
 begin
  aData^.UserStatusChanged(anUserID, anActive);
  Result := True;
 end;

//#UC END# *5739835200CF_5629FC88034B_var*
begin
//#UC START# *5739835200CF_5629FC88034B_impl*
 f_UserStatusChangedSubscriberList.IterateAllF(l3L2IA(@DoIt));
//#UC END# *5739835200CF_5629FC88034B_impl*
end;//TpgUserManager.NotifyUserActiveChanged

function TpgUserManager.CSCheckPassword(const aLogin: AnsiString;
 const aPassword: AnsiString;
 RequireAdminRights: Boolean;
 out theUserID: TdaUserID): Boolean;
//#UC START# *573AC17202BF_5629FC88034B_var*
var
 l_AU: IdaArchiUser;
 l_HasAdminRights: Boolean;
//#UC END# *573AC17202BF_5629FC88034B_var*
begin
//#UC START# *573AC17202BF_5629FC88034B_impl*
 Result := False;
 if (AnsiLowerCase(aLogin) = c_SupervisorUserName) and not RequireAdminRights then
  Exit;
 l_AU := UserByLogin(aLogin);
 if l_AU <> nil then
 begin
  Result := l_AU.Active and ((l_AU.Password = '') or (AnsiCompareText(aPassword, l_AU.Password) = 0));
  if Result and RequireAdminRights then
   Result := l_AU.HasAdminRights;
  if Result then
  begin
   l_AU.LoginDate := Now;
   theUserID := l_AU.ID;
  end;
 end; // l_AU <> nil
//#UC END# *573AC17202BF_5629FC88034B_impl*
end;//TpgUserManager.CSCheckPassword

procedure TpgUserManager.GetUserInfo(aUser: TdaUserID;
 var aUserName: AnsiString;
 var aLoginName: AnsiString;
 var aActFlag: Byte);
//#UC START# *573AEE9902DF_5629FC88034B_var*
var
 l_ResultSet: IdaResultSet;
//#UC END# *573AEE9902DF_5629FC88034B_var*
begin
//#UC START# *573AEE9902DF_5629FC88034B_impl*
 UserLoginQuery.Param['p_UserID'].AsLargeInt := aUser;
 l_ResultSet := UserLoginQuery.OpenResultSet;
 try
  if not l_ResultSet.IsEmpty then
   aLoginName := l_ResultSet.Field['ShortName'].AsString
  else
   aLoginName := c_UnknownLogin;
 finally
  l_ResultSet := nil;
 end;
 f_UserFlagsQuery.Param['p_UserID'].AsLargeInt := aUser;
 l_ResultSet := f_UserFlagsQuery.OpenResultSet;
 try
  if not l_ResultSet.IsEmpty then
  begin
   aUserName := l_ResultSet.Field['user_name'].AsString;
   aActFlag := l_ResultSet.Field['Active'].AsByte;
  end
  else
  begin
   aUserName := Format(c_UnknownUserName, [GetRegionStringFromUserID(aUser), aUser]);
   aActFlag := 0; // �� �������� � �� �����
  end;
 finally
  l_ResultSet := nil;
 end;
//#UC END# *573AEE9902DF_5629FC88034B_impl*
end;//TpgUserManager.GetUserInfo

function TpgUserManager.Get_PriorityCalculator: IdaPriorityCalculator;
//#UC START# *575020410175_5629FC88034Bget_var*
//#UC END# *575020410175_5629FC88034Bget_var*
begin
//#UC START# *575020410175_5629FC88034Bget_impl*
 if f_PriorityCalculator = nil then
  f_PriorityCalculator := TpgPriorityCalculator.Make(f_Factory);
 Result := f_PriorityCalculator;
//#UC END# *575020410175_5629FC88034Bget_impl*
end;//TpgUserManager.Get_PriorityCalculator

procedure TpgUserManager.IterateUserGroupsF(anAction: ArchiUsersIterator_IterateUserGroupsF_Action);
//#UC START# *5757D9BB0116_5629FC88034B_var*
var
 Hack : Pointer absolute anAction;
 l_ResultSet: IdaResultSet;
 l_IDField: IdaField;
 l_NameField: IdaField;
//#UC END# *5757D9BB0116_5629FC88034B_var*
begin
//#UC START# *5757D9BB0116_5629FC88034B_impl*
 try
  l_ResultSet := AllGroupsQuery.OpenResultSet;
  try
   l_IDField := l_ResultSet.Field['id'];
   l_NameField := l_ResultSet.Field['group_name'];
   while not l_ResultSet.EOF do
   begin
    if not anAction(l_NameField.AsString, l_IDField.AsInteger) then
     break;
    l_ResultSet.Next;
   end;
  finally
   l_ResultSet := nil;
  end;
 finally
  l3FreeLocalStub(Hack);
 end;//try..finally
//#UC END# *5757D9BB0116_5629FC88034B_impl*
end;//TpgUserManager.IterateUserGroupsF

function TpgUserManager.IsMemberOfGroup(aUserGroupID: TdaUserGroupID;
 aUserID: TdaUserID): Boolean;
//#UC START# *575A8B790353_5629FC88034B_var*
var
 l_ResultSet: IdaResultSet;
//#UC END# *575A8B790353_5629FC88034B_var*
begin
//#UC START# *575A8B790353_5629FC88034B_impl*
 IsMemberOfGroupQuery.Param['p_UserID'].AsLargeInt := aUserID;
 IsMemberOfGroupQuery.Param['p_GroupID'].AsLargeInt := aUserGroupID;
 l_ResultSet := IsMemberOfGroupQuery.OpenResultSet;
 try
  Result := not l_ResultSet.IsEmpty;
 finally
  l_ResultSet := nil;
 end;
//#UC END# *575A8B790353_5629FC88034B_impl*
end;//TpgUserManager.IsMemberOfGroup

function TpgUserManager.GetUserGroups(aUserID: TdaUserID): TdaUserGroupIDArray;
//#UC START# *57625B5002DD_5629FC88034B_var*
var
 l_ResultSet: IdaResultSet;
 l_Field: IdaField;
 l_IDX: Integer;
//#UC END# *57625B5002DD_5629FC88034B_var*
begin
//#UC START# *57625B5002DD_5629FC88034B_impl*
 UserGroupsQuery.Param['p_UserID'].AsLargeInt := aUserID;
 l_ResultSet := UserGroupsQuery.OpenResultSet(False);
 try
  if l_ResultSet.IsEmpty then
   Result := nil
  else
  begin
   SetLength(Result, l_ResultSet.CalcRecordCount);
   l_IDX := 0;
   l_Field := l_ResultSet.Field['group_id'];
   while not l_ResultSet.EOF do
   begin
    Assert(l_IDX < Length(Result));
    Result[l_IDX] := l_Field.AsLargeInt;
    inc(l_IDX);
    l_ResultSet.Next;
   end;
  end;
 finally
  l_ResultSet := nil;
 end;
//#UC END# *57625B5002DD_5629FC88034B_impl*
end;//TpgUserManager.GetUserGroups

procedure TpgUserManager.GetUserGroupsList(aUser: TdaUserID;
 aList: Tl3StringDataList);
//#UC START# *576289510024_5629FC88034B_var*
var
 l_ResultSet: IdaResultSet;
 l_TmpIndex: LongInt;
 l_TmpID: TdaUserGroupID;
 l_Field: IdaField;
//#UC END# *576289510024_5629FC88034B_var*
begin
//#UC START# *576289510024_5629FC88034B_impl*
 aList.Changing;
 aList.LockModifiedFlag:=True;
 try
  aList.Clear;
  aList.HostDataList := Get_AllGroups;
  UserGroupsQuery.Param['p_UserID'].AsLargeInt := aUser;
  l_ResultSet := UserGroupsQuery.OpenResultSet;
  try
   l_Field := l_ResultSet.Field['group_id'];
   while not l_ResultSet.EOF do
   begin
    l_TmpID := l_Field.AsLargeInt;
    l_TmpIndex := aList.IndexOfData(l_TmpID, cGroupIDSize, 0);
    if l_TmpIndex <> -1 then
     aList.Select[l_TmpIndex]:=True;
    l_ResultSet.Next;
   end;
  finally
   l_ResultSet := nil;
  end;
 finally
  aList.Changed;
  aList.LockModifiedFlag := False;
 end;
//#UC END# *576289510024_5629FC88034B_impl*
end;//TpgUserManager.GetUserGroupsList

procedure TpgUserManager.GetUserGroupsList(aUser: TdaUserID;
 aList: Tl3LongintList);
//#UC START# *57628A9403C6_5629FC88034B_var*
var
 l_ResultSet: IdaResultSet;
 l_TmpID: TdaUserGroupID;
 l_Field: IdaField;
//#UC END# *57628A9403C6_5629FC88034B_var*
begin
//#UC START# *57628A9403C6_5629FC88034B_impl*
 //aList.Changing;
 try
  aList.Clear;
  UserGroupsQuery.Param['p_UserID'].AsLargeInt := aUser;
  l_ResultSet := UserGroupsQuery.OpenResultSet;
  try
   l_Field := l_ResultSet.Field['group_id'];
   while not l_ResultSet.EOF do
   begin
    l_TmpID := l_Field.AsLargeInt;
    aList.Add(l_TmpID);
    l_ResultSet.Next;
   end;
  finally
   l_ResultSet := nil;
  end;
 finally
 //aList.Changed;
 end;
//#UC END# *57628A9403C6_5629FC88034B_impl*
end;//TpgUserManager.GetUserGroupsList

procedure TpgUserManager.SetUserGroupsList(aUser: TdaUserID;
 aList: Tl3StringDataList);
//#UC START# *5767ABE002DC_5629FC88034B_var*
var
 l_IDX: Integer;
 l_Modifier: TpgTableModifier;
 l_GroupID: TdaUserGroupID;
//#UC END# *5767ABE002DC_5629FC88034B_var*
begin
//#UC START# *5767ABE002DC_5629FC88034B_impl*
 l_Modifier := TpgTableModifier.Create(da_mtGroupMembers, f_Connection, f_Factory.DataConverter);
 try
  l_Modifier.BeginTransaction;
  try
   RemoveUserFromAllGroups(aUser);
   for l_IDX := 0 to aList.Count-1 do
    if aList.Select[l_IDX] then
    begin
     l_GroupID := 0;
     l3Move(aList.Data[l_IDX]^, l_GroupID, Min(SizeOf(l_GroupID), aList.DataSize));
     l_Modifier.Params['user_id'].AsLargeInt := aUser;
     l_Modifier.Params['group_id'].AsLargeInt := l_GroupID;
     l_Modifier.Insert;
   end;
   l_Modifier.CommitTransaction;
  except
   l_Modifier.RollBackTransaction;
   raise;
  end;
 finally
  FreeAndNil(l_Modifier);
 end;
//#UC END# *5767ABE002DC_5629FC88034B_impl*
end;//TpgUserManager.SetUserGroupsList

function TpgUserManager.AddUserGroup(const aName: AnsiString): TdaUserGroupID;
//#UC START# *576B95A600B9_5629FC88034B_var*
//#UC END# *576B95A600B9_5629FC88034B_var*
begin
//#UC START# *576B95A600B9_5629FC88034B_impl*
 Result := f_FreeIDHelperHolder.GetFree(da_mtGroups);
 AddUserGroupWithID(Result, aName);
//#UC END# *576B95A600B9_5629FC88034B_impl*
end;//TpgUserManager.AddUserGroup

procedure TpgUserManager.EditUserGroup(aGroupID: TdaUserGroupID;
 const aName: AnsiString;
 aImportPriority: TdaPriority;
 aExportPriority: TdaPriority);
//#UC START# *576B960500C5_5629FC88034B_var*
Var
 l_IDX : LongInt;
 l_Modifier: TpgTableModifier;
//#UC END# *576B960500C5_5629FC88034B_var*
begin
//#UC START# *576B960500C5_5629FC88034B_impl*
 l_Modifier := GroupModifier.Use;
 try
  l_Modifier.BeginTransaction;
  try
   l_Modifier.OldParams['id'].AsLargeInt := aGroupID;
   l_Modifier.Params['group_name'].AsString := aName;
   l_Modifier.Params['name_length'].AsInteger := Length(aName);
   l_Modifier.Params['import_priority'].AsInteger := Ord(aImportPriority);
   l_Modifier.Params['export_priority'].AsInteger := Ord(aExportPriority);
   l_Modifier.Update;
   l_Modifier.CommitTransaction;
  except
   l_Modifier.RollBackTransaction;
   raise;
  end;
 finally
  FreeAndNil(l_Modifier);
 end;

 f_Journal.LogEditDict(TdaScheme.Instance.Table(da_mtGroups).FamilyID, da_dlNone, da_eoEdit);

 (*
//!! !!! ��� � ������ � ��������!!
 if Assigned(fItemList) then
  if fItemList.FindData(aID,tmpIndex) then
   TDictITem(fItemList.Items[tmpIndex]).SetSt(aName,StrLen(aName));
*)

 if f_AllGroups <> nil then
 begin
  l_IDX := f_AllGroups.IndexOfData(aGroupID, SizeOf(TdaUserGroupID), 0);
  f_AllGroups.NeedAllocStr := True;
  if aName <> '' then
   f_AllGroups.Strings[l_IDX] := @aName[1]
  else
   f_AllGroups.Strings[l_IDX] := nil;
 end;
//#UC END# *576B960500C5_5629FC88034B_impl*
end;//TpgUserManager.EditUserGroup

procedure TpgUserManager.DelUserGroup(aGroupID: TdaUserGroupID);
//#UC START# *576BAC4402D8_5629FC88034B_var*
Var
 l_IDX : LongInt;
 l_Modifier: TpgTableModifier;
 l_Function: IdaFunction;
//#UC END# *576BAC4402D8_5629FC88034B_var*
begin
//#UC START# *576BAC4402D8_5629FC88034B_impl*
 try
  if f_Connection.BeginTransaction([da_mtGroups, da_mtFree, da_mtGroupMembers, da_mtAccess]) then
   try

//   AccessServer.fMaskTbl.DelUserGroup(aUsGroupID); - ����� �������� � ������������ - HT ��� ������ � ����� ������� ���.
//!! !!! Needs to be implemented !!!

    l_Function := f_FunctionFactory.MakeFunction('delete_all_users_from_group');
    try
      l_Function.Param['p_group_id'].AsLargeInt := aGroupID;
      l_Function.Execute;
    finally
      l_Function := nil;
    end;

    l_Modifier := GroupModifier.Use;
    try
     l_Modifier.OldParams['id'].AsLargeInt := aGroupID;
     l_Modifier.Delete;
    finally
     FreeAndNil(l_Modifier);
    end;
    f_Journal.LogEditDict(TdaScheme.Instance.Table(da_mtGroups).FamilyID, da_dlNone, da_eoDelete);
    f_FreeIDHelperHolder.PutFree(da_mtGroups, aGroupID);
    f_Connection.CommitTransaction;
   except
    f_Connection.RollBackTransaction;
    raise;
   end
  else
   raise EpgError.Create('������� ���������, ���������� �����');
 finally
  FreeAndNil(f_AllGroups);
 end;
//#UC END# *576BAC4402D8_5629FC88034B_impl*
end;//TpgUserManager.DelUserGroup

procedure TpgUserManager.AddUserGroupShadow(anID: TdaUserGroupID;
 const aName: AnsiString);
//#UC START# *576D17770327_5629FC88034B_var*
//#UC END# *576D17770327_5629FC88034B_var*
begin
//#UC START# *576D17770327_5629FC88034B_impl*
 AddUserGroupWithID(anID, aName);
 f_FreeIDHelperHolder.ExcludeFree(da_mtGroups, anID);
//#UC END# *576D17770327_5629FC88034B_impl*
end;//TpgUserManager.AddUserGroupShadow

procedure TpgUserManager.RemoveUserFromAllGroups(aUser: TdaUserID);
//#UC START# *577F6AD90170_5629FC88034B_var*
var
 l_Function: IdaFunction;
//#UC END# *577F6AD90170_5629FC88034B_var*
begin
//#UC START# *577F6AD90170_5629FC88034B_impl*
 l_Function := f_FunctionFactory.MakeFunction('delete_user_from_all_groups');
 try
   l_Function.Param['p_user_id'].AsLargeInt := aUser;
   l_Function.Execute;
 finally
   l_Function := nil;
 end;
//#UC END# *577F6AD90170_5629FC88034B_impl*
end;//TpgUserManager.RemoveUserFromAllGroups

procedure TpgUserManager.SetUserGroup(aUser: TdaUserID;
 aGroup: TdaUserGroupID;
 Add: Boolean = True);
//#UC START# *577F80C503AF_5629FC88034B_var*
var
 l_Modifier: TpgTableModifier;
//#UC END# *577F80C503AF_5629FC88034B_var*
begin
//#UC START# *577F80C503AF_5629FC88034B_impl*
 l_Modifier := TpgTableModifier.Create(da_mtGroupMembers, f_Connection, f_Factory.DataConverter);
 try
  l_Modifier.Params['user_id'].AsLargeInt := aUser;
  l_Modifier.Params['group_id'].AsLargeInt := aGroup;
  if Add then
   l_Modifier.Insert
  else
   l_Modifier.Delete;
 finally
  FreeAndNil(l_Modifier);
 end;
//#UC END# *577F80C503AF_5629FC88034B_impl*
end;//TpgUserManager.SetUserGroup

procedure TpgUserManager.AdminChangePassWord(aUser: TdaUserID;
 const NewPass: AnsiString);
//#UC START# *5783537E00A1_5629FC88034B_var*
var
 l_Function: IdaFunction;
//#UC END# *5783537E00A1_5629FC88034B_var*
begin
//#UC START# *5783537E00A1_5629FC88034B_impl*
 if not GlobalDataProvider.AdminRights then
  raise EpgError.Create('��� ���� ��� �������');
 l_Function := f_FunctionFactory.MakeFunction('change_password');
 try
  l_Function.Param['p_user_id'].AsLargeInt := aUser;
  l_Function.Param['p_new_password'].AsString := AnsiUpperCase(NewPass);
  l_Function.Execute;
  if l_Function.Param[l_Function.Name+'.Result'].AsInteger <> 1 then
   raise EpgError.Create('������� �� ������');
 finally
  l_Function := nil;
 end;
//#UC END# *5783537E00A1_5629FC88034B_impl*
end;//TpgUserManager.AdminChangePassWord

procedure TpgUserManager.GetHostUserListOnGroup(aGroupID: TdaUserGroupID;
 aList: Tl3StringDataList;
 NeedSort: Boolean = False);
//#UC START# *578392E7026A_5629FC88034B_var*
Var
 TmpID,
 TmpIndex : LongInt;
 l_ResultSet: IdaResultSet;
 l_Field: IdaField;
//#UC END# *578392E7026A_5629FC88034B_var*
begin
//#UC START# *578392E7026A_5629FC88034B_impl*
 if f_AllUsers = nil then
  Get_AllUsers;
 if NeedSort then
  f_AllUsers.Sort;
 try
  aList.Clear;
  aList.HostDataList := f_AllUsers;
  if aGroupID <> 0 then
  begin
   GroupUsersQuery.Param['p_GroupID'].AsLargeInt := aGroupID;
   l_ResultSet := GroupUsersQuery.OpenResultSet;
   try
    l_Field := l_ResultSet.Field['user_id'];
    aList.LockModifiedFlag:=True;
    while not l_ResultSet.EOF do
    begin
     TmpID := l_Field.AsLargeInt;
     TmpIndex:=aList.IndexOfData(TmpID, aList.DataSize, 0);
     if TmpIndex<>-1 then
      aList.Select[TmpIndex]:=True;
     l_ResultSet.Next;
    end;
    aList.LockModifiedFlag:=False;
   finally
    l_ResultSet := nil;
   end;
  end;
 finally
  if NeedSort then
   ReSortUserList;
 end;
//#UC END# *578392E7026A_5629FC88034B_impl*
end;//TpgUserManager.GetHostUserListOnGroup

procedure TpgUserManager.SetHostUserListOnGroup(aGroupID: TdaUserGroupID;
 aList: Tl3StringDataList);
//#UC START# *5783933A010B_5629FC88034B_var*
var
 l_IDX: Integer;
 aID : LongInt;
//#UC END# *5783933A010B_5629FC88034B_var*
begin
//#UC START# *5783933A010B_5629FC88034B_impl*
 for l_IDX := 0 to aList.Count-1 do
  if aList.Flags[l_IDX] and lfSelModified = lfSelModified then
  begin
   aID:=0;
   l3Move(aList.Data[l_IDX]^, aID, aList.DataSize);
   SetUserGroup(aID, aGroupID, aList.Select[l_IDX]);
   with aList do
   begin
    LockSelModify;
    try
     Flags[l_IDX] := Flags[l_IDX] and not lfSelModified;
    finally
     UnLockSelModify;
    end;
   end;
  end;
//#UC END# *5783933A010B_5629FC88034B_impl*
end;//TpgUserManager.SetHostUserListOnGroup

function TpgUserManager.AddUser(const aUserName: AnsiString;
 const aLoginName: AnsiString;
 const aPassword: AnsiString;
 ActFlag: Byte): TdaUserID;
//#UC START# *5784BBF10299_5629FC88034B_var*
//#UC END# *5784BBF10299_5629FC88034B_var*
begin
//#UC START# *5784BBF10299_5629FC88034B_impl*
 Result := AddUserID(0, aUserName, aLoginName, aPassword, ActFlag);
//#UC END# *5784BBF10299_5629FC88034B_impl*
end;//TpgUserManager.AddUser

function TpgUserManager.AddUserID(anID: TdaUserID;
 const aUserName: AnsiString;
 const aLoginName: AnsiString;
 const aPassword: AnsiString;
 ActFlag: Byte): TdaUserID;
//#UC START# *5784BC420208_5629FC88034B_var*
var
 l_UserName: String;
 l_Region: TdaRegionID;
 l_Modifier: TpgTableModifier;
//#UC END# *5784BC420208_5629FC88034B_var*
begin
//#UC START# *5784BC420208_5629FC88034B_impl*
 if IsUserExists(anID) then
  raise EpgError.Create('������������� ��� ������������');
 Result := anID;

 if f_Connection.BeginTransaction([da_mtUsers, da_mtFree, da_mtPassword]) then
 begin
  try
   // � ������� FREE �������� ID ������������� ��� ���� �������,
   // ���� ��������� ������������ � ������������ ID - ������� FREE ����� �����������������...
   if (Result <> 0) then
   begin
    l_Region := GetUserRegion(Result);
    if l_Region = GlobalDataProvider.RegionID then // ��������� �� FREE ������ "�����" �������������
     f_FreeIDHelperHolder.ExcludeFree(da_mtUsers, GetLocalUserID(Result));
   end;
   if Result >= usAdminReservedHard then
    raise EpgError.Create('�������� ����������');

   if Result = 0 then
   begin
    Result := f_FreeIDHelperHolder.GetFree(da_mtUsers);
    if GlobalDataProvider.RegionID = cBadRegion then
     raise EpgError.Create('�� ����� ��� �������!');
     // ����������� ����� ������� � ������� ����
    Result := CalcGlobalUserID(Result, GlobalDataProvider.RegionID);
   end;

   Assert(not IsWrongUser(Result));

   l_Modifier := TpgTableModifier.Create(da_mtUsers, f_Connection, f_Factory.DataConverter);
   try
    l_Modifier.Params['id'].AsLargeInt := Result;
    l_Modifier.Params['user_name'].AsString := aUserName;
    l_Modifier.Params['name_length'].AsInteger := Length(aUserName);
    l_Modifier.Params['active'].AsByte := ActFlag;
    l_Modifier.Insert;
   finally
    FreeAndNil(l_Modifier);
   end;
   if aLoginName <> '' then
   begin
    l_Modifier := TpgTableModifier.Create(da_mtPassword, f_Connection, f_Factory.DataConverter);
    try
     l_Modifier.Params['ShortName'].AsString := AnsiUpperCase(aLoginName);
     l_Modifier.Params['Password'].AsString := AnsiUpperCase(aPassword);
     l_Modifier.Params['User_ID'].AsLargeInt := Result;
     l_Modifier.Insert;
    finally
     FreeAndNil(l_Modifier);
    end;
   end;

   f_Journal.LogEditDict(TdaScheme.Instance.Table(da_mtUsers).FamilyID, da_dlNone, da_eoAdd);

   f_Connection.CommitTransaction;
  except
   f_Connection.RollBackTransaction;
   raise;
  end;
 end
 else
  raise EpgError.Create('������� ���������, ���������� �����');

 l_UserName := ConcatRegionAndUserNames(Result, aUserName);
 if f_AllUsers <> nil then
 begin
  f_AllUsers.NeedAllocStr := True;
  f_AllUsers.Add(@l_UserName[1], @Result);
  SortUsersInList(f_AllUsers);
 end;
//#UC END# *5784BC420208_5629FC88034B_impl*
end;//TpgUserManager.AddUserID

procedure TpgUserManager.EditUser(aUser: TdaUserID;
 const aUserName: AnsiString;
 const aLoginName: AnsiString;
 ActFlag: Byte;
 const EditMask: TdaUserEditMask);
//#UC START# *5784BD1501E8_5629FC88034B_var*
Var
 TmpIndex : LongInt;
// TmpSize  : Word;
 l_UserName: AnsiString;
 l_Function: IdaFunction;
const
 cMap: array[Boolean] of Integer = (0, 1);
//#UC END# *5784BD1501E8_5629FC88034B_var*
begin
//#UC START# *5784BD1501E8_5629FC88034B_impl*
 if f_Connection.BeginTransaction([da_mtUsers, da_mtPassword]) then
  Try
   l_Function := f_FunctionFactory.MakeFunction('update_user');
   try
     l_Function.Param['p_user_id'].AsLargeInt := aUser;
     l_Function.Param['p_user_name'].AsString := aUserName;
     l_Function.Param['p_user_login'].AsString := AnsiUpperCase(aLoginName);
     l_Function.Param['p_flags'].AsInteger := ActFlag;
     l_Function.Param['p_change_login'].AsInteger := cMap[EditMask.LoginName];
     l_Function.Param['p_change_name'].AsInteger := cMap[EditMask.Name];
     l_Function.Param['p_change_flags'].AsInteger := cMap[EditMask.ActivFlag];
     l_Function.Execute;
   finally
     l_Function := nil;
   end;

   f_Journal.LogEditDict(TdaScheme.Instance.Table(da_mtUsers).FamilyID, da_dlNone, da_eoEdit);

   f_Connection.CommitTransaction;
  except
   f_Connection.RollBackTransaction;
   raise;
  end
 else
  raise EpgError.Create('������� ���������, ���������� �����');

 if EditMask.Name then
 begin
  l_UserName := ConcatRegionAndUserNames(aUser, aUserName);
  if f_AllUsers <> nil then
  begin
   TmpIndex := f_AllUsers.IndexOfData(aUser, SizeOf(TdaUserID), 0);
   f_AllUsers.NeedAllocStr := True;
   f_AllUsers.Strings[TmpIndex] := @l_UserName[1];
   SortUsersInList(f_AllUsers);
  end;
(*
  if fIndUList<>nil then
  begin
   fIndUList.NeedAllocStr:=True;
   TmpSize:=StrLen(PAnsichar(@aUserName[1]));
   fIndUList.Strings[aUser]:=@aUserName[1];
   fIndUList.Data[aUser]:=@TmpSize;
  end;
*)
 end;
//#UC END# *5784BD1501E8_5629FC88034B_impl*
end;//TpgUserManager.EditUser

procedure TpgUserManager.DelUser(aUser: TdaUserID);
//#UC START# *5784BE1E02F7_5629FC88034B_var*
Var
 TmpIndex : LongInt;
 l_Modifier: TpgTableModifier;
 l_ResultSet: IdaResultSet;
//#UC END# *5784BE1E02F7_5629FC88034B_var*
begin
//#UC START# *5784BE1E02F7_5629FC88034B_impl*
 if f_Connection.BeginTransaction([da_mtUsers, da_mtFree, da_mtPassword, da_mtGroupMembers]) then
  Try
   RemoveUserFromAllGroups(aUser);

   UserLoginQuery.Param['p_UserID'].AsLargeInt := aUser;
   l_ResultSet := UserLoginQuery.OpenResultSet;
   try
    if not l_ResultSet.IsEmpty then
    begin
     l_Modifier := TpgTableModifier.Create(da_mtPassword, f_Connection, f_Factory.DataConverter);
     try
      l_Modifier.OldParams['ShortName'].AsString := l_ResultSet.Field['ShortName'].AsString;
      l_Modifier.Delete;
     finally
      FreeAndNil(l_Modifier);
     end;
    end;
   finally
    l_ResultSet := nil;
   end;

   l_Modifier := TpgTableModifier.Create(da_mtUsers, f_Connection, f_Factory.DataConverter);
   try
    l_Modifier.OldParams['id'].AsLargeInt := aUser;
    l_Modifier.Delete;
   finally
    FreeAndNil(l_Modifier);
   end;
   f_FreeIDHelperHolder.PutFree(da_mtUsers, aUser);

   f_Journal.LogEditDict(TdaScheme.Instance.Table(da_mtUsers).FamilyID, da_dlNone, da_eoDelete);

   f_Connection.CommitTransaction;
  except
   f_Connection.RollBackTransaction;
   raise;
  end
 else
  raise EpgError.Create('������� ���������, ���������� �����');
 if f_AllUsers <> nil then
 begin
  TmpIndex := f_AllUsers.IndexOfData(aUser, SizeOf(TdaUserID), 0);
  f_AllUsers.Delete(TmpIndex);
 end;
//#UC END# *5784BE1E02F7_5629FC88034B_impl*
end;//TpgUserManager.DelUser

procedure TpgUserManager.GetUserListOnGroup(aUsGroup: TdaUserGroupID;
 aList: Tl3StringDataList;
 GetActiveUsersOnly: Boolean = False);
//#UC START# *57A87EF901F3_5629FC88034B_var*
var
 l_Query: IdaTabledQuery;
 l_ResultSet: IdaResultSet;
//#UC END# *57A87EF901F3_5629FC88034B_var*
begin
//#UC START# *57A87EF901F3_5629FC88034B_impl*
 if aUsGroup = 0 then
  FillAllUsers(aList)
 else
 begin
  l_Query := f_Factory.MakeTabledQuery(
   f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtUsers), 'u').Join(
    f_Factory.MakeSimpleFromClause(TdaScheme.Instance.Table(da_mtGroupMembers), 'm'),
    da_jkLeftOuter).SetCondition(f_Factory.MakeJoinCondition('u', TdaScheme.Instance.Table(da_mtUsers)['id'], 'm', TdaScheme.Instance.Table(da_mtGroupMembers)['user_id']))
  );
  try
   l_Query.WhereCondition := f_Factory.MakeParamsCondition('m', TdaScheme.Instance.Table(da_mtGroupMembers).Field['group_id'], da_copEqual, 'p_GroupID');
   if GetActiveUsersOnly then
    l_Query.WhereCondition := f_Factory.MakeLogicCondition(l_Query.WhereCondition, da_loAnd,
     f_Factory.MakeBitWiseCondition('u', TdaScheme.Instance.Table(da_mtUsers)['active'], da_bwAnd, usActive));
   l_Query.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtUsers)['id']));
   l_Query.AddSelectField(f_Factory.MakeSelectField('', TdaScheme.Instance.Table(da_mtUsers)['user_name']));
   l_Query.Prepare;
   l_Query.Param['p_GroupID'].AsLargeInt := aUsGroup;
   l_ResultSet := l_Query.OpenResultSet;
   try
    FillListByResultSet(aList, l_ResultSet, 'id', cUserIDSize, 'user_name', True);
   finally
    l_ResultSet := nil;
   end;
  finally
   l_Query := nil;
  end;
 end;
 SortUsersInList(aList);
//#UC END# *57A87EF901F3_5629FC88034B_impl*
end;//TpgUserManager.GetUserListOnGroup

procedure TpgUserManager.GetFiltredUserList(aList: TStrings;
 aOnlyActive: Boolean = False);
//#UC START# *57A9DF2103CE_5629FC88034B_var*
var
 l_List: TStringList;
//#UC END# *57A9DF2103CE_5629FC88034B_var*
begin
//#UC START# *57A9DF2103CE_5629FC88034B_impl*
 Assert(Self <> nil);
 if not aOnlyActive then
 begin
  l_List := TStringList.Create;
  try
   LoadFiltredUserList(l_List, false);
   aList.Assign(l_List);
  finally
   FreeAndNil(l_List);
  end;
 end
 else
 begin
  if f_CacheActiveUserList = nil then
  begin
   f_CacheActiveUserList := TStringList.Create;
   LoadFiltredUserList(f_CacheActiveUserList, true);
  end;
  aList.Assign(f_CacheActiveUserList);
 end;
//#UC END# *57A9DF2103CE_5629FC88034B_impl*
end;//TpgUserManager.GetFiltredUserList

procedure TpgUserManager.GetDocGroupData(aUserGroup: TdaUserGroupID;
 aFamily: TdaFamilyID;
 aDocDataList: Tl3StringDataList);
//#UC START# *57AC28890131_5629FC88034B_var*
//#UC END# *57AC28890131_5629FC88034B_var*
begin
//#UC START# *57AC28890131_5629FC88034B_impl*
 Assert(False);
//!! !!! Needs to be implemented !!!
//#UC END# *57AC28890131_5629FC88034B_impl*
end;//TpgUserManager.GetDocGroupData

procedure TpgUserManager.PutDocGroupData(aUserGroup: TdaUserGroupID;
 aFamily: TdaFamilyID;
 aDocDataList: Tl3StringDataList);
//#UC START# *57AC289F0257_5629FC88034B_var*
//#UC END# *57AC289F0257_5629FC88034B_var*
begin
//#UC START# *57AC289F0257_5629FC88034B_impl*
 Assert(False);
//!! !!! Needs to be implemented !!!
//#UC END# *57AC289F0257_5629FC88034B_impl*
end;//TpgUserManager.PutDocGroupData

procedure TpgUserManager.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_5629FC88034B_var*
//#UC END# *479731C50290_5629FC88034B_var*
begin
//#UC START# *479731C50290_5629FC88034B_impl*
 FreeAndNil(f_ArchiUsers);
 FreeAndNil(f_UserStatusChangedSubscriberList);
 FreeAndNil(f_AllUsers);
 FreeAndNil(f_AllGroups);
 FreeAndNil(f_CacheActiveUserList);
 f_PasswordQuery := nil;
 f_UserFlagsQuery := nil;
 f_UserNameQuery := nil;
 f_UserLoginQuery := nil;
 f_PriorityCalculator := nil;
 f_AllArchiUsersQuery := nil;
 f_AllGroupsQuery := nil;
 f_IsMemberOfGroupQuery := nil;
 f_UserGroupsQuery := nil;
 f_GroupUsersQuery := nil;
 f_Factory := nil;
 f_Journal := nil;
 FreeAndNil(f_GroupModifier);
 FreeAndNil(f_FunctionFactory);
 FreeAndNil(f_FreeIDHelperHolder);
 FreeAndNil(f_Connection);
 inherited;
//#UC END# *479731C50290_5629FC88034B_impl*
end;//TpgUserManager.Cleanup
{$IfEnd} // Defined(UsePostgres)

end.
