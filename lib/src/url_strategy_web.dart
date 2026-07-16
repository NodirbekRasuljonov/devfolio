import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// Uses path-based (rather than hash-based) URLs in the browser address bar.
void configureUrlStrategy() {
  usePathUrlStrategy();
}
