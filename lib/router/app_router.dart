import 'package:auto_route/auto_route.dart';
import 'package:frigo/features/Authentication/presentation/pages/CreatePassword/create_password_view.dart';
import 'package:frigo/features/Authentication/presentation/pages/ForgotPassword/forgot_password_view.dart';
import 'package:frigo/features/Authentication/presentation/pages/Login/login_view.dart';
import 'package:frigo/features/Authentication/presentation/pages/Register/register_view.dart';
import 'package:frigo/features/Authentication/presentation/pages/SecturityVerify/secturity_verify_view.dart';
import 'package:frigo/features/Authentication/presentation/pages/Splash/auth_splash_view.dart';
import 'package:frigo/features/Authentication/presentation/pages/Success/success_view.dart';
import 'package:frigo/features/Splash/presentation/pages/easy_splash_view.dart';
import 'package:frigo/features/splash/presentation/pages/splash_view.dart';


part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View|Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: false),
    AutoRoute(page: AuthSplashRoute.page, initial: false),
    AutoRoute(page: LoginRoute.page, initial: false),
    AutoRoute(page: RegisterRoute.page, initial: false),
    AutoRoute(page: ForgotPasswordRoute.page, initial: false),
    AutoRoute(page: SecturityVerifyRoute.page, initial: false),
    AutoRoute(page: CreatePasswordRoute.page, initial: false),
    AutoRoute(page: SuccessRoute.page, initial: false),
    AutoRoute(page: EasySplashRoute.page, initial: true),
       


      ];
}