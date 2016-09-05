{$IfNDef msmConcreteModelOwnViewControllerMixin_imp}

// ������: "w:\common\components\gui\Garant\msm\msmConcreteModelOwnViewControllerMixin.imp.pas"
// ���������: "Impurity"
// ������� ������: "msmConcreteModelOwnViewControllerMixin" MUID: (57AAE9AD018B)
// ��� ����: "_msmConcreteModelOwnViewControllerMixin_"

{$Define msmConcreteModelOwnViewControllerMixin_imp}

 // _ConcreteModel_

 _msmConcreteModelOwnViewControllerMixin_ = {abstract} class(_msmConcreteModelOwnViewControllerMixin_Parent_)
  private
   f_Model: _ConcreteModel_;
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
  public
   constructor Create(const aModel: _ConcreteModel_;
    const aParent: ImsmViewParent); reintroduce; overload;
   class function Make(const aModel: _ConcreteModel_;
    const aParent: ImsmViewParent): ImsmViewController; reintroduce; overload;
   constructor Create(const aModel: _ConcreteModel_;
    const aParent: ImsmViewParent;
    const anInitContext: _InitContext_); reintroduce; overload;
   class function Make(const aModel: _ConcreteModel_;
    const aParent: ImsmViewParent;
    const anInitContext: _InitContext_): ImsmViewController; reintroduce; overload;
  protected
   property Model: _ConcreteModel_
    read f_Model;
 end;//_msmConcreteModelOwnViewControllerMixin_

{$Else msmConcreteModelOwnViewControllerMixin_imp}

{$IfNDef msmConcreteModelOwnViewControllerMixin_imp_impl}

{$Define msmConcreteModelOwnViewControllerMixin_imp_impl}

constructor _msmConcreteModelOwnViewControllerMixin_.Create(const aModel: _ConcreteModel_;
 const aParent: ImsmViewParent);
//#UC START# *57AAEA5202AA_57AAE9AD018B_var*
var
 l_InitContext : _InitContext_;
//#UC END# *57AAEA5202AA_57AAE9AD018B_var*
begin
//#UC START# *57AAEA5202AA_57AAE9AD018B_impl*
 Finalize(l_InitContext);
 System.FillChar(l_InitContext, SizeOf(l_InitContext), 0);
 Create(aModel, aParent, l_InitContext);
//#UC END# *57AAEA5202AA_57AAE9AD018B_impl*
end;//_msmConcreteModelOwnViewControllerMixin_.Create

class function _msmConcreteModelOwnViewControllerMixin_.Make(const aModel: _ConcreteModel_;
 const aParent: ImsmViewParent): ImsmViewController;
var
 l_Inst : _msmConcreteModelOwnViewControllerMixin_;
begin
 l_Inst := Create(aModel, aParent);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//_msmConcreteModelOwnViewControllerMixin_.Make

constructor _msmConcreteModelOwnViewControllerMixin_.Create(const aModel: _ConcreteModel_;
 const aParent: ImsmViewParent;
 const anInitContext: _InitContext_);
//#UC START# *57B466EE01D6_57AAE9AD018B_var*
//#UC END# *57B466EE01D6_57AAE9AD018B_var*
begin
//#UC START# *57B466EE01D6_57AAE9AD018B_impl*
 Assert(aModel <> nil);
 f_Model := aModel;
 inherited Create(aModel, aParent, anInitContext);
//#UC END# *57B466EE01D6_57AAE9AD018B_impl*
end;//_msmConcreteModelOwnViewControllerMixin_.Create

class function _msmConcreteModelOwnViewControllerMixin_.Make(const aModel: _ConcreteModel_;
 const aParent: ImsmViewParent;
 const anInitContext: _InitContext_): ImsmViewController;
var
 l_Inst : _msmConcreteModelOwnViewControllerMixin_;
begin
 l_Inst := Create(aModel, aParent, anInitContext);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//_msmConcreteModelOwnViewControllerMixin_.Make

procedure _msmConcreteModelOwnViewControllerMixin_.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_57AAE9AD018B_var*
//#UC END# *479731C50290_57AAE9AD018B_var*
begin
//#UC START# *479731C50290_57AAE9AD018B_impl*
 inherited;
 f_Model := nil;
//#UC END# *479731C50290_57AAE9AD018B_impl*
end;//_msmConcreteModelOwnViewControllerMixin_.Cleanup

{$EndIf msmConcreteModelOwnViewControllerMixin_imp_impl}

{$EndIf msmConcreteModelOwnViewControllerMixin_imp}

