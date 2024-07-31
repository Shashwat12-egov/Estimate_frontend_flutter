part of 'populate_class_bloc.dart';

class PopulateClassState extends Equatable {
  final Estimate estimateData;
  final int estdcount;

  const PopulateClassState(this.estimateData,this.estdcount);
  
  @override
  List<Object> get props => [estimateData,estdcount];
}
