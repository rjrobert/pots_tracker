import 'package:catcher/catcher_plugin.dart';
import 'package:sentry/sentry.dart';

class Logger {
  static CatcherOptions get debugOptions => CatcherOptions(DialogReportMode(),
      [ToastHandler(), ConsoleHandler(enableStackTrace: true)]);
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
}
