extension FunctionX on Function {
  Future<void> delayedOf({Duration? duration, int seconds = 3}) async {
    await Future.delayed(duration ?? Duration(seconds: seconds));
    await this();
  }
}
