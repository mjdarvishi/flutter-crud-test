import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mc_crud_test/core/utils/validation/account.dart';
import 'package:mc_crud_test/core/utils/validation/birth.dart';
import 'package:mc_crud_test/core/utils/validation/email.dart';
import 'package:mc_crud_test/core/utils/validation/mobile.dart';
import 'package:mc_crud_test/core/utils/validation/name.dart';

part 'add_customer_event.dart';

part 'add_customer_state.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  AddCustomerBloc() : super(AddCustomerState()) {
    on<OnFirstNameChangeEvent>(_fistNameChange);
    on<OnLastNameChangeEvent>(_lastNameChange);
    on<OnMobileChangeEvent>(_mobileChange);
    on<OnEmailChangeEvent>(_emailChange);
    on<OnBackNumberChangeEvent>(_accountChange);
    on<OnDateOfBirthNumberChangeEvent>(_birthChange);
  }

  void _fistNameChange(
      OnFirstNameChangeEvent event, Emitter<AddCustomerState> emit) {
    final firstName = Name.dirty(value: event.value);
    emit(state.copyWith(firstName: firstName, formZ: _validation()));
  }

  void _lastNameChange(
      OnLastNameChangeEvent event, Emitter<AddCustomerState> emit) {
    final lastName = Name.dirty(value: event.value);
    emit(state.copyWith(lastName: lastName, formZ: _validation()));
  }

  void _mobileChange(
      OnMobileChangeEvent event, Emitter<AddCustomerState> emit) {
    final mobile = Mobile.dirty(value: event.value);
    emit(state.copyWith(mobile: mobile, formZ: _validation()));
  }

  void _emailChange(OnEmailChangeEvent event, Emitter<AddCustomerState> emit) {
    final email = Email.dirty(value: event.value);
    emit(state.copyWith(email: email, formZ: _validation()));
  }

  void _accountChange(
      OnBackNumberChangeEvent event, Emitter<AddCustomerState> emit) {
    final account = Account.dirty(value: event.value);
    emit(state.copyWith(accountNumber: account, formZ: _validation()));
  }

  void _birthChange(
      OnDateOfBirthNumberChangeEvent event, Emitter<AddCustomerState> emit) {
    final birthDay = Birth.dirty(value: event.value);
    emit(state.copyWith(dateOfBirth: birthDay, formZ: _validation()));
  }

  FormzStatus _validation() {
    return Formz.validate([
      state.firstName ?? const Name.pure(),
      state.lastName ?? const Name.pure(),
      state.mobile ?? const Mobile.pure(),
      state.email ?? const Email.pure(),
      state.accountNumber ?? const Account.pure(),
      state.dateOfBirth ?? const Birth.pure(),
    ]);
  }
}
