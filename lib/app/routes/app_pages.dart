import 'package:get/get.dart';

import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/get_otp/bindings/get_otp_binding.dart';
import '../modules/get_otp/views/get_otp_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/post_detail/bindings/post_detail_binding.dart';
import '../modules/post_detail/views/post_detail_view.dart';
import '../modules/profile_view/bindings/profile_view_binding.dart';
import '../modules/profile_view/views/profile_view_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () =>  SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.GET_OTP,
      page: () => GetOtpView(),
      binding: GetOtpBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_VIEW,
      page: () => ProfileViewView(),
      binding: ProfileViewBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () =>  EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.POST_DETAIL,
      page: () => PostDetailView(),
      binding: PostDetailBinding(),
    ),
  ];
}
