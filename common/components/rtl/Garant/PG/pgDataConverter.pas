unit pgDataConverter;

// ������: "w:\common\components\rtl\Garant\PG\pgDataConverter.pas"
// ���������: "SimpleClass"
// ������� ������: "TpgDataConverter" MUID: (55E42F2D027B)

{$Include w:\common\components\rtl\Garant\PG\pgDefine.inc}

interface

{$If Defined(UsePostgres)}
uses
 l3IntfUses
 , l3ProtoObject
 , pgInterfaces
 , daTypes
 , l3Date
 , daInterfaces
;

type
 TpgDataConverter = class(Tl3ProtoObject, IpgDataConverter)
  protected
   function AllocateParamBuffer(const aDescription: IdaParamDescription): Pointer;
   procedure ParamToDataBase(const aDescription: IdaParamDescription;
    ClientBufferFormat: TdaDataType;
    aClientBuffer: Pointer;
    var aServerBuffer: Pointer);
   procedure ParamFromDataBase(const aDescription: IdaParamDescription;
    ClientBufferFormat: TdaDataType;
    aServerBuffer: Pointer;
    aClientBuffer: Pointer);
   procedure FreeParamBuffer(const aDescription: IdaParamDescription;
    aBuffer: Pointer);
   function ToInteger(aData: Pointer): Integer;
   function ToLargeInt(aData: Pointer): LargeInt;
   function ToStDate(aData: Pointer): TStDate;
   function ToStTime(aData: Pointer): TStTime;
   function ToString(aData: Pointer): AnsiString;
   function ToByte(aData: Pointer): Byte;
  public
   constructor Create; reintroduce;
   class function Make: IpgDataConverter; reintroduce;
 end;//TpgDataConverter
{$IfEnd} // Defined(UsePostgres)

implementation

{$If Defined(UsePostgres)}
uses
 l3ImplUses
 , l3Base
 , SysUtils
 //#UC START# *55E42F2D027Bimpl_uses*
 //#UC END# *55E42F2D027Bimpl_uses*
;

constructor TpgDataConverter.Create;
//#UC START# *55E42F4600AD_55E42F2D027B_var*
//#UC END# *55E42F4600AD_55E42F2D027B_var*
begin
//#UC START# *55E42F4600AD_55E42F2D027B_impl*
 inherited Create;
//#UC END# *55E42F4600AD_55E42F2D027B_impl*
end;//TpgDataConverter.Create

class function TpgDataConverter.Make: IpgDataConverter;
var
 l_Inst : TpgDataConverter;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TpgDataConverter.Make

function TpgDataConverter.AllocateParamBuffer(const aDescription: IdaParamDescription): Pointer;
//#UC START# *555995210007_55E42F2D027B_var*
//#UC END# *555995210007_55E42F2D027B_var*
begin
//#UC START# *555995210007_55E42F2D027B_impl*
 case aDescription.DataType of
  da_dtChar:
   l3System.GetLocalMem(Result, aDescription.Size + 1);
  da_dtDWord:
   l3System.GetLocalMem(Result, SizeOf(LongWord));
  da_dtQWord:
   l3System.GetLocalMem(Result, SizeOf(LargeInt));
  da_dtDate:
   l3System.GetLocalMem(Result, SizeOf(TStDate));
  da_dtTime:
   l3System.GetLocalMem(Result, SizeOf(TStTime));
  da_dtWord:
   l3System.GetLocalMem(Result, SizeOf(Word));
  da_dtInteger:
   l3System.GetLocalMem(Result, SizeOf(Integer));
  da_dtByte:
   l3System.GetLocalMem(Result, SizeOf(Byte));
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)

 else
  Assert(False);
 end;
//!! !!! Needs to be implemented !!!
//#UC END# *555995210007_55E42F2D027B_impl*
end;//TpgDataConverter.AllocateParamBuffer

procedure TpgDataConverter.ParamToDataBase(const aDescription: IdaParamDescription;
 ClientBufferFormat: TdaDataType;
 aClientBuffer: Pointer;
 var aServerBuffer: Pointer);
