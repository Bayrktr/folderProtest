import 'package:DocuSort/app/core/model/base_model.dart';
import 'package:DocuSort/app/product/model/error/response_error_model.dart';

class ResponseBaseModel<T extends BaseModel> {
  final T? data;
  final ResponseErrorModel? error;

  ResponseBaseModel({
    this.data,
    this.error,
  });

  factory ResponseBaseModel.fromJson(Map<String, dynamic> json) {
    return ResponseBaseModel(
      data: json['data'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'error': error,
    };
  }

  ResponseBaseModel<T> copyWith({
    T? data,
    ResponseErrorModel? error,
  }) {
    return ResponseBaseModel<T>(
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
