class APITuple<T> {
  const APITuple({
    required this.data,
    required this.message,
    this.status =false,
  });

  final T? data;
  final String? message;
  final bool status;
}
