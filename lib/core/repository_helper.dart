import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'error/error.dart';
import 'typedef/either.dart';
import 'typedef/functions.dart';

mixin RepositoryHelper {
  Future<ErrorOr<Entity>> requestParser<Entity, Dto>({
    required Future<Dto> Function() request,
    required Parser<Entity, Dto> parser,
  }) async {
    try {
      final dto = await request();
      final entity = !kIsWeb ? await compute(parser, dto) : parser(dto);
      return Right(entity);
    } on DioError catch (e) {
      return Left(ServerError(e.message));
    }
  }
}
