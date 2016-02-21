unit csIdIOHandlerAbstractAdapterPrim;

// ������: "w:\common\components\rtl\Garant\cs\csIdIOHandlerAbstractAdapterPrim.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\rtl\Garant\cs\CsDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , CsObject
 , Classes
;

type
 TcsIdIOHandlerAbstractAdapterPrim = {abstract} class(TCsObject)
  public
   procedure WriteBufferFlush; virtual; abstract;
   function ReadChar: AnsiChar; virtual; abstract;
   function ReadCardinal: Cardinal; virtual; abstract;
   function ReadDateTime: TDateTime; virtual; abstract;
   function ReadLn: AnsiString; virtual; abstract;
   function ReadInt64: Int64; virtual; abstract;
   procedure ReadStream(aStream: TStream;
    aSize: Int64 = -1); virtual; abstract;
   function ReadInteger: Integer; virtual; abstract;
   function ReadSmallInt: SmallInt; virtual; abstract;
   procedure WriteLn(const aString: AnsiString); virtual; abstract;
   procedure WriteCardinal(aValue: Cardinal); virtual; abstract;
   procedure WriteInt64(aValue: Int64); virtual; abstract;
   procedure WriteStream(aStream: TStream;
    aByteCount: Int64 = 0); virtual; abstract;
   procedure WriteChar(aValue: AnsiChar); virtual; abstract;
   procedure WriteSmallInt(aValue: SmallInt); virtual; abstract;
   procedure WriteInteger(aValue: Integer); virtual; abstract;
   procedure WriteDateTime(aValue: TDateTime); virtual; abstract;
   function WaitForReadData(aTimeout: Integer): Boolean; virtual; abstract;
   procedure WriteLargeStr(const aString: AnsiString); virtual; abstract;
   function ReadLargeStr: AnsiString; virtual; abstract;
 end;//TcsIdIOHandlerAbstractAdapterPrim
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
 , l3Base
;
{$IfEnd} // NOT Defined(Nemesis)

end.
