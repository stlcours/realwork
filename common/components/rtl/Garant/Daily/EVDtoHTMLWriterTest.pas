unit EVDtoHTMLWriterTest;

// ������: "w:\common\components\rtl\Garant\Daily\EVDtoHTMLWriterTest.pas"
// ���������: "TestCase"
// ������� ������: "EVDtoHTMLWriterTest" MUID: (516E72CA0386)
// ��� ����: "TEVDtoHTMLWriterTest"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , WriterTest
 , l3Filer
 , ddHTMLWriter
 , k2CustomFileReader
;

type
 TEVDtoHTMLWriterTest = {abstract} class(TWriterTest)
  protected
   procedure EVDtoHTML(const aFileName: AnsiString);
   procedure SomeFormatToHTML(aReader: Tk2CustomFileReader);
   procedure TuningHTMLGenerator(aHTMLReader: TddHTMLGenerator); virtual;
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TEVDtoHTMLWriterTest
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , evdNativeReader
 , SysUtils
 , TestFrameWork
;

procedure TEVDtoHTMLWriterTest.EVDtoHTML(const aFileName: AnsiString);
//#UC START# *516E73FC02CE_516E72CA0386_var*
var
 l_Reader : TevdNativeReader;
//#UC END# *516E73FC02CE_516E72CA0386_var*
begin
//#UC START# *516E73FC02CE_516E72CA0386_impl*
 l_Reader := TevdNativeReader.Make(FileFromCurrent(aFileName));
 try
  SomeFormatToHTML(l_Reader);
 finally
  FreeAndNil(l_Reader);
 end;//try..finally
//#UC END# *516E73FC02CE_516E72CA0386_impl*
end;//TEVDtoHTMLWriterTest.EVDtoHTML

procedure TEVDtoHTMLWriterTest.SomeFormatToHTML(aReader: Tk2CustomFileReader);
var l_Filter: Tl3CustomFiler;
var l_Writer: TddHTMLGenerator;
//#UC START# *516E775B03C9_516E72CA0386_var*
//#UC END# *516E775B03C9_516E72CA0386_var*
begin
//#UC START# *516E775B03C9_516E72CA0386_impl*
 l_Writer := TddHTMLGenerator.Create;
 try
  TuningHTMLGenerator(l_Writer);
  l_Filter := FilerForOutput;
  try
   l_Writer.Filer := l_Filter;
  finally
   FreeAndNil(l_Filter);
  end;//try..finally
  aReader.Generator := l_Writer;
 finally
  FreeAndNil(l_Writer);
 end;//try..finally
 DoWrite(aReader, EtalonSuffix + '.htm')
//#UC END# *516E775B03C9_516E72CA0386_impl*
end;//TEVDtoHTMLWriterTest.SomeFormatToHTML

procedure TEVDtoHTMLWriterTest.TuningHTMLGenerator(aHTMLReader: TddHTMLGenerator);
//#UC START# *56D9300D018D_516E72CA0386_var*
//#UC END# *56D9300D018D_516E72CA0386_var*
begin
//#UC START# *56D9300D018D_516E72CA0386_impl*
 
//#UC END# *56D9300D018D_516E72CA0386_impl*
end;//TEVDtoHTMLWriterTest.TuningHTMLGenerator

function TEVDtoHTMLWriterTest.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'HTML';
end;//TEVDtoHTMLWriterTest.GetFolder

function TEVDtoHTMLWriterTest.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '516E72CA0386';
end;//TEVDtoHTMLWriterTest.GetModelElementGUID
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
