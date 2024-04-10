class JRException implements Exception {
  JRException(
    this.message, {
    this.data,
    this.status = false,
    this.statusCode,
  });

  final String message;
  final String? statusCode;
  final String? data;
  final bool status;

  @override
  String toString() {
    return '${statusCode != null ? ('${statusCode!}: ') : ''}$message';
  }
}
