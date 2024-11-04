import 'package:flutter/material.dart';
import '../../BU_LOGIC/Auth_version.dart';
import '../../Data/user_data.dart';
import '../../Test/TCP/test_Str.dart';
import '../../config/Buttons/Buttons.dart';
import '../Screens.dart';

class LoginPageUi extends StatefulWidget {
  const LoginPageUi({super.key, required this.dialogWidth, required this.dialogHeight});
    final double dialogWidth;
    final double dialogHeight;

  @override
  State<LoginPageUi> createState() => _LoginPageUiState();
}

class _LoginPageUiState extends State<LoginPageUi> {
    final _usernameController = TextEditingController();//handle the input of TextField Username
    final _passwordController = TextEditingController();//handle the input of TextField Password
    String? _selectedUserType;//stores the userType


    @override
    void dispose() {
      _usernameController.dispose();
      _passwordController.dispose();
      super.dispose();
    }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        //login padding...
        padding: const EdgeInsets.fromLTRB(14, 4, 14, 0 ),//positing the login form.

        child: Container(
          // padding: EdgeInsets.fromLTRB(14, 2, 14,0),
          // width: 370,
          // height: 440,

          //will set the login screen as dynamic.
          width: widget.dialogWidth * 0.6,
          height: widget.dialogHeight * 0.76,

          //Decoration of the credentials form bg.
          decoration: BoxDecoration(
            // color: Colors.transparent,
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0,3),
              )]
          ),


          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: widget.dialogHeight* 0.02),
              Image.asset(
                'assets/images/logo1.png',
                height: widget.dialogHeight * 0.08,
              ),
              SizedBox(height: widget.dialogHeight* 0.02),

              TextLabel(dialogWidth: widget.dialogWidth, label: 'Login Screen', size: 0.04,),

              SizedBox(height: widget.dialogHeight* 0.05),
              //Style one
              //Username section......
              _buildInputField(Icons.person_rounded, LoginTextField(
                                                     controller: _usernameController,
                                                     dialogWidth: widget.dialogWidth,
                                                     dialogHeight: widget.dialogHeight,
                                                     labelText: 'Username',),0.00),//0.00 is the value for transform.

              SizedBox(height: widget.dialogHeight* 0.04),

              //Password section..
              _buildInputField(Icons.lock_rounded, LoginTextField(
                                                   controller: _passwordController,
                                                   dialogWidth: widget.dialogWidth,
                                                   dialogHeight: widget.dialogHeight,
                                                   labelText: 'Password',
                                                   isPassword: true,),0.00),//0.00 is the value for transform.

              SizedBox(height: widget.dialogHeight* 0.04),

              //UserType section......
              _buildInputField(Icons.group, Usertypebox(onUserTypeChanged: (String? newValue) {_selectedUserType = newValue;}, dialogWidth: widget.dialogWidth, dialogHeight: widget.dialogHeight),0.02), //0.02 is the value for transform.

              SizedBox(height: widget.dialogHeight* 0.0),
              LoginButton(onLogin: () { _login(); }, dialogWidth: widget.dialogWidth, dialogHeight: widget.dialogHeight,),
            ],
          ),
        ),
      ),
    );
  }
    Widget _buildInputField(IconData icon, Widget field, double diff) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: widget.dialogWidth * 0.06),
          // Adjust the second value to move the icon up
          Transform.translate(offset: Offset(0, - widget.dialogHeight * diff),//0.02
          child: Icon(icon, size: widget.dialogHeight * 0.06 )),// Dynamic size for the icon...
          SizedBox(width: widget.dialogWidth * 0.04),
          field,
        ],
      );
    }

  void _login() async{
    final authService = LoginAuthentication();



    try {
    final newLoginResponse = await authService.login(
    _usernameController.text,
    _passwordController.text,
    _selectedUserType,
    );
    if (!mounted) return;

    if (newLoginResponse.loginResponse.messageHeader?.msgCode == 12){
      if(newLoginResponse.loginResponse.messageHeader?.errorCode != 0){
        print('Login failed due to error code: ${newLoginResponse.loginResponse.messageHeader?.errorCode}');
        return;
      }
      if (newLoginResponse.loginResponse.messageHeader?.versionNo == 1005){

        int? clientID = newLoginResponse.loginResponse.clientID;
        int? loginType = newLoginResponse.loginResponse.loginType;
        int? versionNo = newLoginResponse.loginResponse.messageHeader?.versionNo;


        Loginuserdata loginuserdata = Loginuserdata(
          clientID: clientID,
          loginType: loginType,
          versionNo: versionNo,
        );

        UserDataStorage.loginResponseList.add(loginuserdata);
        print(UserDataStorage.loginResponseList);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WorkstationAfterlogin()),
        );

      }else{
        print('Login failed due top version mismatch: ${newLoginResponse.loginResponse.messageHeader?.versionNo}');
      }

    }else{
      print('Login failed. Error code: ${newLoginResponse.loginResponse.messageHeader?.errorCode}');
    }

    }catch(e) {
      print("Login failed: $e");
    }
  }
}

//Authentication part ...........................
//     void _login() async {
//       final authService = AuthService();
//       final loginResult = await authService.login(
//         _usernameController.text,
//         _passwordController.text,
//         _selectedUserType,
//       );
//       if (!mounted) return;// Check if the widget is still in the tree
//
//       if (loginResult.success) {
//
//         // Handle successful login
//         if (loginResult.userType == "ADMIN") {
//           log('Navigating to Admin Workstation');
//
//         } else if (loginResult.userType == "DEALER") {
//           log('Navigating to Dealer Workstation');
//           //Before navigating to the WSAL we have to check for version mismatch or any kind of error....
//
//           //If everything is correct, the login response data is saved to the respective fields of the UserClass....
//
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (context) => const WorkstationAfterlogin()),
//           ); // Assuming this navigates to the Dealer's screen
//         }
//       } else {
//         // Handle login failure
//         log('Login failed');
//         // Show an error message to the user
//         // ScaffoldMessenger.of(context).showSnackBar(
//         //   const SnackBar(content: Text('Login failed. Please try again.')),
//         // );
//       }
//     }

