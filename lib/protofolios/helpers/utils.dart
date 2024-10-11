String toCommaSeperated(double num) {
  int integerPart = num.toInt();
  int floatPart = ((num - integerPart) * 100).toInt();

  final commaInt = integerPart.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );

  if (floatPart != 0) {
    return '$commaInt.$floatPart';
  }
  return commaInt;
}
