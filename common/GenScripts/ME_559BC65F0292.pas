unit ItfwParserWordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\ItfwParserWordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwParserInterfaces
 , l3Interfaces
 , l3Parser
 , tfwClassLike
 , tfwScriptingInterfaces
 , TypInfo
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , ItfwKeywordFinderWordsPack
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , SysUtils
;

type
 TkwPopParserNextToken = {final} class(TtfwClassLike)
  {* ����� ������� pop:Parser:NextToken
*������:*
[code]
 aParser pop:Parser:NextToken
[code]  }
  private
   procedure NextToken(const aCtx: TtfwContext;
    const aParser: ItfwParser);
    {* ���������� ����� ������� pop:Parser:NextToken }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopParserNextToken

 TkwPopParserTokenLongString = {final} class(TtfwClassLike)
  {* ����� ������� pop:Parser:TokenLongString
*��� ����������:* Il3CString
*������:*
[code]
STRING VAR l_Il3CString
 aParser pop:Parser:TokenLongString >>> l_Il3CString
[code]  }
  private
   function TokenLongString(const aCtx: TtfwContext;
    const aParser: ItfwParser): Il3CString;
    {* ���������� ����� ������� pop:Parser:TokenLongString }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopParserTokenLongString

 TkwPopParserTokenInt = {final} class(TtfwClassLike)
  {* ����� ������� pop:Parser:TokenInt
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aParser pop:Parser:TokenInt >>> l_Integer
[code]  }
  private
   function TokenInt(const aCtx: TtfwContext;
    const aParser: ItfwParser): Integer;
    {* ���������� ����� ������� pop:Parser:TokenInt }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopParserTokenInt

 TkwPopParserFileName = {final} class(TtfwClassLike)
  {* ����� ������� pop:Parser:FileName
*��� ����������:* String
*������:*
[code]
STRING VAR l_String
 aParser pop:Parser:FileName >>> l_String
[code]  }
  private
   function FileName(const aCtx: TtfwContext;
    const aParser: ItfwParser): AnsiString;
    {* ���������� ����� ������� pop:Parser:FileName }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopParserFileName

 TkwPopParserTokenType = {final} class(TtfwClassLike)
  {* ����� ������� pop:Parser:TokenType
*��� ����������:* Tl3TokenType
*������:*
[code]
Tl3TokenType VAR l_Tl3TokenType
 aParser pop:Parser:TokenType >>> l_Tl3TokenType
[code]  }
  private
   function TokenType(const aCtx: TtfwContext;
    const aParser: ItfwParser): Tl3TokenType;
    {* ���������� ����� ������� pop:Parser:TokenType }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopParserTokenType

 TkwPopParserSourceLine = {final} class(TtfwClassLike)
  {* ����� ������� pop:Parser:SourceLine
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aParser pop:Parser:SourceLine >>> l_Integer
[code]  }
  private
   function SourceLine(const aCtx: TtfwContext;
    const aParser: ItfwParser): Integer;
    {* ���������� ����� ������� pop:Parser:SourceLine }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopParserSourceLine

procedure TkwPopParserNextToken.NextToken(const aCtx: TtfwContext;
 const aParser: ItfwParser);
 {* ���������� ����� ������� pop:Parser:NextToken }
//#UC START# *F35D5ECD9EFB_9FCC7CEF0219_var*
//#UC END# *F35D5ECD9EFB_9FCC7CEF0219_var*
begin
//#UC START# *F35D5ECD9EFB_9FCC7CEF0219_impl*
 !!! Needs to be implemented !!!
//#UC END# *F35D5ECD9EFB_9FCC7CEF0219_impl*
end;//TkwPopParserNextToken.NextToken

procedure TkwPopParserNextToken.DoDoIt(const aCtx: TtfwContext);
var l_aParser: ItfwParser;
begin
 try
  l_aParser := ItfwParser(aCtx.rEngine.PopIntf(ItfwParser));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aParser: ItfwParser : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 NextToken(aCtx, l_aParser);
end;//TkwPopParserNextToken.DoDoIt

class function TkwPopParserNextToken.GetWordNameForRegister: AnsiString;
begin
!!! mappedNextToken
end;//TkwPopParserNextToken.GetWordNameForRegister

function TkwPopParserNextToken.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiVoid;
end;//TkwPopParserNextToken.GetResultTypeInfo

