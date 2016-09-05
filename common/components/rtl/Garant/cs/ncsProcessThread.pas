unit ncsProcessThread;

// ������: "w:\common\components\rtl\Garant\cs\ncsProcessThread.pas"
// ���������: "SimpleClass"
// ������� ������: "TncsProcessThread" MUID: (546061CE03DA)

{$Include w:\common\components\rtl\Garant\cs\CsDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , ncsTransporterThread
 , ncsReplyWaiter
 , ncsMessageInterfaces
 , ncsMessage
 , ncsMessageQueue
;

type
 TncsProcessThread = class(TncsTransporterThread)
  private
   f_Transporter: Pointer;
    {* [weak] IncsTransporter }
   f_ReplyWaiter: TncsReplyWaiter;
  private
   procedure ProcessMessage(aMessage: TncsMessage);
  protected
   function pm_GetTransporter: IncsTransporter;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure DoExecute; override;
    {* �������� ��������� ����. ��� ���������� � �������� }
  public
   constructor Create(anQueue: TncsMessageQueue;
    const aTransporter: IncsTransporter;
    aWaiter: TncsReplyWaiter); reintroduce;
  protected
   property ReplyWaiter: TncsReplyWaiter
    read f_ReplyWaiter;
  public
   property Transporter: IncsTransporter
    read pm_GetTransporter;
 end;//TncsProcessThread
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
 , SysUtils
 , l3Base
 , ncsMessageExecutorFactory
 , evdNcsTypes
 //#UC START# *546061CE03DAimpl_uses*
 //#UC END# *546061CE03DAimpl_uses*
;

function TncsProcessThread.pm_GetTransporter: IncsTransporter;
//#UC START# *5464BE030256_546061CE03DAget_var*
//#UC END# *5464BE030256_546061CE03DAget_var*
begin
//#UC START# *5464BE030256_546061CE03DAget_impl*
 Result := IncsTransporter(f_Transporter);
//#UC END# *5464BE030256_546061CE03DAget_impl*
end;//TncsProcessThread.pm_GetTransporter

procedure TncsProcessThread.ProcessMessage(aMessage: TncsMessage);
//#UC START# *5460680D0277_546061CE03DA_var*
var
 l_Executor: IncsExecutor;
 l_Transporter: IncsTransporter;
 l_FakeReply: TncsMessage;
//#UC END# *5460680D0277_546061CE03DA_var*
begin
//#UC START# *5460680D0277_546061CE03DA_impl*
 l_Executor := TncsMessageExecutorFactory.Instance.MakeExecutor(aMessage);
 if Assigned(l_Executor) then
 begin
  l_Transporter := Transporter;
  try
   try
    l_Executor.Execute(TncsExecuteContext_C(aMessage, l_Transporter))
   except
    on E: Exception do
    begin
     l3System.Msg2Log('���������� ��� ��������� ��������� %s', [aMessage.TaggedData.TagType.AsString]);
     l3System.Exception2Log(E);
     if aMessage.Kind = ncs_mkMessage then
     begin
      l_FakeReply := TncsInvalidMessage.Create;
      try
       l_FakeReply.Kind := ncs_mkReply;
       l_FakeReply.MessageID := aMessage.MessageID;
       l_Transporter.Send(l_FakeReply);
      finally
       FreeAndNil(l_FakeReply);
      end;
     end;
     raise;
    end;
   end;
  finally
   l_Transporter := nil;
  end;
 end
 else
  l3System.Msg2Log('�� ������� ����� Executor ��� %s', [aMessage.TaggedData.TagType.AsString]);
//#UC END# *5460680D0277_546061CE03DA_impl*
end;//TncsProcessThread.ProcessMessage

constructor TncsProcessThread.Create(anQueue: TncsMessageQueue;
 const aTransporter: IncsTransporter;
 aWaiter: TncsReplyWaiter);
//#UC START# *5464BDC203B1_546061CE03DA_var*
//#UC END# *5464BDC203B1_546061CE03DA_var*
begin
//#UC START# *5464BDC203B1_546061CE03DA_impl*
 inherited Create(anQueue);
 f_Transporter := Pointer(aTransporter);
 aWaiter.SetRefTo(f_ReplyWaiter);
//#UC END# *5464BDC203B1_546061CE03DA_impl*
end;//TncsProcessThread.Create

procedure TncsProcessThread.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_546061CE03DA_var*
//#UC END# *479731C50290_546061CE03DA_var*
begin
//#UC START# *479731C50290_546061CE03DA_impl*
 f_Transporter := nil;
 FreeAndNil(f_ReplyWaiter);
 inherited;
//#UC END# *479731C50290_546061CE03DA_impl*
end;//TncsProcessThread.Cleanup

procedure TncsProcessThread.DoExecute;
 {* �������� ��������� ����. ��� ���������� � �������� }
//#UC START# *4911B69E037D_546061CE03DA_var*
var
 l_Message: TncsMessage;
//#UC END# *4911B69E037D_546061CE03DA_var*
begin
//#UC START# *4911B69E037D_546061CE03DA_impl*
 l_Message := nil;
 while not TerminatedConnection do
 begin
  Queue.WaitForMessage;
  if TerminatedConnection then
   Exit;
  while Queue.ExtractMessage(l_Message) do
  try
   if TerminatedConnection then
    Exit;
   if l_Message.Kind = ncs_mkReply then
    f_ReplyWaiter.SubmitReply(l_Message)
   else
    ProcessMessage(l_Message);
  finally
   FreeAndNil(l_Message);
  end;
 end;
//#UC END# *4911B69E037D_546061CE03DA_impl*
end;//TncsProcessThread.DoExecute
{$IfEnd} // NOT Defined(Nemesis)

end.
