import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class HttpCustom {
  static http.Client? _client;

  static http.Client get client => _client ?? http.Client();

  static init() async {
    _client = await instance;
  }

  static Future<http.Client> get instance async => await sslClient();

  static Future<SecurityContext> get globalContext async {
    final pem = await rootBundle.load('assets/certificate.crt');

    final securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(pem.buffer.asInt8List());
    return securityContext;
  }

  static Future<IOClient> sslClient() async {
    HttpClient client = HttpClient(context: await globalContext);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    IOClient ioClient = IOClient(client);
    return ioClient;
  }
}
