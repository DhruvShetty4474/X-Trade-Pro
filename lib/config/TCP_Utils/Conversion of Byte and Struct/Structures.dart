import 'dart:ffi';
import 'package:ffi/ffi.dart';

// Define the RequestMessageHeader struct
base class RequestMessageHeader extends Struct {
  @Int32()
  external int msgCode;

  @Int32()
  external int errorCode;

  @Int32()
  external int versionNo;

  void initialize (){
    msgCode = 11;
    errorCode = 0;
    versionNo = 1005;
  }
}

// Define the ResponseMessageHeader struct
base class ResponseMessageHeader extends Struct {
  @Int32()
  external int packetSize;

  @Int32()
  external int msgCode;

  @Int32()
  external int errorCode;

  @Int32()
  external int versionNo;
}

// Define the LoginRequest struct
base class LoginRequest extends Struct {
  @Int32()
  external int msgSize;

  external RequestMessageHeader messageHeader;

  @Array(50)
  external Array<Uint8> userName;

  @Array(10)
  external Array<Uint8> password;

  @Int32()
  external int loginType;

  void initialize({
    required int msgSize,
    required Pointer<RequestMessageHeader> header,
    required List<int> userName,
    required List<int> password,
    required int loginType,
  }) {
    this.msgSize = msgSize;
    messageHeader.msgCode = header.ref.msgCode;
    messageHeader.errorCode = header.ref.errorCode;
    messageHeader.versionNo = header.ref.versionNo;

    final nullChar = '\0'.codeUnitAt(0);

    // Copy userName with null character padding
    for (int i = 0; i < 50; i++) {
      this.userName[i] = i < userName.length ? userName[i] : nullChar;
    }

    // Copy password with null character padding
    for (int i = 0; i < 10; i++) {
      this.password[i] = i < password.length ? password[i] : nullChar;
    }

    this.loginType = loginType;
  }
}

// Define the ResetPasswordStructure struct
base class ResetPasswordStructure extends Struct {
  @Int32()
  external int msgSize;

  external RequestMessageHeader messageHeader;

  @Array(50)
  external Array<Uint8> userName;

  @Array(10)
  external Array<Uint8> password;

  @Array(10)
  external Array<Uint8> newPassword;

  @Int32()
  external int loginType;

  void initialize({
    required int msgSize,
    required Pointer<RequestMessageHeader> header,
    required List<int> userName,
    required List<int> password,
    required List<int> newPassword,
    required int loginType,
  }) {
    this.msgSize = msgSize;
    messageHeader.msgCode = header.ref.msgCode;
    messageHeader.errorCode = header.ref.errorCode;
    messageHeader.versionNo = header.ref.versionNo;

    final nullChar = '\0'.codeUnitAt(0);

    // Copy userName with null character padding
    for (int i = 0; i < 50; i++) {
      this.userName[i] = i < userName.length ? userName[i] : nullChar;
    }

    // Copy password with null character padding
    for (int i = 0; i < 10; i++) {
      this.password[i] = i < password.length ? password[i] : nullChar;
    }

    // Copy newPassword with null character padding
    for (int i = 0; i < 10; i++) {
      this.newPassword[i] = i < newPassword.length ? newPassword[i] : nullChar;
    }

    this.loginType = loginType;
  }
}

// Define the LoginResponse struct
base class LoginResponse extends Struct {
  @Int32()
  external int msgSize;

  external RequestMessageHeader messageHeader;

  @Array(50)
  external Array<Uint8> userName;

  @Array(10)
  external Array<Uint8> password;

  @Int32()
  external int loginType;

  @Int32()
  external int nTokenCount;

  @Int32()
  external int strategyType;

  @Int32()
  external int clientID;

  void initialize({
    required int msgSize,
    required Pointer<RequestMessageHeader> header,
    required List<int> userName,
    required List<int> password,
    required int loginType,
    required int nTokenCount,
    required int strategyType,
    required int clientID,
  }) {
    this.msgSize = msgSize;
    messageHeader.msgCode = header.ref.msgCode;
    messageHeader.errorCode = header.ref.errorCode;
    messageHeader.versionNo = header.ref.versionNo;

    final nullChar = '\0'.codeUnitAt(0);

    // Copy userName with null character padding
    for (int i = 0; i < 50; i++) {
      this.userName[i] = i < userName.length ? userName[i] : nullChar;
    }

    // Copy password with null character padding
    for (int i = 0; i < 10; i++) {
      this.password[i] = i < password.length ? password[i] : nullChar;
    }

    this.loginType = loginType;
    this.nTokenCount = nTokenCount;
    this.strategyType = strategyType;
    this.clientID = clientID;
  }
}
