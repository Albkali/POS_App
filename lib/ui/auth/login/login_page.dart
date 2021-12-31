import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/data/models/language_model.dart';
import 'package:pos/localization/language_constrants.dart';
import 'package:pos/main.dart';
import 'package:pos/ui/main_container_screen/home_page.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/custom_text_filed.dart';
import 'package:pos/widgets/loading_dialog.dart';
import 'package:provider/provider.dart';

import 'login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? checkBoxValue = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: Utils.customAppBar(
          text: UtilStrings.smartX, icon: Icons.info_outlined),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          DropdownButton<Language>(
            onChanged: (Language? language) {
              _changeLanguage(language!);
            },
            underline: const SizedBox(),
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>((value) {
              return DropdownMenuItem<Language>(
                value: value,
                child: Row(
                  children: [
                    Text(
                      value.flag,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      value.name,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const Gap(50),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Utils.regularHeadingText(text: getTranslated(context, UtilStrings.login), color: AppColor.white),
                const Gap(20),
                CustomTextFiled(
                  title:getTranslated(context, UtilStrings.userName) ,
                  icon: Icons.person_outlined,
                  textEditingController: emailController,
                ),
                const Gap(20),
                CustomTextFiled(
                  title: getTranslated(context, UtilStrings.password),
                  icon: Icons.lock,
                  textEditingController: passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: checkBoxValue,
                        activeColor: Colors.green,
                        onChanged: (bool? newValue) {
                          setState(() {
                            checkBoxValue = newValue;
                          });
                        }),
                    Utils.mediumHeadingText(
                        text: getTranslated(context, UtilStrings.rememberMe), color: AppColor.white),
                  ],
                ),
                const Gap(10),
                InkWell(
                  onTap: () {
                    if (emailController.text.isEmpty) {
                      ToastUtils.showCustomToast(
                          context, getTranslated(context, UtilStrings.enterEmail), 'warning');
                    } else if (passwordController.text.isEmpty) {
                      ToastUtils.showCustomToast(
                          context, getTranslated(context, UtilStrings.enterPassword), 'warning');
                    } else {
                      showLoadingDialog(context: context);
                      context.read<LoginViewModel>().login(emailController.text, passwordController.text,context).then((value) {
                        if (value.isSuccess) {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) {
                            return HomePage();
                          }), (route) => false);
                        }
                      });
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 150,
                    color: AppColor.blue,
                    alignment: Alignment.center,
                    child: Utils.mediumHeadingText(
                        text: getTranslated(context, UtilStrings.login), color: AppColor.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:pos/helper/responsive_helper.dart';
// import 'package:pos/localization/language_constrants.dart';
// import 'package:pos/utils/color_utils.dart';
// import 'package:pos/utils/string_utils.dart';
// import 'package:pos/widgets/custom_text_filed.dart';
// import 'package:provider/provider.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//
//   FocusNode _emailNumberFocus = FocusNode();
//   FocusNode _passwordFocus = FocusNode();
//   late TextEditingController _emailController;
//   late TextEditingController _passwordController;
//   late GlobalKey<FormState> _formKeyLogin;
//   late String _countryDialCode;
//
//   @override
//   void initState() {
//     super.initState();
//     _formKeyLogin = GlobalKey<FormState>();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//
//     // _emailController.text = Provider.of<AuthProvider>(context, listen: false).getUserNumber() ?? '';
//     // _passwordController.text = Provider.of<AuthProvider>(context, listen: false).getUserPassword() ?? '';
//     // _countryDialCode = CountryCode.fromCountryCode(Provider.of<SplashProvider>(context, listen: false).configModel.countryCode).dialCode;
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double _width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       // appBar: ResponsiveHelper.isDesktop(context) ? PreferredSize(child: MainAppBar(), preferredSize: Size.fromHeight(80)) : null,
//       body: SafeArea(
//         child: Scrollbar(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(20),
//             physics: BouncingScrollPhysics(),
//             child: Center(
//               child: Container(
//                 width: _width > 700 ? 700 : _width,
//                 padding: _width > 700 ? const EdgeInsets.all(15) : null,
//                 decoration: _width > 700 ? BoxDecoration(
//                   color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(10),
//                   // boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 5, spreadRadius: 1)],
//                 ) : null,
//                 child:Form(
//                   key: _formKeyLogin,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Center(
//                       //   child: Padding(
//                       //     padding: const EdgeInsets.all(15.0),
//                       //     child: ResponsiveHelper.isWeb() ? Consumer<SplashProvider>(
//                       //       builder:(context, splash, child) => FadeInImage.assetNetwork(
//                       //         placeholder: Images.placeholder_rectangle, height: MediaQuery.of(context).size.height / 4.5,
//                       //         image: splash.baseUrls != null ? '${splash.baseUrls.restaurantImageUrl}/${splash.configModel.restaurantLogo}' : '',
//                       //         imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_rectangle, height: MediaQuery.of(context).size.height / 4.5),
//                       //       ),
//                       //     ) : Image.asset(
//                       //       Images.logo,
//                       //       height: MediaQuery.of(context).size.height / 4.5,
//                       //       fit: BoxFit.scaleDown,
//                       //       matchTextDirection: false,
//                       //     ),
//                       //   ),
//                       // ),
//                       Center(
//                           child: Text(
//                             getTranslated( context,UtilStrings.login)??'',
//                             style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: 24, color: AppColor.grey),
//                           )),
//                       const SizedBox(height: 35),
//                       // Text(
//                       //   getTranslated(context,UtilStrings.userName)??'',
//                       //   style: Theme.of(context).textTheme.headline2?.copyWith(color: ColorResources.getHintColor(context)),
//                       // ),
//                       SizedBox(height:10),
//                       CustomTextField(
//                         hintText: getTranslated( context,UtilStrings.userName)??'',
//                         isShowBorder: true,
//                         focusNode: _emailNumberFocus,
//                         nextFocus: _passwordFocus,
//                         controller: _emailController,
//                         inputType: TextInputType.emailAddress,
//                       ),
//                       Row(children: [
//                         // CodePickerWidget(
//                         //   onChanged: (CountryCode countryCode) {
//                         //     _countryDialCode = countryCode.dialCode;
//                         //   },
//                         //   initialSelection: _countryDialCode,
//                         //   favorite: [_countryDialCode],
//                         //   showDropDownButton: true,
//                         //   padding: EdgeInsets.zero,
//                         //   showFlagMain: true,
//                         //   textStyle: TextStyle(color: Theme.of(context).textTheme.headline1.color),
//                         //
//                         // ),
//                         Expanded(child: CustomTextField(
//                           // hintText: getTranslated('number_hint', context),
//                           isShowBorder: true,
//                           focusNode: _emailNumberFocus,
//                           nextFocus: _passwordFocus,
//                           controller: _emailController,
//                           inputType: TextInputType.phone,
//                         )),
//                       ]),
//                       SizedBox(height: 20),
//                       Text(
//                         getTranslated( context,UtilStrings.password)??"",
//                         style: Theme.of(context).textTheme.headline2?.copyWith(color: AppColor.grey2),
//                       ),
//                       SizedBox(height: 10),
//                       CustomTextField(
//                         // hintText: getTranslated('password_hint', context),
//                         isShowBorder: true,
//                         isPassword: true,
//                         isShowSuffixIcon: true,
//                         focusNode: _passwordFocus,
//                         controller: _passwordController,
//                         inputAction: TextInputAction.done,
//                       ),
//                       SizedBox(height: 22),
//
//                       // for remember me section
//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //   children: [
//                       //     Consumer<AuthProvider>(
//                       //         builder: (context, authProvider, child) => InkWell(
//                       //           onTap: () {
//                       //             authProvider.toggleRememberMe();
//                       //           },
//                       //           child: Row(
//                       //             children: [
//                       //               Container(
//                       //                 width: 18,
//                       //                 height: 18,
//                       //                 decoration: BoxDecoration(
//                       //                     color: authProvider.isActiveRememberMe ? Theme.of(context).primaryColor : ColorResources.COLOR_WHITE,
//                       //                     border:
//                       //                     Border.all(color: authProvider.isActiveRememberMe ? Colors.transparent : Theme.of(context).primaryColor),
//                       //                     borderRadius: BorderRadius.circular(3)),
//                       //                 child: authProvider.isActiveRememberMe
//                       //                     ? Icon(Icons.done, color: ColorResources.COLOR_WHITE, size: 17)
//                       //                     : SizedBox.shrink(),
//                       //               ),
//                       //               SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
//                       //               Text(
//                       //                 getTranslated('remember_me', context),
//                       //                 style: Theme.of(context)
//                       //                     .textTheme
//                       //                     .headline2
//                       //                     .copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color: ColorResources.getHintColor(context)),
//                       //               )
//                       //             ],
//                       //           ),
//                       //         )),
//                       //     InkWell(
//                       //       onTap: () {
//                       //         Navigator.pushNamed(context, Routes.getForgetPassRoute());
//                       //       },
//                       //       child: Padding(
//                       //         padding: const EdgeInsets.all(8.0),
//                       //         child: Text(
//                       //           getTranslated('forgot_password', context),
//                       //           style:
//                       //           Theme.of(context).textTheme.headline2.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.getHintColor(context)),
//                       //         ),
//                       //       ),
//                       //     )
//                       //   ],
//                       // ),
//
//                       SizedBox(height: 22),
//                       // Row(
//                       //   crossAxisAlignment: CrossAxisAlignment.start,
//                       //   children: [
//                       //     authProvider.loginErrorMessage.length > 0
//                       //         ? CircleAvatar(backgroundColor: Theme.of(context).primaryColor, radius: 5)
//                       //         : SizedBox.shrink(),
//                       //     SizedBox(width: 8),
//                       //     Expanded(
//                       //       child: Text(
//                       //         authProvider.loginErrorMessage ?? "",
//                       //         style: Theme.of(context).textTheme.headline2.copyWith(
//                       //           fontSize: Dimensions.FONT_SIZE_SMALL,
//                       //           color: Theme.of(context).primaryColor,
//                       //         ),
//                       //       ),
//                       //     )
//                       //   ],
//                       // ),
//
//                       // for login button
//                       SizedBox(height: 10),
//                       // !authProvider.isLoading
//                       //     ? CustomButton(
//                       //   btnTxt: getTranslated('login', context),
//                       //   onTap: () async {
//                       //     String _email = _emailController.text.trim();
//                       //     if(!Provider.of<SplashProvider>(context, listen: false).configModel.emailVerification){
//                       //       _email = _countryDialCode +_emailController.text.trim();
//                       //     }
//                       //
//                       //     String _password = _passwordController.text.trim();
//                       //     if (_emailController.text.isEmpty) {
//                       //       if(Provider.of<SplashProvider>(context, listen: false).configModel.emailVerification){
//                       //         showCustomSnackBar(getTranslated('enter_email_address', context), context);
//                       //       }else {
//                       //         showCustomSnackBar(getTranslated('enter_phone_number', context), context);
//                       //       }
//                       //     }else if (!Provider.of<SplashProvider>(context, listen: false).configModel.emailVerification && EmailChecker.isNotValidSaNum(_email)) {
//                       //       showCustomSnackBar(getTranslated('phone_should_be', context), context);
//                       //     }else if (_password.isEmpty) {
//                       //       showCustomSnackBar(getTranslated('enter_password', context), context);
//                       //     }else if (_password.length < 6) {
//                       //       showCustomSnackBar(getTranslated('password_should_be', context), context);
//                       //     }else {
//                       //       authProvider.login(_email, _password).then((status) async {
//                       //         if (status.isSuccess) {
//                       //
//                       //           if (authProvider.isActiveRememberMe) {
//                       //             authProvider.saveUserNumberAndPassword(_emailController.text, _password);
//                       //           } else {
//                       //             authProvider.clearUserNumberAndPassword();
//                       //           }
//                       //
//                       //           await Provider.of<WishListProvider>(context, listen: false).initWishList(
//                       //             context, Provider.of<LocalizationProvider>(context, listen: false).locale.languageCode,
//                       //           );
//                       //           Navigator.pushNamedAndRemoveUntil(context, Routes.getMainRoute(), (route) => false);
//                       //         }
//                       //       });
//                       //     }
//                       //   },
//                       // )
//                       //     : Center(
//                       //     child: CircularProgressIndicator(
//                       //       valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
//                       //     )),
//
//                       // for create an account
//                       SizedBox(height: 20),
//                       // InkWell(
//                       //   onTap: () {
//                       //     Navigator.pushNamed(context, Routes.getSignUpRoute());
//                       //   },
//                       //   child: Padding(
//                       //     padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
//                       //     child: Row(
//                       //       mainAxisAlignment: MainAxisAlignment.center,
//                       //       children: [
//                       //         Text(
//                       //           getTranslated('create_an_account', context),
//                       //           style:
//                       //           Theme.of(context).textTheme.headline2.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.getGreyColor(context)),
//                       //         ),
//                       //         SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
//                       //         Text(
//                       //           getTranslated('signup', context),
//                       //           style: Theme.of(context)
//                       //               .textTheme
//                       //               .headline3
//                       //               .copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.getGreyBunkerColor(context)),
//                       //         ),
//                       //       ],
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
