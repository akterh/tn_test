abstract class PaymentStatus {
  static const String pending = 'pending';
  static const String paid = 'paid';
  static const String canceled = 'canceled';
  static const String failed = 'failed';
  static const String confirmed = 'confirmed';
  static const String refundRequested = 'refund_requested';
  static const String refundInProgress = 'refund_in_progress';
  static const String refundFailed = 'refund_failed';
  static const String refunded = 'refunded';
}
