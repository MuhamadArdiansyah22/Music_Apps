import 'package:flutter/material.dart';
import 'package:music_apps/constants/colors.dart';
// import 'package:music_apps/view/play_music_page.dart';
import 'package:music_apps/view/home_dashboard_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
          onTap: () => FocusScope.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: height / 2,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorConstants.primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    const Text(
                      'Login in to Music Apps',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    SizedBox(
                      height: 70,
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/3844/3844724.png'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Millions of songs, free on music apps',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal),
                    ),
                    IconContinueWith(),
                    const SizedBox(height: 10),
                    IconContinueWithFB(),
                    const SizedBox(height: 10),
                    IconContinueWithApple(),
                    const SizedBox(height: 10),
                    IconContinueWithPhone(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: height / 1.9,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 40),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 22),
                            const SizedBox(
                                height: 40,
                                child: Input(
                                    hint: 'Email or Username',
                                    icon: Icons.email_outlined)),
                            const SizedBox(height: 16),
                            const SizedBox(
                              height: 40,
                              child: Input(
                                  hint: 'Password',
                                  icon: Icons.visibility_outlined),
                            ),
                            SwitchListTile.adaptive(
                              value: true,
                              onChanged: ((value) {}),
                              contentPadding: EdgeInsets.zero,
                              title: Text('Remember me',
                                  style: TextStyle(
                                      color: ColorConstants.starterWhite,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                            ),
                            MaterialButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeDashboard())),
                              color: ColorConstants.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31),
                              ),
                              height: 40,
                              child: const Text(
                                'LOG IN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Expanded(
                                  child: Divider(
                                      thickness: 1,
                                      height: 1,
                                      color: ColorConstants.starterWhite),
                                ),
                                Text(
                                  'or',
                                  style: TextStyle(
                                      color: ColorConstants.starterWhite,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Expanded(
                                  child: Divider(
                                      thickness: 1,
                                      height: 1,
                                      color: ColorConstants.starterWhite),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Text(
                              'Forgot Password',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorConstants.starterWhite,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don"t have account?',
                              style: TextStyle(
                                color: ColorConstants.starterWhite,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Sign up now',
                              style: TextStyle(
                                color: ColorConstants.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  ElevatedButton IconContinueWith() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Image.network(
        'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
        width: 24,
        height: 24,
      ),
      label: Text(
        'Continue With Google',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  ElevatedButton IconContinueWithFB() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/2048px-2021_Facebook_icon.svg.png',
        width: 24,
        height: 24,
      ),
      label: Text(
        'Continue With Facebook',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  ElevatedButton IconContinueWithApple() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Image.network(
        'https://static.vecteezy.com/system/resources/previews/019/766/198/original/apple-logo-apple-icon-transparent-free-png.png',
        width: 24,
        height: 24,
      ),
      label: Text(
        'Continue With Apple',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  ElevatedButton IconContinueWithPhone() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Image.network(
        'https://simpleicon.com/wp-content/uploads/phone-symbol-2.svg',
        height: 24,
      ),
      label: Text(
        'Continue With Phone Number',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.hint,
    required this.icon,
  });

  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(color: ColorConstants.starterWhite),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(color: ColorConstants.primaryColor),
        ),
        suffixIcon: Icon(icon),
      ),
    );
  }
}
