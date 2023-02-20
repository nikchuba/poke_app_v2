import 'package:ansicolor/ansicolor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/data/api_url.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

init(GetIt locator) {
  const baseUrl = ApiUrl.domain + ApiUrl.restApiPath;
  final dio = Dio();
  dio.options = BaseOptions(baseUrl: baseUrl, receiveDataWhenStatusError: true);
  if (!kIsWeb) {
    dio.interceptors.add(
      TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
          printResponseHeaders: true,
          printResponseData: false,
          printRequestHeaders: true,
          requestPen: AnsiPen()..xterm(93),
          responsePen: AnsiPen()..xterm(47),
          errorPen: AnsiPen()..xterm(197),
        ),
      ),
    );
  }

  locator.registerSingleton<Dio>(dio);
}
