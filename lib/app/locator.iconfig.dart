// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:pots_trackr/core/services/analytics_service.dart';
import 'package:pots_trackr/core/services/third_party_services.dart';
import 'package:pots_trackr/core/services/authentication_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pots_trackr/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<AnalyticsService>(
      () => thirdPartyServicesModule.analyticsService);
  g.registerLazySingleton<AuthenticationService>(
      () => thirdPartyServicesModule.authenticationService);
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<FirestoreService>(
      () => thirdPartyServicesModule.firestoreService);
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  AnalyticsService get analyticsService => AnalyticsService();
  @override
  AuthenticationService get authenticationService => AuthenticationService();
  @override
  DialogService get dialogService => DialogService();
  @override
  FirestoreService get firestoreService => FirestoreService();
  @override
  NavigationService get navigationService => NavigationService();
}
