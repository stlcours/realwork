unit AACContentsContainer_Form;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\AAC\Forms\AACContentsContainer_Form.pas"
// ���������: "VCMFinalContainer"
// ������� ������: "AACContentsContainer" MUID: (4FF4543F014A)
// ��� ����: "TAACContentsContainerForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , AACContainerPrim_Form
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmEntities
 {$IfEnd} // NOT Defined(NoVCM)
;

const
 fm_AACContentsContainerForm: TvcmFormDescriptor = (rFormID : (rName : 'AACContentsContainerForm'; rID : 0); rFactory : nil);
  {* ������������� ����� TAACContentsContainerForm }

type
 TAACContentsContainerForm = class;

 AACContentsContainerFormDef = interface
  {* ������������� ����� AACContentsContainer }
  ['{3EBD2AC1-BEED-4678-BF35-5B80CE4A6852}']
 end;//AACContentsContainerFormDef

 TAACContentsContainerForm = {final} class(TAACContainerPrimForm, AACContentsContainerFormDef)
   Entities : TvcmEntities;
 end;//TAACContentsContainerForm
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , AACContentsContainerKeywordsPack
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
;

{$R *.DFM}

initialization
 fm_AACContentsContainerForm.SetFactory(TAACContentsContainerForm.Make);
 {* ����������� ������� ����� AACContentsContainer }
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TAACContentsContainerForm);
 {* ����������� AACContentsContainer }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
