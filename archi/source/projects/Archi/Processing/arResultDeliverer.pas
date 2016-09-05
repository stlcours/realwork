unit arResultDeliverer;

// ������: "w:\archi\source\projects\Archi\Processing\arResultDeliverer.pas"
// ���������: "SimpleClass"
// ������� ������: "TarResultDeliverer" MUID: (545C749003C2)

{$Include w:\archi\source\projects\Archi\arDefine.inc}

interface

{$If Defined(AppClientSide)}
uses
 l3IntfUses
 , l3Base
 {$If NOT Defined(Nemesis)}
 , CsCommon
 {$IfEnd} // NOT Defined(Nemesis)
 {$If NOT Defined(Nemesis)}
 , ncsMessageInterfaces
 {$IfEnd} // NOT Defined(Nemesis)
 , arResultDeliveryInterfaces
;

type
 TarResultDeliverer = class(Tl3ThreadContainer)
  private
   f_RequestCounter: Integer;
   f_Transporter: IncsClientTransporter;
   f_Listener: Pointer;
    {* Weak IarResultDelivererListner }
   f_ServerHost: AnsiString;
   f_ServerPort: Integer;
  private
   function ReceiveTaskResult(const aTaskID: AnsiString): Boolean;
  protected
   function pm_GetClientID: TCsClientId;
   procedure pm_SetClientID(aValue: TCsClientId);
   function pm_GetListener: IarResultDelivererListner; virtual;
   procedure DoExecute; override;
    {* �������� ��������� ����. ��� ���������� � �������� }
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure InitFields; override;
   procedure ClearFields; override;
  public
   constructor Create(const aWeakListener: IarResultDelivererListner); reintroduce;
   procedure TerminateProcess;
   procedure RequestDelivery;
   function CanRequestDelivery: Boolean;
   function HasReadyToDeliveryData: Boolean;
  protected
   property Listener: IarResultDelivererListner
    read pm_GetListener;
  public
   property ClientID: TCsClientId
    read pm_GetClientID
    write pm_SetClientID;
   property ServerHost: AnsiString
    read f_ServerHost
    write f_ServerHost;
   property ServerPort: Integer
    read f_ServerPort
    write f_ServerPort;
 end;//TarResultDeliverer
{$IfEnd} // Defined(AppClientSide)

implementation

{$If Defined(AppClientSide)}
uses
 l3ImplUses
 , SysUtils
 {$If NOT Defined(Nemesis)}
 , csIdIOHandlerAbstractAdapter
 {$IfEnd} // NOT Defined(Nemesis)
 {$If NOT Defined(Nemesis)}
 , ncsFileTransferReg
 {$IfEnd} // NOT Defined(Nemesis)
 {$If NOT Defined(Nemesis)}
 , ncsGetReadyToDeliveryTasksReply
 {$IfEnd} // NOT Defined(Nemesis)
 {$If NOT Defined(Nemesis)}
 , ncsGetReadyToDeliveryTasks
 {$IfEnd} // NOT Defined(Nemesis)
 {$If NOT Defined(Nemesis)}
 , ncsMessage
 {$IfEnd} // NOT Defined(Nemesis)
 {$If NOT Defined(Nemesis)}
 , ncsCompatibilityClientTransporter
 {$IfEnd} // NOT Defined(Nemesis)
 {$If NOT Defined(Nemesis)}
 , CsQueryTypes
 {$IfEnd} // NOT Defined(Nemesis)
 {$If NOT Defined(Nemesis)}
 , ncsProfile
 {$IfEnd} // NOT Defined(Nemesis)
 , l3StopWatch
 , l3Utils
 , evdNcsTypes
 {$If NOT Defined(Nemesis)}
 , ncsCorrectFolder
 {$IfEnd} // NOT Defined(Nemesis)
 {$If NOT Defined(Nemesis)}
 , ncsDeliveryResult
 {$IfEnd} // NOT Defined(Nemesis)
 , Windows
 , Messages
 , l3Interlocked
 {$If NOT Defined(Nemesis)}
 , ncsSynchroCompatibilityClientTransporter
 {$IfEnd} // NOT Defined(Nemesis)
 , arOneTaskDeliverer
 //#UC START# *545C749003C2impl_uses*
 //#UC END# *545C749003C2impl_uses*
