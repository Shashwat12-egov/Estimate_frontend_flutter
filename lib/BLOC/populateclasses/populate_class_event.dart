part of 'populate_class_bloc.dart';

sealed class PopulateClassEvent extends Equatable {
  const PopulateClassEvent();

  @override
  List<Object> get props => [];
}

class SavingEstimateFormData extends PopulateClassEvent {}

class SavingAddressFormData extends PopulateClassEvent {}

class SavingEstimateDetailsFormData extends PopulateClassEvent {}

class SendingDatatoBackend extends PopulateClassEvent {}

class EstimateDetailsCount extends PopulateClassEvent {}