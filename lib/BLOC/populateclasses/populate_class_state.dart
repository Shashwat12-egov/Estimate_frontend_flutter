part of 'populate_class_bloc.dart';

class PopulateClassState extends Equatable {
  final Estimate estimateData;
  final bool isValid;

  const PopulateClassState(this.estimateData,this.isValid);
  
  @override
  List<Object> get props => [estimateData,isValid];
}
