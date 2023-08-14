import 'package:flutter/material.dart';

enum CardHolderNameScanPosition { aboveCardNumber, belowCardNumber }

class CardScanOptions {
  final bool scanExpiryDate;
  final bool scanCardHolderName;

  /// This parameter is used so that some valid initial scan results containing false positives are dropped
  final int initialScansToDrop;
  final int validCardsToScanBeforeFinishingScan;

  ///Additional list of words that needs to be ignored when performing card holder name scan
  ///since card holder name scan can have many false positives. (There is no proper way to verify if a word is a name or not)
  ///By default words in [CardHolderNameConstants.defaultBlackListedWords] are used for blacklisting.
  ///This [cardHolderNameBlackListedWords] defaults to an empty set. If this parameter is set, then these words are added to the default blacklisted words
  final List<String> cardHolderNameBlackListedWords;

  /// setting this to true, will consider past dates also in expiry date scan.
  /// If a scanned date in the frame is before the current date, then that date is dropped.
  /// Defaults to [false]
  final bool considerPastDatesInExpiryDateScan;

  ///Defaults to [26]
  final int maxCardHolderNameLength;

  ///Scanned card numbers are put to "Luhn" algorithm check. Only if it passes the check , then its considered as a valid credit/debit card.
  ///Defaults to true since all real cards must pass [Luhn] algorithm
  final bool enableLuhnCheck;

  /// Timeout duration after which card scanner will just return the current optimal scan result which may contain false positives
  /// Timeout is useful when lighting conditions are bad and only few frames capture the card details.
  /// Once timeout happens, whatever the details captured till that time will be returned which can even be [null]
  /// Defaults to 0 or no-timeout
  final int cardScannerTimeOut;

  final bool enableDebugLogs;
  ///indicates possible positions are the expected positions for the card holder name with respect to the card number
  ///defaults to [CardHolderNameScanPosition.belowCardNumber]
  final List<CardHolderNameScanPosition> possibleCardHolderNamePositions;


  ///Text under scanner square
  final String scanPrompt;

  ///Icon on top left corner of scanner square
  ///Only base64 string supported
  final String backButton;

  ///Text Toast show then permission is not granted
  final String permissionPrompt;

  ///Title for scan screen
  final String title;

  const CardScanOptions({this.scanExpiryDate = true,
    this.scanCardHolderName = false,
    this.initialScansToDrop = 1,
    this.validCardsToScanBeforeFinishingScan = 6,
    this.cardHolderNameBlackListedWords = const [],
    this.considerPastDatesInExpiryDateScan = false,
    this.maxCardHolderNameLength = 26,
    this.enableLuhnCheck = true,
    this.enableDebugLogs = false,
    this.cardScannerTimeOut = 0,
    this.possibleCardHolderNamePositions = const [CardHolderNameScanPosition.belowCardNumber],
    this.scanPrompt = "Scan your card",
    this.backButton = 'iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAYxJREFUaEPtmNFKAzEQRU9/U1EQCj4IgqAgWKwiCoKCIPggFARFwX5P6e9IoCtl2GyzSSZhIH3Zh+4m58yk2ZtOMP6ZGOenCdTuYOtA60BiBdoS2lHA+eb728RCex/X7ICDv9nM7K4qEloC2/DO4Q641uiChoCEfwCuNODdmLkFJPwjcKkFn1tAwj8D55rwOQUk/Atwpg2fS0DCvwKnJeBzCEj4N+CkFHyqgIR/B45LwqcISPgFMC0NHysg4T+AoxrwMQIS/gs4qAU/VkDC/wB7NeHHCEj4JbAqBD8YAkOihIQvxP0/zSBjiICLwl2uLw2/c5WECLhBpMQvsC5k050peqcLFeiT+Ab2C0l4pxkj0CfxCRzWlBgr0Cdh6kXWFVv+JkxFCZ+EqTDnkzAVp30Spg40PglTR0qfxBNwob3FxmyjQ0xydzL1t4qvE/fATKsTuTvgk3CReDDTxApqCcg3tkmBTmL7GlvobGEuO0DqgJpLKJUt6PkmEFQmxZtaBxSLGzR060BQmRRv+gOFsj4x0r/MDQAAAABJRU5ErkJggg==',
    this.permissionPrompt = 'Permissions not granted by the user.',
    this.title = 'Scan Card',
  });

  Map<String, String> get map {
    final List<String> possibleNamePositions = [];
    if (possibleCardHolderNamePositions.contains(CardHolderNameScanPosition.belowCardNumber))
      possibleNamePositions.add('belowCardNumber');
    if (possibleCardHolderNamePositions.contains(CardHolderNameScanPosition.aboveCardNumber))
      possibleNamePositions.add('aboveCardNumber');

    return {
      'scanExpiryDate': scanExpiryDate.toString(),
      'scanCardHolderName': scanCardHolderName.toString(),
      'initialScansToDrop': initialScansToDrop.toString(),
      'validCardsToScanBeforeFinishingScan': validCardsToScanBeforeFinishingScan.toString(),
      'cardHolderNameBlackListedWords': cardHolderNameBlackListedWords.join(","),
      'considerPastDatesInExpiryDateScan': considerPastDatesInExpiryDateScan.toString(),
      'maxCardHolderNameLength': maxCardHolderNameLength.toString(),
      'enableLuhnCheck': enableLuhnCheck.toString(),
      'cardScannerTimeOut': cardScannerTimeOut.toString(),
      'enableDebugLogs': enableDebugLogs.toString(),
      'possibleCardHolderNamePositions': possibleNamePositions.join(","),
      'scanPrompt': scanPrompt,
      'backButton': backButton,
      'permissionPrompt': permissionPrompt,
      'title': title,
    };
  }
}
