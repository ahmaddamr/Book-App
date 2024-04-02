abstract class Failure {
  final String error;

  Failure(this.error);
}

class FailureBody extends Failure {
  FailureBody(super.error);
}
