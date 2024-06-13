import 'package:get/get.dart';

import '../modules/bottom_navbar/bindings/bottom_navbar_binding.dart';
import '../modules/bottom_navbar/views/bottom_navbar_view.dart';
import '../modules/commentar/bindings/commentar_binding.dart';
import '../modules/commentar/views/commentar_view.dart';
import '../modules/community/bindings/community_binding.dart';
import '../modules/community/views/community_view.dart';
import '../modules/detail_comment/bindings/detail_comment_binding.dart';
import '../modules/detail_comment/views/detail_comment_view.dart';
import '../modules/detail_resep/bindings/detail_resep_binding.dart';
import '../modules/detail_resep/views/detail_resep_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kreasiku/bindings/kreasiku_binding.dart';
import '../modules/kreasiku/views/kreasiku_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/post/bindings/post_binding.dart';
import '../modules/post/views/post_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/resep/bindings/resep_binding.dart';
import '../modules/resep/views/resep_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tips/bindings/tips_binding.dart';
import '../modules/tips/views/tips_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVBAR,
      page: () => const BottomNavbarView(),
      binding: BottomNavbarBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.POST,
      page: () => const PostView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_COMMENT,
      page: () => const DetailCommentView(),
      binding: DetailCommentBinding(),
    ),
    GetPage(
      name: _Paths.KREASIKU,
      page: () => const KreasikuView(),
      binding: KreasikuBinding(),
    ),
    GetPage(
      name: _Paths.RESEP,
      page: () => const ResepView(),
      binding: ResepBinding(),
    ),
    GetPage(
      name: _Paths.TIPS,
      page: () => const TipsView(),
      binding: TipsBinding(),
    ),
    GetPage(
      name: _Paths.COMMUNITY,
      page: () => const CommunityView(),
      binding: CommunityBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.COMMENTAR,
      page: () => const CommentarView(),
      binding: CommentarBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_RESEP,
      page: () => const DetailResepView(),
      binding: DetailResepBinding(),
    ),
  ];
}