;

function TarResultDeliverer.pm_GetClientID: TCsClientId;
//#UC START# *545C74C40316_545C749003C2get_var*
//#UC END# *545C74C40316_545C749003C2get_var*
begin
//#UC START# *545C74C40316_545C749003C2get_impl*
 Result := f_Transporter.ClientID;
//#UC END# *545C74C40316_545C749003C2get_impl*
end;//TarResultDeliverer.pm_GetClientID

procedure TarResultDeliverer.pm_SetClientID(aValue: TCsClientId);
//#UC START# *545C74C40316_545C749003C2set_var*
//#UC END# *545C74C40316_545C749003C2set_var*
begin
//#UC START# *545C74C40316_545C749003C2set_impl*
 f_Transporter.ClientID := aValue;
//#UC END# *545C74C40316_545C749003C2set_impl*
end;//TarResultDeliverer.pm_SetClientID

function TarResultDeliverer.pm_GetListener: IarResultDelivererListner;
//#UC START# *549AA07C02A4_545C749003C2get_var*
//#UC END# *549AA07C02A4_545C749003C2get_var*
begin
//#UC START# *549AA07C02A4_545C749003C2get_impl*
 Result := IarResultDelivererListner(f_Listener);
//#UC END# *549AA07C02A4_545C749003C2get_impl*
end;//TarResultDeliverer.pm_GetListener

function TarResultDeliverer.ReceiveTaskResult(const aTaskID: AnsiString): Boolean;
//#UC START# *5465FDD1009D_545C749003C2_var*
var
 l_Deliverer: TarOneTaskDeliverer;
 l_Folder: AnsiString;
 l_Message: TncsCorrectFolder;
 l_ResultMsg: TncsDeliveryResult;
 l_TryCount: Integer;

const
 cMaxTryCount = 10;
 cTryDelay = 1000;
//#UC END# *5465FDD1009D_545C749003C2_var*
begin
//#UC START# *5465FDD1009D_545C749003C2_impl*
 Result := False;
 Listener.CheckTaskExistance(aTaskID);
 l_ResultMsg := TncsDeliveryResult.Create;
 try
  l_ResultMsg.TaskID := aTaskID;

  l_Deliverer := TarOneTaskDeliverer.Create(f_Transporter, aTaskID);
  try
   l_TryCount := 0;
   repeat
    l_ResultMsg.ResultKind := l_Deliverer.Execute;
    inc(l_TryCount);
    if (l_ResultMsg.ResultKind = ncs_rkRetry) and (l_TryCount < cMaxTryCount) then
    begin
     l3System.Msg2Log('�� ������� �������� ��������, ������� ����� %d', [l_TryCount + 1]);
     Sleep(cTryDelay);
    end;
   until (l_ResultMsg.ResultKind <> ncs_rkRetry) or (l_TryCount = cMaxTryCount);
   case l_ResultMsg.ResultKind of
    ncs_rkOk:
     begin
      Listener.RequestSendMessage(Format('���������� �������� �������� � ����� %s', [l_Deliverer.TargetFolder]));
      Result := True;
     end;
    ncs_rkFail:
     begin
      if f_Transporter.Processing then
       Listener.RequestSendMessage(Format('�� ������� ��������� ���������� �������� � ����� %s', [l_Deliverer.TargetFolder]));
      Result := False;
     end;
    ncs_rkRetry:
     begin
      l_Folder := l_Deliverer.TargetFolder;
      if Listener.RequestNewFolder(l_Folder) then
      begin
       l_Message := TncsCorrectFolder.Create;
       try
        l_Message.TaskID := aTaskID;
        l_Message.NewFolder := l_Folder;
        f_Transporter.Send(l_Message);
       finally
        FreeAndNil(l_Message);
       end;
       Listener.ChangeResultFolder(aTaskID, l_Folder);
       RequestDelivery;
      end
      else
      begin
       l_ResultMsg.ResultKind := ncs_rkFail;
       Listener.RequestSendMessage(Format('�� ������� ��������� ���������� �������� � ����� %s', [l_Deliverer.TargetFolder]));
      end;
      Result := True;
     end;
    ncs_rkEmpty:
     begin
      Listener.RequestSendMessage('���������� �������� �� �������. ��� �������������� ��������� ��������� �������');
      Result := True;
     end;
    else
     Assert(False);
   end;
   if f_Transporter.Processing then
    f_Transporter.Send(l_ResultMsg);
  finally
   FreeAndNil(l_Deliverer);
  end;
 finally
  FreeAndNil(l_ResultMsg);
 end;
