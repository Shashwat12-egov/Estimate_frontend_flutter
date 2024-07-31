class AmountDetail {
  final String type;
  final double amount;
  final String status;
  final Map<String, dynamic> additionalDetails;

  AmountDetail({
    required this.type,
    required this.amount,
    required this.status,
    required this.additionalDetails,
  });

  factory AmountDetail.fromJson(Map<String, dynamic> json) {
    return AmountDetail(
      type: json['type'],
      amount: json['amount'].toDouble(),
      status: json['status'],
      additionalDetails: json['additionalDetails'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'amount': amount,
      'status': status,
      'additionalDetails': additionalDetails,
    };
  }
}