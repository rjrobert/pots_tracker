import 'dart:io';

import 'package:catcher/catcher_plugin.dart';
import 'package:device_info/device_info.dart';
import 'package:sentry/sentry.dart';

class Logger {
  static CatcherOptions get debugOptions => CatcherOptions(DialogReportMode(), [
        ToastHandler(),
        ConsoleHandler(
            // enableApplicationParameters: true,
            // enableDeviceParameters: true,
            enableStackTrace: true)
      ]);
  static CatcherOptions get releaseOptions =>
      CatcherOptions(SilentReportMode(), [
        ToastHandler(),
        SentryHandler(
          SentryClient(
              dsn:
                  'https://b31aeff1dbff4593a3532d2dcfea1569@o319042.ingest.sentry.io/3528772'),
          enableApplicationParameters: true,
          enableDeviceParameters: true,
        )
      ]);

  static Logger _instance;

  static Logger get instance {
    _instance ??= Logger();
    return _instance;
  }

  final SentryClient _sentry = new SentryClient(
      dsn:
          'https://b31aeff1dbff4593a3532d2dcfea1569@o319042.ingest.sentry.io/3528772');

  bool get isInDebugMode {
    bool isDebugMode = false;
    assert(isDebugMode = true);
    return isDebugMode;
  }

  Future reportError(dynamic error, dynamic stackTrace) async {
    print('Caught error: $error');

    if (isInDebugMode) {
      print(stackTrace);
      print('In dev mode. Not sending report to Sentry.io');
      return;
    }

    try {
      final Event event = await _getSentryEnvEvent(error, stackTrace);
      print('Sending report to Sentry.io...');
      final SentryResponse response = await _sentry.capture(event: event);

      if (response.isSuccessful)
        print('Success! Event ID: ${response.eventId}');
      else
        print('Failed to report to Sentry.io: ${response.error}');
    } catch (e) {
      print('Sending report to sentry.io failed: $e');
      print('Original error: $error');
    }
  }

  Future<Event> _getSentryEnvEvent(
      dynamic exception, dynamic stackTrace) async {
    return Event(
        release: '0.0.2',
        environment: 'development',
        extra: await _getEnvironmentInfo(),
        exception: exception,
        stackTrace: stackTrace);
  }

  Future<Map<String, dynamic>> _getEnvironmentInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      final IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return <String, dynamic>{
        'name': iosDeviceInfo.name,
        'model': iosDeviceInfo.model,
        'systemName': iosDeviceInfo.systemName,
        'systemVersion': iosDeviceInfo.systemVersion,
        'localizedModel': iosDeviceInfo.localizedModel,
        'utsname': iosDeviceInfo.utsname.sysname,
        'identifierForVendor': iosDeviceInfo.identifierForVendor,
        'isPhysicalDevice': iosDeviceInfo.isPhysicalDevice
      };
    }

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return <String, dynamic>{
        'type': androidDeviceInfo.type,
        'model': androidDeviceInfo.model,
        'device': androidDeviceInfo.device,
        'id': androidDeviceInfo.id,
        'androidId': androidDeviceInfo.androidId,
        'brand': androidDeviceInfo.brand,
        'display': androidDeviceInfo.display,
        'hardware': androidDeviceInfo.hardware,
        'manufacturer': androidDeviceInfo.manufacturer,
        'product': androidDeviceInfo.product,
        'version': androidDeviceInfo.version.release,
        'supported32BitAbis': androidDeviceInfo.supported32BitAbis,
        'supported64BitAbis': androidDeviceInfo.supported64BitAbis,
        'supportedAbis': androidDeviceInfo.supportedAbis,
        'isPhysicalDevice': androidDeviceInfo.isPhysicalDevice,
      };
    }

    return null;
  }
}
