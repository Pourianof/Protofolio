mixin Holder<T> {
  T? holdData;

  updateHoldData(T newData) {
    holdData = newData;
  }
}
