
//OLD ...

int calculateLoginRequestSize({ //76 for request  //86 for response
  required int userNameLength,
  required int passwordLength,
}){
  const int intSize = 4; // Size of an int in bytes (32-bit)
  const int messageHeaderSize = intSize * 3; // 3 ints in the RequestMessageHeader

  // msgSize (4 bytes) + messageHeader (12 bytes) + userName (50 bytes) + password (10 bytes) + loginType (4 bytes)
  return intSize // msgSize
      + messageHeaderSize   // messageHeader (3 ints)
      + userNameLength // userName length in bytes
      + passwordLength // password length in bytes
      + intSize;       // loginType (4 bytes)
}






//Test 1
// // Field sizes
// const int INT_SIZE = 4;       // Size of int32
// const int USERNAME_SIZE = 50; // Fixed size for username
// const int PASSWORD_SIZE = 10; // Fixed size for password
//
// int calculateLoginRequestSize({
//   required int userNameLength,
//   required int passwordLength,
// }) {
//   // Verify input sizes
//   assert(userNameLength == USERNAME_SIZE, 'Username must be exactly 50 bytes');
//   assert(passwordLength == PASSWORD_SIZE, 'Password must be exactly 10 bytes');
//
//   return INT_SIZE +              // msgSize (4 bytes)
//       (INT_SIZE * 3) +       // messageHeader (12 bytes: 3 ints)
//       USERNAME_SIZE +        // userName (50 bytes)
//       PASSWORD_SIZE +        // password (10 bytes)
//       INT_SIZE;              // loginType (4 bytes)
//   // Total: 4 + 12 + 50 + 10 + 4 = 76 bytes
// }


//test2
// const int INT_SIZE = 4;       // Size of int32
// const int USERNAME_SIZE = 50; // Fixed size for username
// const int PASSWORD_SIZE = 10; // Fixed size for password
// const int MESSAGE_HEADER_SIZE = INT_SIZE * 3; // 3 int32 fields in header
//
// // Calculate sizes for different message types
// int calculateLoginRequestSize() {
//   return INT_SIZE +              // msgSize (4 bytes)
//       MESSAGE_HEADER_SIZE +   // messageHeader (12 bytes: 3 ints)
//       USERNAME_SIZE +         // userName (50 bytes)
//       PASSWORD_SIZE +         // password (10 bytes)
//       INT_SIZE;              // loginType (4 bytes)
//   // Total: 76 bytes
// }
//
// int calculateLoginResponseSize() {
//   return INT_SIZE +              // msgSize (4 bytes)
//       MESSAGE_HEADER_SIZE +   // messageHeader (12 bytes: 4 ints)
//       USERNAME_SIZE +         // userName (50 bytes)
//       PASSWORD_SIZE +         // password (10 bytes)
//       INT_SIZE +             // loginType (4 bytes)
//       INT_SIZE +             // nTokenCount (4 bytes)
//       INT_SIZE +             // strategyType (4 bytes)
//       INT_SIZE;              // clientID (4 bytes)
//   // Total: 92 bytes
// }
