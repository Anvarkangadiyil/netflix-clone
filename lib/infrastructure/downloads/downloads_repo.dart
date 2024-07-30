import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/api_end_points.dart';
import 'package:netflix_clone_app/domain/core/failures/main_failure.dart';
import 'package:netflix_clone_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone_app/domain/downloads/models/downloads.dart';

//  ! 'as' means when  call IDownload we also call DowloadsRespository means the IDowloads respository call is replaced by DowloadsRespository

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  final Dio _dio;

  DownloadsRepository()
      : _dio = Dio(BaseOptions(
          connectTimeout: Duration(seconds: 5000),
          receiveTimeout: Duration(seconds: 3000),
        ));

  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response = await _dio.get(
        ApiEndPoints.downloads,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList =
            (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e as Map<String, dynamic>);
        }).toList();

        log(downloadsList.toString());

        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        log('Timeout Error: ${dioError.message}');
      } else if (dioError.type == DioExceptionType.badResponse) {
        log('Response Error: ${dioError.response?.statusCode} - ${dioError.response?.statusMessage}');
      } else if (dioError.type == DioExceptionType.unknown) {
        log('Other Error: ${dioError.message}');
      } else {
        log('DioError: ${dioError.message}');
      }
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log('Unexpected Error: $e');
      return const Left(MainFailure.clientFailure());
    }
  }
}
