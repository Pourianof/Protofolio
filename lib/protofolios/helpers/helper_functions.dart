List<T> flatten<T>(List list) {
  return list
      .expand<T>((element) => element is List ? flatten(element) : [element])
      .toList();
}