//#UC END# *5465FDD1009D_545C749003C2_impl*
end;//TarResultDeliverer.ReceiveTaskResult

constructor TarResultDeliverer.Create(const aWeakListener: IarResultDelivererListner);
//#UC START# *546AF1220010_545C749003C2_var*
//#UC END# *546AF1220010_545C749003C2_var*
begin
//#UC START# *546AF1220010_545C749003C2_impl*
 inherited Create;
 f_Listener := Pointer(aWeakListener);
//#UC END# *546AF1220010_545C749003C2_impl*
end;//TarResultDeliverer.Create

procedure TarResultDeliverer.TerminateProcess;
//#UC START# *545C84E90055_545C749003C2_var*
//#UC END# *545C84E90055_545C749003C2_var*
begin
//#UC START# *545C84E90055_545C749003C2_impl*
 if not Suspended then
 begin
  f_Transporter.Disconnect(True);
  Terminate;
 end; 
//#UC END# *545C84E90055_545C749003C2_impl*
end;//TarResultDeliverer.TerminateProcess

procedure TarResultDeliverer.RequestDelivery;
//#UC START# *545C88760010_545C749003C2_var*
//#UC END# *545C88760010_545C749003C2_var*
begin
//#UC START# *545C88760010_545C749003C2_impl*
 l3InterlockedIncrement(f_RequestCounter);
 PostThreadMessage(MainThreadID, WM_NULL, 0, 0);
//#UC END# *545C88760010_545C749003C2_impl*
end;//TarResultDeliverer.RequestDelivery

function TarResultDeliverer.CanRequestDelivery: Boolean;
//#UC START# *545C888301CF_545C749003C2_var*
//#UC END# *545C888301CF_545C749003C2_var*
begin
//#UC START# *545C888301CF_545C749003C2_impl*
 Result := HasReadyToDeliveryData and Suspended;
//#UC END# *545C888301CF_545C749003C2_impl*
end;//TarResultDeliverer.CanRequestDelivery

function TarResultDeliverer.HasReadyToDeliveryData: Boolean;
//#UC START# *549BB1B501D5_545C749003C2_var*
//#UC END# *549BB1B501D5_545C749003C2_var*
begin
//#UC START# *549BB1B501D5_545C749003C2_impl*
 Result := (f_RequestCounter > 0);
//#UC END# *549BB1B501D5_545C749003C2_impl*
end;//TarResultDeliverer.HasReadyToDeliveryData

procedure TarResultDeliverer.DoExecute;
 {* �������� ��������� ����. ��� ���������� � �������� }
//#UC START# *4911B69E037D_545C749003C2_var*
var
 l_OldValue: Integer;
 l_TaskListMsg: TncsGetReadyToDeliveryTasks;
 l_Reply: TncsMessage;
 l_TaskListReply: TncsGetReadyToDeliveryTasksReply;
 l_IDX: Integer;
 l_Watch: Tl3StopWatch;
