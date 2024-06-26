import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:frigo/features/Authentication/presentation/pages/CreatePassword/create_password_view.dart';
import 'package:frigo/features/Authentication/presentation/pages/ForgotPassword/forgot_password_view.dart';
import 'package:frigo/features/Authentication/presentation/pages/Login/login_view.dart';
import 'package:frigo/features/Authentication/presentation/pages/Register/register_view.dart';
import 'package:frigo/features/Authentication/presentation/pages/SecturityVerify/secturity_verify_view.dart';
import 'package:frigo/features/Authentication/presentation/pages/Splash/auth_splash_view.dart';
import 'package:frigo/features/Authentication/presentation/pages/Success/success_view.dart';
import 'package:frigo/features/Company/presentation/pages/company_application_processes_view.dart';
import 'package:frigo/features/Company/presentation/pages/company_application_skip_view.dart';
import 'package:frigo/features/Company/presentation/pages/company_make_application2_view.dart';
import 'package:frigo/features/Company/presentation/pages/company_make_application_view.dart';
import 'package:frigo/features/Company/presentation/pages/company_success_view.dart';
import 'package:frigo/features/Company/presentation/pages/company_type_select_view.dart';
import 'package:frigo/features/Home/presentation/pages/home_view.dart';
import 'package:frigo/features/PasswordUpdate/presentation/pages/password_update_succes_view.dart';
import 'package:frigo/features/PasswordUpdate/presentation/pages/password_update_view.dart';
import 'package:frigo/features/Profile/Business/presentation/pages/business_profile_view.dart';
import 'package:frigo/features/Profile/Business/presentation/pages/manage_subscriptions_view.dart';
import 'package:frigo/features/Profile/Business/presentation/pages/profile_settings_view.dart';
import 'package:frigo/features/Profile/Business/presentation/pages/upgrade_subscription_view.dart';
import 'package:frigo/features/Profile/Personel/presentation/pages/personel_profile_view.dart';
import 'package:frigo/features/Profile/Personel/presentation/pages/security_view.dart';
import 'package:frigo/features/Splash/presentation/pages/easy_splash_view.dart';
import 'package:frigo/features/Town/presentation/pages/town_select_view.dart';
import 'package:frigo/features/UserAgreement/private_politica_view.dart';
import 'package:frigo/features/UserAgreement/user_agreement_view.dart';
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
    AutoRoute(page: CompanyApplicationProcessesRoute.page, initial: false),
    AutoRoute(page: CompanyApplicationSkipRoute.page, initial: false),
    AutoRoute(page: CompanyTypeSelectRoute.page, initial: false),
    AutoRoute(page: CompanyMakeApplicationRoute.page, initial: false),
    AutoRoute(page: CompanyMakeApplication2Route.page, initial: false),
    AutoRoute(page: CompanySuccessRoute.page, initial: false),
    AutoRoute(page: PersonelProfileRoute.page, initial: false),
    AutoRoute(page: BusinessProfileRoute.page, initial: false),
    AutoRoute(page: ManageSubscriptionsRoute.page, initial: false),
    AutoRoute(page: PasswordUpdateRoute.page, initial: false),
    AutoRoute(page: PasswordUpdateSuccesRoute.page, initial: false),
    AutoRoute(page: UpgradeSubscriptionRoute.page, initial: false),
    AutoRoute(page: SecurityRoute.page, initial: false),
    AutoRoute(page: ProfileSettingsRoute.page, initial: false),
    AutoRoute(page: TownSelectRoute.page, initial: false),
    AutoRoute(page: HomeRoute.page, initial: false),
    AutoRoute(page: UserAgreementRoute.page, initial: false),
    AutoRoute(page: PrivatePoliticaRoute.page, initial: false),
    


       


      ];
}