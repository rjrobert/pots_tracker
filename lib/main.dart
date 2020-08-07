import 'package:auto_route/auto_route.dart';
import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:pots_trackr/app/router.gr.dart';
import 'package:pots_trackr/app/locator.dart';
import 'package:pots_trackr/core/services/analytics_service.dart';
import 'package:pots_trackr/app/logger.dart';
import 'package:pots_trackr/ui/shared/shared_styles.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  Catcher(MyApp(),
      debugConfig: Logger.debugOptions,
      releaseConfig: Logger.releaseOptions,
      navigatorKey: locator<NavigationService>().navigatorKey);
  // final logger = Logger.instance;

  // FlutterError.onError = (FlutterErrorDetails details) async {
  //   if (logger.isInDebugMode)
  //     FlutterError.dumpErrorToConsole(details);
  //   else
  //     Zone.current.handleUncaughtError(details.exception, details.stack);
  // };

  // runZoned(() {
  //   setupLocator();
  //   runApp(MyApp());
  // }, onError: logger.reportError);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        // theme: ThemeData(
        //     primarySwatch: Colors.blue,
        //     textTheme: textTheme,
        //     platform: TargetPlatform.android),
        title: 'Pots Trackr',
        builder: ExtendedNavigator<Router>(
          router: Router(),
          navigatorKey: locator<NavigationService>().navigatorKey,
          initialRoute: Routes.startUpView,
          observers: [locator<AnalyticsService>().getAnalyticsObserver()],
        ),
      );
}

class Destination {
  const Destination(this.title, this.icon, this.color);

  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home, Colors.teal),
  Destination('Business', Icons.business, Colors.cyan),
  Destination('School', Icons.school, Colors.orange),
  Destination('Settings', Icons.settings, Colors.blue),
];

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController =
        TextEditingController(text: 'sample text: ${widget.destination.title}');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('${widget.destination.title} Text'),
          backgroundColor: widget.destination.color,
        ),
        backgroundColor: widget.destination.color[100],
        body: Container(
            padding: const EdgeInsets.all(32.0),
            alignment: Alignment.center,
            child: TextField(controller: _textController)),
      );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
            top: false,
            child: IndexedStack(
                index: _currentIndex,
                children: allDestinations
                    .map<Widget>((Destination destination) =>
                        DestinationView(destination: destination))
                    .toList())),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: allDestinations
                .map((Destination destination) => BottomNavigationBarItem(
                    icon: Icon(destination.icon),
                    backgroundColor: destination.color,
                    title: Text(destination.title)))
                .toList()),
      );
}
