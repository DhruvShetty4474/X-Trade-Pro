import '../MODELS/LoginR.dart';


class LoginAuthentication {
  Future<LoginResponse_Model> login(String username, String password, String? userType) async {
    await Future.delayed(const Duration(seconds: 1));

    int loginType = userType?.toUpperCase() == "ADMIN"?1:2;


    if (username == "USER1" && password == "Password@1"){
      return LoginResponse_Model(username, password, loginType);
    }
    else{
      throw Exception('Invalid credentials');
    }
  }
}


// return LoginResponse(
//     msgSize: 100,
//     messageHeader: ResponseMessageHeader(
//     packetSize: 200,
//     msgCode: 12,  // Assuming 12 is success
//     errorCode: 0,
//     versionNo: 1005,),
//     userName: username,
//     password: password,
//     loginType: userType == "Admin" ? 1: 2,
//     nTokenCount: 5,
//     strategyType: 1,
//     clientID: 123456);