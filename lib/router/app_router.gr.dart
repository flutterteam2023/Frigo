// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthSplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthSplashView(),
      );
    },
    BusinessProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BusinessProfileView(),
      );
    },
    CompanyApplicationProcessesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyApplicationProcessesView(),
      );
    },
    CompanyApplicationSkipRoute.name: (routeData) {
      final args = routeData.argsAs<CompanyApplicationSkipRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CompanyApplicationSkipView(
          args.email,
          args.password,
          key: args.key,
        ),
      );
    },
    CompanyMakeApplication2Route.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyMakeApplication2View(),
      );
    },
    CompanyMakeApplicationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyMakeApplicationView(),
      );
    },
    CompanySuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanySuccessView(),
      );
    },
    CompanyTypeSelectRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyTypeSelectView(),
      );
    },
    CreatePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreatePasswordView(),
      );
    },
    EasySplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EasySplashView(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    ManageSubscriptionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ManageSubscriptionsView(),
      );
    },
    PasswordUpdateSuccesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PasswordUpdateSuccesView(),
      );
    },
    PasswordUpdateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PasswordUpdateView(),
      );
    },
    PersonelProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonelProfileView(),
      );
    },
    PrivatePoliticaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivatePoliticaView(),
      );
    },
    ProfileSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileSettingsView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterView(),
      );
    },
    SecturityVerifyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SecturityVerifyView(),
      );
    },
    SecurityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SecurityView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    SuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SuccessView(),
      );
    },
    TownSelectRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TownSelectView(),
      );
    },
    UpgradeSubscriptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpgradeSubscriptionView(),
      );
    },
    UserAgreementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserAgreementView(),
      );
    },
  };
}

/// generated route for
/// [AuthSplashView]
class AuthSplashRoute extends PageRouteInfo<void> {
  const AuthSplashRoute({List<PageRouteInfo>? children})
      : super(
          AuthSplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthSplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BusinessProfileView]
class BusinessProfileRoute extends PageRouteInfo<void> {
  const BusinessProfileRoute({List<PageRouteInfo>? children})
      : super(
          BusinessProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'BusinessProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyApplicationProcessesView]
class CompanyApplicationProcessesRoute extends PageRouteInfo<void> {
  const CompanyApplicationProcessesRoute({List<PageRouteInfo>? children})
      : super(
          CompanyApplicationProcessesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyApplicationProcessesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyApplicationSkipView]
class CompanyApplicationSkipRoute
    extends PageRouteInfo<CompanyApplicationSkipRouteArgs> {
  CompanyApplicationSkipRoute({
    required String email,
    required String password,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CompanyApplicationSkipRoute.name,
          args: CompanyApplicationSkipRouteArgs(
            email: email,
            password: password,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CompanyApplicationSkipRoute';

  static const PageInfo<CompanyApplicationSkipRouteArgs> page =
      PageInfo<CompanyApplicationSkipRouteArgs>(name);
}

class CompanyApplicationSkipRouteArgs {
  const CompanyApplicationSkipRouteArgs({
    required this.email,
    required this.password,
    this.key,
  });

  final String email;

  final String password;

  final Key? key;

  @override
  String toString() {
    return 'CompanyApplicationSkipRouteArgs{email: $email, password: $password, key: $key}';
  }
}

/// generated route for
/// [CompanyMakeApplication2View]
class CompanyMakeApplication2Route extends PageRouteInfo<void> {
  const CompanyMakeApplication2Route({List<PageRouteInfo>? children})
      : super(
          CompanyMakeApplication2Route.name,
          initialChildren: children,
        );

  static const String name = 'CompanyMakeApplication2Route';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyMakeApplicationView]
class CompanyMakeApplicationRoute extends PageRouteInfo<void> {
  const CompanyMakeApplicationRoute({List<PageRouteInfo>? children})
      : super(
          CompanyMakeApplicationRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyMakeApplicationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanySuccessView]
class CompanySuccessRoute extends PageRouteInfo<void> {
  const CompanySuccessRoute({List<PageRouteInfo>? children})
      : super(
          CompanySuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanySuccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyTypeSelectView]
class CompanyTypeSelectRoute extends PageRouteInfo<void> {
  const CompanyTypeSelectRoute({List<PageRouteInfo>? children})
      : super(
          CompanyTypeSelectRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyTypeSelectRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreatePasswordView]
class CreatePasswordRoute extends PageRouteInfo<void> {
  const CreatePasswordRoute({List<PageRouteInfo>? children})
      : super(
          CreatePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EasySplashView]
class EasySplashRoute extends PageRouteInfo<void> {
  const EasySplashRoute({List<PageRouteInfo>? children})
      : super(
          EasySplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'EasySplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordView]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ManageSubscriptionsView]
class ManageSubscriptionsRoute extends PageRouteInfo<void> {
  const ManageSubscriptionsRoute({List<PageRouteInfo>? children})
      : super(
          ManageSubscriptionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageSubscriptionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PasswordUpdateSuccesView]
class PasswordUpdateSuccesRoute extends PageRouteInfo<void> {
  const PasswordUpdateSuccesRoute({List<PageRouteInfo>? children})
      : super(
          PasswordUpdateSuccesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordUpdateSuccesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PasswordUpdateView]
class PasswordUpdateRoute extends PageRouteInfo<void> {
  const PasswordUpdateRoute({List<PageRouteInfo>? children})
      : super(
          PasswordUpdateRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordUpdateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonelProfileView]
class PersonelProfileRoute extends PageRouteInfo<void> {
  const PersonelProfileRoute({List<PageRouteInfo>? children})
      : super(
          PersonelProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonelProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivatePoliticaView]
class PrivatePoliticaRoute extends PageRouteInfo<void> {
  const PrivatePoliticaRoute({List<PageRouteInfo>? children})
      : super(
          PrivatePoliticaRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivatePoliticaRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileSettingsView]
class ProfileSettingsRoute extends PageRouteInfo<void> {
  const ProfileSettingsRoute({List<PageRouteInfo>? children})
      : super(
          ProfileSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterView]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SecturityVerifyView]
class SecturityVerifyRoute extends PageRouteInfo<void> {
  const SecturityVerifyRoute({List<PageRouteInfo>? children})
      : super(
          SecturityVerifyRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecturityVerifyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SecurityView]
class SecurityRoute extends PageRouteInfo<void> {
  const SecurityRoute({List<PageRouteInfo>? children})
      : super(
          SecurityRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecurityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SuccessView]
class SuccessRoute extends PageRouteInfo<void> {
  const SuccessRoute({List<PageRouteInfo>? children})
      : super(
          SuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TownSelectView]
class TownSelectRoute extends PageRouteInfo<void> {
  const TownSelectRoute({List<PageRouteInfo>? children})
      : super(
          TownSelectRoute.name,
          initialChildren: children,
        );

  static const String name = 'TownSelectRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpgradeSubscriptionView]
class UpgradeSubscriptionRoute extends PageRouteInfo<void> {
  const UpgradeSubscriptionRoute({List<PageRouteInfo>? children})
      : super(
          UpgradeSubscriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpgradeSubscriptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserAgreementView]
class UserAgreementRoute extends PageRouteInfo<void> {
  const UserAgreementRoute({List<PageRouteInfo>? children})
      : super(
          UserAgreementRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserAgreementRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
