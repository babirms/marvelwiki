class ApiExceptions {
  final String message;

  ApiExceptions({required this.message});
}

class NotAuthorizedException extends ApiExceptions {
  NotAuthorizedException({required super.message});
}

class WrongOrInvalidParamException extends ApiExceptions {
  WrongOrInvalidParamException({required super.message});
}

class CharacterNotFoundException extends ApiExceptions {
  CharacterNotFoundException({required super.message});
}

class DataNotFound extends ApiExceptions {
  DataNotFound({required super.message});
}
