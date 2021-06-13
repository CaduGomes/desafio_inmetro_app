abstract class FailureSearch implements Exception {}

class BLESearchError implements FailureSearch {
  final String message;

  BLESearchError(this.message);
}

class BLEDisableError implements FailureSearch {
  final String message;

  BLEDisableError(this.message);
}
