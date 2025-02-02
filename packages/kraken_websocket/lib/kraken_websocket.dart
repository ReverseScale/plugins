
import 'package:flutter/widgets.dart';
import 'websocket_module.dart';
import 'package:kraken/module.dart';
import 'platform.dart';
import 'dart:ffi';

typedef Native_InitBridge = Void Function();
typedef Dart_InitBridge = void Function();

final Dart_InitBridge _initBridge =
nativeDynamicLibrary.lookup<NativeFunction<Native_InitBridge>>('initBridge').asFunction();

void initBridge() {
  _initBridge();
}

class KrakenWebsocket {
  static void initialize() {
    initBridge();
    ModuleManager.defineModule((moduleNamager) => WebSocketModule(moduleNamager));
  }
}
