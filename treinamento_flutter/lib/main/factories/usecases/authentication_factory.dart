
import '../../../data/usecases/usecases.dart';

import '../../../domain/usescases/usecases.dart';
import '../factories.dart';


Authentication makeRemoteAuthentication(){
  return RemoteAuthentication(
    httpClient: makeHttpAdapter(),
    url: makeApiUrl('login')
  );

}