//#UC START# *5559955500DF_55E42F2D027B_var*
var
 l_Str: AnsiString;
 l_Size: Integer;
//#UC END# *5559955500DF_55E42F2D027B_var*
begin
//#UC START# *5559955500DF_55E42F2D027B_impl*
 case aDescription.DataType of
  da_dtChar:
   begin
    case ClientBufferFormat of
     da_dtDWord:
      l_Str := IntToStr(PLongWord(aClientBuffer)^);
     da_dtQWord:
      l_Str := IntToStr(PLargeInt(aClientBuffer)^);
     da_dtChar:
      l_Str := PAnsiString(aClientBuffer)^;
     da_dtDate:
      l_Str := IntToStr(PStDate(aClientBuffer)^);
     da_dtTime:
      l_Str := IntToStr(PStTime(aClientBuffer)^);
     da_dtWord:
      l_Str := IntToStr(PWord(aClientBuffer)^);
     da_dtInteger:
      l_Str := IntToStr(PInteger(aClientBuffer)^);
     da_dtByte:
      l_Str := IntToStr(PByte(aClientBuffer)^);
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
    end; // Client case da_dtDWord
    if aDescription.Size = 0 then
    begin
     l_Size := Length(l_Str);
     l3System.FreeLocalMem(aServerBuffer);
     l3System.GetLocalMem(aServerBuffer, l_Size + 1);
    end
    else
     l_Size := aDescription.Size;
    StrPLCopy(PAnsiChar(aServerBuffer), PAnsiChar(l_Str), l_Size);
   end;
  da_dtDWord:
   case ClientBufferFormat of
    da_dtDWord:
     PLongWord(aServerBuffer)^ := PLongWord(aClientBuffer)^;
    da_dtQWord:
     PLongWord(aServerBuffer)^ := PLargeInt(aClientBuffer)^;
    da_dtChar:
     PLongWord(aServerBuffer)^ := StrToInt(PAnsiString(aClientBuffer)^);
    da_dtDate:
     PLongWord(aServerBuffer)^ := PStDate(aClientBuffer)^;
    da_dtTime:
     PLongWord(aServerBuffer)^ := PStTime(aClientBuffer)^;
    da_dtWord:
     PLongWord(aServerBuffer)^ := PWord(aClientBuffer)^;
    da_dtInteger:
     PLongWord(aServerBuffer)^ := PInteger(aClientBuffer)^;
    da_dtByte:
     PLongWord(aServerBuffer)^ := PByte(aClientBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtDWord
  da_dtQWord:
   case ClientBufferFormat of
    da_dtDWord:
     PLargeInt(aServerBuffer)^ := PLongWord(aClientBuffer)^;
    da_dtQWord:
     PLargeInt(aServerBuffer)^ := PLargeInt(aClientBuffer)^;
    da_dtChar:
     PLargeInt(aServerBuffer)^ := StrToInt64(PAnsiString(aClientBuffer)^);
    da_dtDate:
     PLargeInt(aServerBuffer)^ := PStDate(aClientBuffer)^;
    da_dtTime:
     PLargeInt(aServerBuffer)^ := PStTime(aClientBuffer)^;
    da_dtWord:
     PLargeInt(aServerBuffer)^ := PWord(aClientBuffer)^;
    da_dtInteger:
     PLargeInt(aServerBuffer)^ := PInteger(aClientBuffer)^;
    da_dtByte:
     PLargeInt(aServerBuffer)^ := PByte(aClientBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

  da_dtDate:
   case ClientBufferFormat of
    da_dtDWord:
     PStDate(aServerBuffer)^ := PLongWord(aClientBuffer)^;
    da_dtQWord:
     PStDate(aServerBuffer)^ := PLargeInt(aClientBuffer)^;
    da_dtChar:
     PStDate(aServerBuffer)^ := StrToInt(PAnsiString(aClientBuffer)^);
    da_dtDate:
     PStDate(aServerBuffer)^ := PStDate(aClientBuffer)^;
    da_dtTime:
     PStDate(aServerBuffer)^ := PStTime(aClientBuffer)^;
    da_dtWord:
     PStDate(aServerBuffer)^ := PWord(aClientBuffer)^;
    da_dtInteger:
     PStDate(aServerBuffer)^ := PInteger(aClientBuffer)^;
    da_dtByte:
     PStDate(aServerBuffer)^ := PByte(aClientBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

  da_dtTime:
   case ClientBufferFormat of
    da_dtDWord:
     PStTime(aServerBuffer)^ := PLongWord(aClientBuffer)^;
    da_dtQWord:
     PStTime(aServerBuffer)^ := PLargeInt(aClientBuffer)^;
    da_dtChar:
     PStTime(aServerBuffer)^ := StrToInt(PAnsiString(aClientBuffer)^);
    da_dtDate:
     PStTime(aServerBuffer)^ := PStDate(aClientBuffer)^;
    da_dtTime:
     PStTime(aServerBuffer)^ := PStTime(aClientBuffer)^;
    da_dtWord:
     PStTime(aServerBuffer)^ := PWord(aClientBuffer)^;
    da_dtInteger:
     PStTime(aServerBuffer)^ := PInteger(aClientBuffer)^;
    da_dtByte:
     PStTime(aServerBuffer)^ := PByte(aClientBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end;

  da_dtWord:
   case ClientBufferFormat of
    da_dtDWord:
     PWord(aServerBuffer)^ := PLongWord(aClientBuffer)^;
    da_dtQWord:
     PWord(aServerBuffer)^ := PLargeInt(aClientBuffer)^;
    da_dtChar:
     PWord(aServerBuffer)^ := StrToInt(PAnsiString(aClientBuffer)^);
    da_dtDate:
     PWord(aServerBuffer)^ := PStDate(aClientBuffer)^;
    da_dtTime:
     PWord(aServerBuffer)^ := PStTime(aClientBuffer)^;
    da_dtWord:
     PWord(aServerBuffer)^ := PWord(aClientBuffer)^;
    da_dtInteger:
     PWord(aServerBuffer)^ := PInteger(aClientBuffer)^;
    da_dtByte:
     PWord(aServerBuffer)^ := PByte(aClientBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

  da_dtInteger:
   case ClientBufferFormat of
    da_dtDWord:
     PInteger(aServerBuffer)^ := PLongWord(aClientBuffer)^;
    da_dtQWord:
     PInteger(aServerBuffer)^ := PLargeInt(aClientBuffer)^;
    da_dtChar:
     PInteger(aServerBuffer)^ := StrToInt(PAnsiString(aClientBuffer)^);
    da_dtDate:
     PInteger(aServerBuffer)^ := PStDate(aClientBuffer)^;
    da_dtTime:
     PInteger(aServerBuffer)^ := PStTime(aClientBuffer)^;
    da_dtWord:
     PInteger(aServerBuffer)^ := PWord(aClientBuffer)^;
    da_dtInteger:
     PInteger(aServerBuffer)^ := PInteger(aClientBuffer)^;
    da_dtByte:
     PInteger(aServerBuffer)^ := PByte(aClientBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

  da_dtByte:
   case ClientBufferFormat of
    da_dtDWord:
     PByte(aServerBuffer)^ := PLongWord(aClientBuffer)^;
    da_dtQWord:
     PByte(aServerBuffer)^ := PLargeInt(aClientBuffer)^;
    da_dtChar:
     PByte(aServerBuffer)^ := StrToInt(PAnsiString(aClientBuffer)^);
    da_dtDate:
     PByte(aServerBuffer)^ := PStDate(aClientBuffer)^;
    da_dtTime:
     PByte(aServerBuffer)^ := PStTime(aClientBuffer)^;
    da_dtWord:
     PByte(aServerBuffer)^ := PWord(aClientBuffer)^;
    da_dtInteger:
     PByte(aServerBuffer)^ := PInteger(aClientBuffer)^;
    da_dtByte:
     PByte(aServerBuffer)^ := PByte(aClientBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)

 else
  Assert(False);
 end;
//!! !!! Needs to be implemented !!!
//#UC END# *5559955500DF_55E42F2D027B_impl*
end;//TpgDataConverter.ParamToDataBase

procedure TpgDataConverter.ParamFromDataBase(const aDescription: IdaParamDescription;
 ClientBufferFormat: TdaDataType;
 aServerBuffer: Pointer;
 aClientBuffer: Pointer);
//#UC START# *55599596005B_55E42F2D027B_var*
//#UC END# *55599596005B_55E42F2D027B_var*
begin
//#UC START# *55599596005B_55E42F2D027B_impl*
 case ClientBufferFormat of
  da_dtChar:
   case aDescription.DataType of
    da_dtChar:
     PAnsiString(aClientBuffer)^ := StrPas(PAnsiChar(aServerBuffer));
    da_dtDWord:
     PAnsiString(aClientBuffer)^ := IntToStr(PLongWord(aServerBuffer)^);
    da_dtQWord:
     PAnsiString(aClientBuffer)^ := IntToStr(PLargeInt(aServerBuffer)^);
    da_dtDate:
     PAnsiString(aClientBuffer)^ := IntToStr(PStDate(aServerBuffer)^);
    da_dtTime:
     PAnsiString(aClientBuffer)^ := IntToStr(PStTime(aServerBuffer)^);
    da_dtWord:
     PAnsiString(aClientBuffer)^ := IntToStr(PWord(aServerBuffer)^);
    da_dtInteger:
     PAnsiString(aClientBuffer)^ := IntToStr(PInteger(aServerBuffer)^);
    da_dtByte:
     PAnsiString(aClientBuffer)^ := IntToStr(PByte(aServerBuffer)^);
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtDWord

  da_dtDWord:
   case aDescription.DataType of
    da_dtChar:
     PLongWord(aClientBuffer)^ := StrToInt(PAnsiChar(aServerBuffer)^);
    da_dtDWord:
     PLongWord(aClientBuffer)^ := PLongWord(aServerBuffer)^;
    da_dtQWord:
     PLongWord(aClientBuffer)^ := PLargeInt(aServerBuffer)^;
    da_dtDate:
     PLongWord(aClientBuffer)^ := PStDate(aServerBuffer)^;
    da_dtTime:
     PLongWord(aClientBuffer)^ := PStTime(aServerBuffer)^;
    da_dtWord:
     PLongWord(aClientBuffer)^ := PWord(aServerBuffer)^;
    da_dtInteger:
     PLongWord(aClientBuffer)^ := PInteger(aServerBuffer)^;
    da_dtByte:
     PLongWord(aClientBuffer)^ := PByte(aServerBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtDWord
  da_dtQWord:
   case ClientBufferFormat of
    da_dtChar:
     PLargeInt(aClientBuffer)^ := StrToInt64(PAnsiChar(aServerBuffer)^);
    da_dtDWord:
     PLargeInt(aClientBuffer)^ := PLongWord(aServerBuffer)^;
    da_dtQWord:
     PLargeInt(aClientBuffer)^ := PLargeInt(aServerBuffer)^;
    da_dtDate:
     PLargeInt(aClientBuffer)^ := PStDate(aServerBuffer)^;
    da_dtTime:
     PLargeInt(aClientBuffer)^ := PStTime(aServerBuffer)^;
    da_dtWord:
     PLargeInt(aClientBuffer)^ := PWord(aServerBuffer)^;
    da_dtInteger:
     PLargeInt(aClientBuffer)^ := PInteger(aServerBuffer)^;
    da_dtByte:
     PLargeInt(aClientBuffer)^ := PByte(aServerBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

  da_dtDate:
   case ClientBufferFormat of
    da_dtChar:
     PStDate(aClientBuffer)^ := StrToInt(PAnsiChar(aServerBuffer)^);
    da_dtDWord:
     PStDate(aClientBuffer)^ := PLongWord(aServerBuffer)^;
    da_dtQWord:
     PStDate(aClientBuffer)^ := PLargeInt(aServerBuffer)^;
    da_dtDate:
     PStDate(aClientBuffer)^ := PStDate(aServerBuffer)^;
    da_dtTime:
     PStDate(aClientBuffer)^ := PStTime(aServerBuffer)^;
    da_dtWord:
     PStDate(aClientBuffer)^ := PWord(aServerBuffer)^;
    da_dtInteger:
     PStDate(aClientBuffer)^ := PInteger(aServerBuffer)^;
    da_dtByte:
     PStDate(aClientBuffer)^ := PByte(aServerBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

  da_dtTime:
   case ClientBufferFormat of
    da_dtChar:
     PStTime(aClientBuffer)^ := StrToInt(PAnsiChar(aServerBuffer)^);
    da_dtDWord:
     PStTime(aClientBuffer)^ := PLongWord(aServerBuffer)^;
    da_dtQWord:
     PStTime(aClientBuffer)^ := PLargeInt(aServerBuffer)^;
    da_dtDate:
     PStTime(aClientBuffer)^ := PStDate(aServerBuffer)^;
    da_dtTime:
     PStTime(aClientBuffer)^ := PStTime(aServerBuffer)^;
    da_dtWord:
     PStTime(aClientBuffer)^ := PWord(aServerBuffer)^;
    da_dtInteger:
     PStTime(aClientBuffer)^ := PInteger(aServerBuffer)^;
    da_dtByte:
     PStTime(aClientBuffer)^ := PByte(aServerBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end;

  da_dtWord:
   case ClientBufferFormat of
    da_dtChar:
     PWord(aClientBuffer)^ := StrToInt(PAnsiChar(aServerBuffer)^);
    da_dtDWord:
     PWord(aClientBuffer)^ := PLongWord(aServerBuffer)^;
    da_dtQWord:
     PWord(aClientBuffer)^ := PLargeInt(aServerBuffer)^;
    da_dtDate:
     PWord(aClientBuffer)^ := PStDate(aServerBuffer)^;
    da_dtTime:
     PWord(aClientBuffer)^ := PStTime(aServerBuffer)^;
    da_dtWord:
     PWord(aClientBuffer)^ := PWord(aServerBuffer)^;
    da_dtInteger:
     PWord(aClientBuffer)^ := PInteger(aServerBuffer)^;
    da_dtByte:
     PWord(aClientBuffer)^ := PByte(aServerBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

  da_dtInteger:
   case ClientBufferFormat of
    da_dtChar:
     PInteger(aClientBuffer)^ := StrToInt(PAnsiChar(aServerBuffer)^);
    da_dtDWord:
     PInteger(aClientBuffer)^ := PLongWord(aServerBuffer)^;
    da_dtQWord:
     PInteger(aClientBuffer)^ := PLargeInt(aServerBuffer)^;
    da_dtDate:
     PInteger(aClientBuffer)^ := PStDate(aServerBuffer)^;
    da_dtTime:
     PInteger(aClientBuffer)^ := PStTime(aServerBuffer)^;
    da_dtWord:
     PInteger(aClientBuffer)^ := PWord(aServerBuffer)^;
    da_dtInteger:
     PInteger(aClientBuffer)^ := PInteger(aServerBuffer)^;
    da_dtByte:
     PInteger(aClientBuffer)^ := PByte(aServerBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

  da_dtByte:
   case ClientBufferFormat of
    da_dtChar:
     PByte(aClientBuffer)^ := StrToInt(PAnsiChar(aServerBuffer)^);
    da_dtDWord:
     PByte(aClientBuffer)^ := PLongWord(aServerBuffer)^;
    da_dtQWord:
     PByte(aClientBuffer)^ := PLargeInt(aServerBuffer)^;
    da_dtDate:
     PByte(aClientBuffer)^ := PStDate(aServerBuffer)^;
    da_dtTime:
     PByte(aClientBuffer)^ := PStTime(aServerBuffer)^;
    da_dtWord:
     PByte(aClientBuffer)^ := PWord(aServerBuffer)^;
    da_dtInteger:
     PByte(aClientBuffer)^ := PInteger(aServerBuffer)^;
    da_dtByte:
     PByte(aClientBuffer)^ := PByte(aServerBuffer)^;
(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

(*
++   da_dtChar
++ , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
++ , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
 else
  Assert(False);
 end;
//!! !!! Needs to be implemented !!!
//#UC END# *55599596005B_55E42F2D027B_impl*
end;//TpgDataConverter.ParamFromDataBase

procedure TpgDataConverter.FreeParamBuffer(const aDescription: IdaParamDescription;
 aBuffer: Pointer);
//#UC START# *5559D14D02D1_55E42F2D027B_var*
//#UC END# *5559D14D02D1_55E42F2D027B_var*
begin
//#UC START# *5559D14D02D1_55E42F2D027B_impl*
 l3System.FreeLocalMem(aBuffer);
//#UC END# *5559D14D02D1_55E42F2D027B_impl*
end;//TpgDataConverter.FreeParamBuffer

function TpgDataConverter.ToInteger(aData: Pointer): Integer;
//#UC START# *5627650001E5_55E42F2D027B_var*
//#UC END# *5627650001E5_55E42F2D027B_var*
begin
//#UC START# *5627650001E5_55E42F2D027B_impl*
 Result := StrToInt(PAnsiChar(aData));
//#UC END# *5627650001E5_55E42F2D027B_impl*
end;//TpgDataConverter.ToInteger

function TpgDataConverter.ToLargeInt(aData: Pointer): LargeInt;
//#UC START# *56276513038B_55E42F2D027B_var*
//#UC END# *56276513038B_55E42F2D027B_var*
begin
//#UC START# *56276513038B_55E42F2D027B_impl*
 Result := StrToInt64(PAnsiChar(aData));
//#UC END# *56276513038B_55E42F2D027B_impl*
end;//TpgDataConverter.ToLargeInt

function TpgDataConverter.ToStDate(aData: Pointer): TStDate;
//#UC START# *56276521027B_55E42F2D027B_var*
//#UC END# *56276521027B_55E42F2D027B_var*
begin
//#UC START# *56276521027B_55E42F2D027B_impl*
 Result := StrToInt(PAnsiChar(aData));
//#UC END# *56276521027B_55E42F2D027B_impl*
end;//TpgDataConverter.ToStDate

function TpgDataConverter.ToStTime(aData: Pointer): TStTime;
//#UC START# *562765320349_55E42F2D027B_var*
//#UC END# *562765320349_55E42F2D027B_var*
begin
//#UC START# *562765320349_55E42F2D027B_impl*
 Result := StrToInt(PAnsiChar(aData));
//#UC END# *562765320349_55E42F2D027B_impl*
end;//TpgDataConverter.ToStTime

function TpgDataConverter.ToString(aData: Pointer): AnsiString;
//#UC START# *5627654202D2_55E42F2D027B_var*
//#UC END# *5627654202D2_55E42F2D027B_var*
begin
//#UC START# *5627654202D2_55E42F2D027B_impl*
 Result := PAnsiChar(aData);
//#UC END# *5627654202D2_55E42F2D027B_impl*
end;//TpgDataConverter.ToString

function TpgDataConverter.ToByte(aData: Pointer): Byte;
//#UC START# *562E129A00BB_55E42F2D027B_var*
//#UC END# *562E129A00BB_55E42F2D027B_var*
begin
//#UC START# *562E129A00BB_55E42F2D027B_impl*
 Result := StrToInt(PAnsiChar(aData));
//#UC END# *562E129A00BB_55E42F2D027B_impl*
end;//TpgDataConverter.ToByte
{$IfEnd} // Defined(UsePostgres)

end.