function TkwPopParserNextToken.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopParserNextToken.GetAllParamsCount

function TkwPopParserNextToken.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(ItfwParser)]);
end;//TkwPopParserNextToken.ParamsTypes

function TkwPopParserTokenLongString.TokenLongString(const aCtx: TtfwContext;
 const aParser: ItfwParser): Il3CString;
 {* ���������� ����� ������� pop:Parser:TokenLongString }
//#UC START# *B4F2C24959BB_391DC30DE773_var*
//#UC END# *B4F2C24959BB_391DC30DE773_var*
begin
//#UC START# *B4F2C24959BB_391DC30DE773_impl*
 !!! Needs to be implemented !!!
//#UC END# *B4F2C24959BB_391DC30DE773_impl*
end;//TkwPopParserTokenLongString.TokenLongString

procedure TkwPopParserTokenLongString.DoDoIt(const aCtx: TtfwContext);
var l_aParser: ItfwParser;
begin
 try
  l_aParser := ItfwParser(aCtx.rEngine.PopIntf(ItfwParser));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aParser: ItfwParser : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString(TokenLongString(aCtx, l_aParser));
end;//TkwPopParserTokenLongString.DoDoIt

class function TkwPopParserTokenLongString.GetWordNameForRegister: AnsiString;
begin
!!! mappedTokenLongString
end;//TkwPopParserTokenLongString.GetWordNameForRegister

function TkwPopParserTokenLongString.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiString;
end;//TkwPopParserTokenLongString.GetResultTypeInfo

function TkwPopParserTokenLongString.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopParserTokenLongString.GetAllParamsCount

function TkwPopParserTokenLongString.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(ItfwParser)]);
end;//TkwPopParserTokenLongString.ParamsTypes

function TkwPopParserTokenInt.TokenInt(const aCtx: TtfwContext;
 const aParser: ItfwParser): Integer;
 {* ���������� ����� ������� pop:Parser:TokenInt }
//#UC START# *9C93DFBF7BED_37FA824BDEEE_var*
//#UC END# *9C93DFBF7BED_37FA824BDEEE_var*
begin
//#UC START# *9C93DFBF7BED_37FA824BDEEE_impl*
 !!! Needs to be implemented !!!
//#UC END# *9C93DFBF7BED_37FA824BDEEE_impl*
end;//TkwPopParserTokenInt.TokenInt

procedure TkwPopParserTokenInt.DoDoIt(const aCtx: TtfwContext);
var l_aParser: ItfwParser;
begin
 try
  l_aParser := ItfwParser(aCtx.rEngine.PopIntf(ItfwParser));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aParser: ItfwParser : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(TokenInt(aCtx, l_aParser));
end;//TkwPopParserTokenInt.DoDoIt

class function TkwPopParserTokenInt.GetWordNameForRegister: AnsiString;
begin
!!! mappedTokenInt
end;//TkwPopParserTokenInt.GetWordNameForRegister

function TkwPopParserTokenInt.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Integer);
end;//TkwPopParserTokenInt.GetResultTypeInfo

function TkwPopParserTokenInt.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopParserTokenInt.GetAllParamsCount

function TkwPopParserTokenInt.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(ItfwParser)]);
end;//TkwPopParserTokenInt.ParamsTypes

function TkwPopParserFileName.FileName(const aCtx: TtfwContext;
 const aParser: ItfwParser): AnsiString;
 {* ���������� ����� ������� pop:Parser:FileName }
//#UC START# *6F6E961268B2_77621D03947E_var*
//#UC END# *6F6E961268B2_77621D03947E_var*
begin
//#UC START# *6F6E961268B2_77621D03947E_impl*
 !!! Needs to be implemented !!!
//#UC END# *6F6E961268B2_77621D03947E_impl*
end;//TkwPopParserFileName.FileName

procedure TkwPopParserFileName.DoDoIt(const aCtx: TtfwContext);
var l_aParser: ItfwParser;
begin
 try
  l_aParser := ItfwParser(aCtx.rEngine.PopIntf(ItfwParser));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aParser: ItfwParser : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString(FileName(aCtx, l_aParser));
end;//TkwPopParserFileName.DoDoIt

class function TkwPopParserFileName.GetWordNameForRegister: AnsiString;
begin
!!! mappedFileName
end;//TkwPopParserFileName.GetWordNameForRegister

