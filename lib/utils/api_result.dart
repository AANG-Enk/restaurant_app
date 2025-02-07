sealed class ApiResult<T> {
  const ApiResult();
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends ApiResult<T> {
  final String message;
  const Error(this.message);
}

class Loading<T> extends ApiResult<T> {
  const Loading();
}

class Initial<T> extends ApiResult<T> {
  const Initial();
}