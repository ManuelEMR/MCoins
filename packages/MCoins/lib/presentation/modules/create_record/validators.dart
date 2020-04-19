String isNotEmpty(String value) {
  return value?.isNotEmpty == true ? null : "Cannot be empty";
}

String minLength(String value, int length) {
  return value.length >= length ? null : "Length cannot be less than $length";
}

String maxLength(String value, int length) {
  return value.length <= length
      ? null
      : "Length cannot be greater than $length";
}
