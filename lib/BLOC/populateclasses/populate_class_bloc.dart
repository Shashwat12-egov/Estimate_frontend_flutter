import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:estimate_flutter/Models/Address.dart';
import 'package:estimate_flutter/Models/Estimate.dart';
import 'package:estimate_flutter/Models/EstimateDetails.dart';
import 'package:estimate_flutter/mapping.dart';

part 'populate_class_event.dart';
part 'populate_class_state.dart';

class PopulateClassBloc extends Bloc<PopulateClassEvent, PopulateClassState> {
  PopulateClassBloc() : super(PopulateClassState(Estimate(
    estimateDetails: []
  ),true)) {
    on<SavingEstimateFormData>(_savingEstimateFormData);
    on<SavingAddressFormData>(_savingAddressFormData);
    on<SavingEstimateDetailsFormData>(_savingEstimateDetailsFormData);
    on<SendingDatatoBackend>(_sendingDatatoBackend);
    on<IsValiddata>(_isValiddata);
  }

  void _savingEstimateFormData(SavingEstimateFormData event, Emitter<PopulateClassState> emit) {
    // Estimate estimate;
    Estimate estimate=Estimate.fromJson(globalEstimate);
    emit(PopulateClassState(estimate,state.isValid));
  }

  void _savingAddressFormData(SavingAddressFormData event, Emitter<PopulateClassState> emit) {
    // Estimate estimate;
    Address address=Address.fromJson(globalAddress);
    Estimate estimate=state.estimateData;
    estimate.address=address;
    emit(PopulateClassState(estimate,state.isValid));
  }

   void _savingEstimateDetailsFormData(SavingEstimateDetailsFormData event, Emitter<PopulateClassState> emit) {
    // Estimate estimate;
    EstimateDetail estimateDetail=EstimateDetail.fromJson(globalEstimateDetails);
    Estimate estimate=state.estimateData;
    estimate.estimateDetails ??= [];
    estimate.estimateDetails?.add(estimateDetail);
    emit(PopulateClassState(estimate,state.isValid));
  }

  void _sendingDatatoBackend(SendingDatatoBackend event, Emitter<PopulateClassState> emit) async {
    final Dio dio = Dio();

    final dynamic estimate = state.estimateData.toJson();

    final dynamic body={
      "RequestInfo": {
          "apiId": "string",
          "ver": "string",
          "ts": 0,
          "action": "string",
          "did": "string",
          "key": "string",
          "msgId": "string",
          "requesterId": "string",
          "userInfo":{
              "tenantId":"pb.jalandhar,dwss",
              "uuid":"0477b319-7cd3-4b5e-98ec-dc7ed140b623"
          },
          "authToken": "string"
      },
      "estimate": estimate
    };    

    try {
      await dio.post('http://localhost:8081/Backend_assignment/estimate/v1/_create',
        data: body,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            // Add any other headers if needed
          },
        ),
      );
    
    } catch (e) {
      rethrow;
    }
  }

  void _isValiddata(IsValiddata event, Emitter<PopulateClassState> emit) {
    emit(PopulateClassState(state.estimateData,!state.isValid));
  }
}
