import 'package:dartz/dartz.dart';

import '../error/error.dart';

typedef ErrorOr<T> = Either<IError, T>;
