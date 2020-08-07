import 'package:injectable/injectable.dart';
import 'package:pots_trackr/core/services/analytics_service.dart';
import 'package:pots_trackr/core/services/authentication_service.dart';
import 'package:pots_trackr/core/services/firestore_service.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  AuthenticationService get authenticationService;
  @lazySingleton
  FirestoreService get firestoreService;
  @lazySingleton
  AnalyticsService get analyticsService;
}