function TkwPopParserFileName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiString;
end;//TkwPopParserFileName.GetResultTypeInfo

function TkwPopParserFileName.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopParserFileName.GetAllParamsCount

function TkwPopParserFileName.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(ItfwParser)]);
end;//TkwPopParserFileName.ParamsTypes

function TkwPopParserTokenType.TokenType(const aCtx: TtfwContext;
 const aParser: ItfwParser): Tl3TokenType;
 {* ���������� ����� ������� pop:Parser:TokenType }
//#UC START# *31C292E4C39C_5CF115AC9203_var*
//#UC END# *31C292E4C39C_5CF115AC9203_var*
begin
//#UC START# *31C292E4C39C_5CF115AC9203_impl*
 !!! Needs to be implemented !!!
//#UC END# *31C292E4C39C_5CF115AC9203_impl*
end;//TkwPopParserTokenType.TokenType

procedure TkwPopParserTokenType.DoDoIt(const aCtx: TtfwContext);
var l_aParser: ItfwParser;
begin
 try
  l_aParser := ItfwParser(aCtx.rEngine.PopIntf(ItfwParser));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aParser: ItfwParser : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(Ord(TokenType(aCtx, l_aParser)));
end;//TkwPopParserTokenType.DoDoIt

class function TkwPopParserTokenType.GetWordNameForRegister: AnsiString;
begin
!!! mappedTokenType
end;//TkwPopParserTokenType.GetWordNameForRegister

function TkwPopParserTokenType.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Tl3TokenType);
end;//TkwPopParserTokenType.GetResultTypeInfo

function TkwPopParserTokenType.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopParserTokenType.GetAllParamsCount

function TkwPopParserTokenType.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(ItfwParser)]);
end;//TkwPopParserTokenType.ParamsTypes

function TkwPopParserSourceLine.SourceLine(const aCtx: TtfwContext;
 const aParser: ItfwParser): Integer;
 {* ���������� ����� ������� pop:Parser:SourceLine }
//#UC START# *3C60D351E591_F99E43E0E32C_var*
//#UC END# *3C60D351E591_F99E43E0E32C_var*
begin
//#UC START# *3C60D351E591_F99E43E0E32C_impl*
 !!! Needs to be implemented !!!
//#UC END# *3C60D351E591_F99E43E0E32C_impl*
end;//TkwPopParserSourceLine.SourceLine

procedure TkwPopParserSourceLine.DoDoIt(const aCtx: TtfwContext);
var l_aParser: ItfwParser;
begin
 try
  l_aParser := ItfwParser(aCtx.rEngine.PopIntf(ItfwParser));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aParser: ItfwParser : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(SourceLine(aCtx, l_aParser));
end;//TkwPopParserSourceLine.DoDoIt

class function TkwPopParserSourceLine.GetWordNameForRegister: AnsiString;
begin
!!! mappedSourceLine
end;//TkwPopParserSourceLine.GetWordNameForRegister

function TkwPopParserSourceLine.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Integer);
end;//TkwPopParserSourceLine.GetResultTypeInfo

function TkwPopParserSourceLine.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopParserSourceLine.GetAllParamsCount

function TkwPopParserSourceLine.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(ItfwParser)]);
end;//TkwPopParserSourceLine.ParamsTypes

initialization
 TkwPopParserNextToken.RegisterInEngine;
 {* ����������� pop_Parser_NextToken }
 TkwPopParserTokenLongString.RegisterInEngine;
 {* ����������� pop_Parser_TokenLongString }
 TkwPopParserTokenInt.RegisterInEngine;
 {* ����������� pop_Parser_TokenInt }
 TkwPopParserFileName.RegisterInEngine;
 {* ����������� pop_Parser_FileName }
 TkwPopParserTokenType.RegisterInEngine;
 {* ����������� pop_Parser_TokenType }
 TkwPopParserSourceLine.RegisterInEngine;
 {* ����������� pop_Parser_SourceLine }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(ItfwParser));
 {* ����������� ���� ItfwParser }
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
 {* ����������� ���� Il3CString }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
 {* ����������� ���� String }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Tl3TokenType));
 {* ����������� ���� Tl3TokenType }
{$IfEnd} // NOT Defined(NoScripts)

end.
