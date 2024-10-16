String? minLengthStringValidator(String val, {String? label, int? minLength}) {
  if (val.trim().length < (minLength ?? 6)) {
    return "طول ${label ?? "عبارت وارد شده"} باید بیشتر از $minLength کارکتر باشد";
  }
  return null;
}

String? emailValidator(String email) {
  final emailValidation = minLengthStringValidator(email, label: "email");

  if (emailValidation != null) {
    return emailValidation;
  }

  if (!email.contains("@")) {
    return "ایمیل باید حاوی کارکتر @ باشد";
  }

  return null;
}
