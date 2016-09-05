unit nsCachedEventsProcessor;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Logging\nsCachedEventsProcessor.pas"
// ���������: "SimpleClass"
// ������� ������: "TnsCachedEventsProcessor" MUID: (4B139FB1009B)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
 l3IntfUses
 , nsPrimCachedEventsProcessor
 , LoggingInterfaces
;

type
 TnsCachedEventsProcessor = class(TnsPrimCachedEventsProcessor)
  public
   class function Make: InsCachedEventsProcessor; reintroduce;
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
 end;//TnsCachedEventsProcessor

implementation

uses
 l3ImplUses
 , SysUtils
 , l3Base
 //#UC START# *4B139FB1009Bimpl_uses*
 //#UC END# *4B139FB1009Bimpl_uses*
;

var g_TnsCachedEventsProcessor: Pointer = nil;
 {* ��������� ���������� TnsCachedEventsProcessor }

procedure TnsCachedEventsProcessorFree;
 {* ����� ������������ ���������� ���������� TnsCachedEventsProcessor }
begin
 IUnknown(g_TnsCachedEventsProcessor) := nil;
end;//TnsCachedEventsProcessorFree

class function TnsCachedEventsProcessor.Make: InsCachedEventsProcessor;
begin
 if (g_TnsCachedEventsProcessor = nil) then
 begin
  l3System.AddExitProc(TnsCachedEventsProcessorFree);
  InsCachedEventsProcessor(g_TnsCachedEventsProcessor) := inherited Make;
 end;
 Result := InsCachedEventsProcessor(g_TnsCachedEventsProcessor);
end;//TnsCachedEventsProcessor.Make

class function TnsCachedEventsProcessor.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TnsCachedEventsProcessor <> nil;
end;//TnsCachedEventsProcessor.Exists

end.