//#UC END# *4911B69E037D_545C749003C2_var*
begin
//#UC START# *4911B69E037D_545C749003C2_impl*
 l_Watch.Reset;

 g_SaveMessage.ReSet;
 g_LoadMessage.ReSet;
 g_SendMessage.ReSet;
 g_ReveiveMessage.ReSet;
 g_WaitFile.ReSet;
 g_ReceivePartFile.ReSet;
 g_SaveControl.ReSet;
 g_WriteFile.ReSet;


 l_Watch.Start;
 try
  try
   l3System.Msg2Log('������ �������� ����������� ��������');
   l_OldValue := f_RequestCounter;
   f_Transporter.Connect(ServerHost, ServerPort, l3CreateStringGUID);
   try
    if not f_Transporter.Connected then
    begin
     l3InterlockedExchange(f_RequestCounter, 0);
     l3System.Msg2Log('����� ����� �� ������ ��������');
     Exit;
    end;
    // ���������� ��������
    l_TaskListReply := nil;
    try
     l_Reply := nil;
     l_TaskListMsg := TncsGetReadyToDeliveryTasks.Create;
     try
      l_TaskListMsg.UserID := ClientID;
      f_Transporter.Send(l_TaskListMsg);
      if f_Transporter.WaitForReply(l_TaskListMsg, l_Reply) then
      begin
       l_TaskListReply := l_Reply as TncsGetReadyToDeliveryTasksReply;
       for l_IDX := 0 to l_TaskListReply.TasksIDList.Count - 1 do
       begin
        if not f_Transporter.Processing then
         Exit;
        if not ReceiveTaskResult(l_TaskListReply.TasksIDList[l_IDX]) then
         Exit;
       end;
       l3InterlockedExchangeAdd(f_RequestCounter, -l_OldValue);
      end;
     finally
      FreeAndNil(l_TaskListMsg);
     end;
    finally
     FreeAndNil(l_TaskListReply);
    end;
   finally
    f_Transporter.Disconnect;
   end;
   l3System.Msg2Log('�������� ����������� �������� ������� ���������');
  except
   on E: Exception do
   begin
    l3InterlockedExchange(f_RequestCounter, 0);
    l3System.Msg2Log('�������� ����������� �������� ����������� � �������');
    l3System.Exception2Log(E);
    raise;
   end;
  end;
 finally
  l_Watch.Stop;
 end;
 l3System.Msg2Log('����������� ����� %s ms', [FormatFloat('0,###.000', l_Watch.Time * 1000)]);

{$IFDEF ncsProfile}
 l3System.Msg2Log('SAVE MESSAGE = %s', [FormatFloat('0,###.000', g_SaveMessage.Time * 1000)]);
 l3System.Msg2Log('SEND MESSAGE = %s', [FormatFloat('0,###.000', g_SendMessage.Time * 1000)]);
 l3System.Msg2Log('LOAD MESSAGE = %s', [FormatFloat('0,###.000', g_LoadMessage.Time * 1000)]);
 l3System.Msg2Log('RECEIVE MESSAGE = %s', [FormatFloat('0,###.000', g_ReveiveMessage.Time * 1000)]);
 l3System.Msg2Log('WAIT FILE = %s', [FormatFloat('0,###.000', g_WaitFile.Time * 1000)]);
 l3System.Msg2Log('RECEIVE FILE = %s', [FormatFloat('0,###.000', g_ReceivePartFile.Time * 1000)]);
 l3System.Msg2Log('WRITE FILE = %s', [FormatFloat('0,###.000', g_WriteFile.Time * 1000)]);
 l3System.Msg2Log('WRITE CONTROL = %s', [FormatFloat('0,###.000', g_SaveControl.Time * 1000)]);
 l3System.Msg2Log('TOTAL = %s', [FormatFloat('0,###.000', l_Watch.Time * 1000)]);
{$ENDIF ncsProfile}
//#UC END# *4911B69E037D_545C749003C2_impl*
end;//TarResultDeliverer.DoExecute

procedure TarResultDeliverer.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_545C749003C2_var*
//#UC END# *479731C50290_545C749003C2_var*
begin
//#UC START# *479731C50290_545C749003C2_impl*
 f_Listener := nil;
 f_Transporter := nil;
 inherited;
//#UC END# *479731C50290_545C749003C2_impl*
end;//TarResultDeliverer.Cleanup

procedure TarResultDeliverer.InitFields;
//#UC START# *47A042E100E2_545C749003C2_var*
//#UC END# *47A042E100E2_545C749003C2_var*
begin
//#UC START# *47A042E100E2_545C749003C2_impl*
 inherited;
{$IFDEF csSynchroTransport}
 f_Transporter := TncsSynchroCompatibilityClientTransporter.Make(qtalcuExportResultProcessing);
{$ELSE csSynchroTransport}
 f_Transporter := TncsCompatibilityClientTransporter.Make(qtalcuExportResultProcessing);
{$ENDIF csSynchroTransport}
 ncsFileTransferReg.ncsClientRegister;
//#UC END# *47A042E100E2_545C749003C2_impl*
end;//TarResultDeliverer.InitFields

procedure TarResultDeliverer.ClearFields;
begin
 ServerHost := '';
 inherited;
end;//TarResultDeliverer.ClearFields
{$IfEnd} // Defined(AppClientSide)

end.
