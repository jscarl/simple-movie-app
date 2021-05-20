class BaseResponse<T> {
  BaseResponse({
    this.data,
    this.statusMessage,
    this.success,
    this.statusCode,
  });

  T? data;
  String? statusMessage;
  bool? success;
  int? statusCode;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    statusMessage = json['status_message'];
    success = json['success'];
    statusCode = json['status_code'];
  }
}
