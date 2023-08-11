import 'dart:async';
import 'dart:convert';

import 'package:card_scanner/card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CardDetails? _cardDetails;

  Future<void> scanCard() async {
    ByteData bytes = await rootBundle.load('assets/icon/icon.png');
    var buffer = bytes.buffer;
    var imageBase64 = base64.encode(Uint8List.view(buffer));

    var cardDetails = await CardScanner.scanCard(
      scanOptions: CardScanOptions(
        scanCardHolderName: false,
        scanExpiryDate: false,
        enableDebugLogs: true,
        validCardsToScanBeforeFinishingScan: 1,
        initialScansToDrop: 0,
        scanPrompt: 'Test test',
        backButton: imageBase64,
        permissionPrompt: 'Нужно разрешнеие',
        enableLuhnCheck: false,
        considerPastDatesInExpiryDateScan: false,
      ),
    );
    if (!mounted) return;
    if (cardDetails != null)
      setState(() {
        _cardDetails = cardDetails!;
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('card_scanner app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () async {
                  scanCard();
                },
                child: Text('scan card'),
              ),
              if (_cardDetails != null) Text('$_cardDetails'),
              // Expanded(
              //   child: OptionConfigureWidget(
              //     initialOptions: scanOptions,
              //     onScanOptionChanged: (newOptions) => scanOptions = newOptions,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
