import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:vbindex/data/data_source/remote/app_rest_service.dart';
import 'package:vbindex/data/data_source/remote/network/dio_client.dart';
import 'package:vbindex/data/data_source/remote/sample/sample_remote_data_source.dart';
import 'package:vbindex/data/repositories/sample/sample_repo_impl.dart';
import 'package:vbindex/data/services/auth_session_service.dart';
import 'package:vbindex/domain/repositories/sample/sample_repo.dart';
import 'package:vbindex/domain/usecases/sample/sample_usecases.dart';

final class DependencyInjection {
  static Future<void> init() async {
    await Di().init();
    await EnvironmentConfig.bootstrap();

    _registerNetworking();
    _registerServices();
    _registerRepositories();
    _registerUseCases();
  }

  static void _registerNetworking() {
    getIt.registerLazySingleton<Dio>(
      () => AppDioClient.create(baseUrl: Environments.getUrl()),
    );
    getIt.registerLazySingleton<AppRestService>(
      () => AppRestService(getIt<Dio>()),
    );
  }

  static void _registerServices() {
    getIt.registerLazySingleton<AuthSessionService>(
      () => const AuthSessionService(),
    );
  }

  static void _registerRepositories() {
    getIt.registerLazySingleton<SampleRemoteDataSource>(
      () =>
          SampleRemoteDataSourceImpl(appRestService: getIt<AppRestService>()),
    );
    getIt.registerLazySingleton<SampleRepo>(
      () => SampleRepoImpl(
        remoteDataSource: getIt<SampleRemoteDataSource>(),
        sessionService: getIt<AuthSessionService>(),
      ),
    );
  }

  static void _registerUseCases() {
    getIt.registerLazySingleton<GetSampleItemsUsecase>(
      () => GetSampleItemsUsecase(getIt<SampleRepo>()),
    );
    getIt.registerLazySingleton<GetSampleItemByIdUsecase>(
      () => GetSampleItemByIdUsecase(getIt<SampleRepo>()),
    );
    getIt.registerLazySingleton<CreateSampleItemUsecase>(
      () => CreateSampleItemUsecase(getIt<SampleRepo>()),
    );
    getIt.registerLazySingleton<UpdateSampleItemUsecase>(
      () => UpdateSampleItemUsecase(getIt<SampleRepo>()),
    );
    getIt.registerLazySingleton<DeleteSampleItemUsecase>(
      () => DeleteSampleItemUsecase(getIt<SampleRepo>()),
    );
  }
}
