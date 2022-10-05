import 'package:dartz/dartz.dart';
import 'package:student_app/dataProviders/error/failures.dart';
import 'package:student_app/dataProviders/local_data_provider.dart';
import 'package:student_app/dataProviders/network/Network_info.dart';
import 'package:student_app/dataProviders/network/data_source_url.dart';
import 'package:student_app/dataProviders/remote_data_provider.dart';
import 'package:student_app/dataProviders/repository.dart';
import 'package:meta/meta.dart';
import 'package:student_app/fetures/user/data/models/UserModel.dart';

class RegistrationRepository extends Repository {
  final RemoteDataProvider remoteDataProvider; //get the data from the internet
  final LocalDataProvider localDataProvider; //get the data from the local cache
  final NetworkInfo networkInfo; //check if the device is connected to internet

  RegistrationRepository(
  {
    required this.remoteDataProvider,
    required this.localDataProvider,
    required this.networkInfo,
  }

  );




  Future<Either<Failure, dynamic>> sendLoginRequest({
    required String email,
    required String password,
  }) async {
    return await sendRequest(
      checkConnection: networkInfo.isConnected,
      remoteFunction: () async {
        final remoteData = await remoteDataProvider.sendData(
          url: DataSourceURL.login,
          retrievedDataType: UserModel.init(),
          returnType: List,
          body: {
            'email': email,
            'password': password,
          },
        );

        UserModel userModel=remoteData;
        localDataProvider.cacheData(key: 'CACHED_USER', data: userModel.toJson());
        return remoteData;
      },
    );
  }

}
