abstract class SplashPresenter {
  //5 - criando a Stream 
  Stream<String> get navigateToStream;
  
  Future<void> checkAccount();
}