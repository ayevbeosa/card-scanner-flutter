//
//  CardScanOptions.swift
//  Card Scanner
//
//  Created by Mohammed Sadiq on 05/07/20.
//  Copyright © 2020 MZaink. All rights reserved.
//

import Foundation

public class CardScannerOptions {
    var scanCardHolderName: Bool = false
    var scanExpiryDate: Bool = false
    var initialScansToDrop: Int = 1
    var validCardsToScanBeforeFinishingScan: Int = 6
    var cardHolderNameBlackListedWords: [String] = []
    var considerPastDatesInExpiryDateScan: Bool = false
    var maxCardHolderNameLength: Int = 26
    var enableLuhnCheck: Bool = true
    var cardScannerTimeOut: Int = 0
    var enableDebugLogs: Bool = false
    var possibleCardHolderNamePositions: [String] = [CardHolderNameScanPositions.belowCardNumber.rawValue]
    var prompt: String = "Scan the back of your Credit Card to proceed"
    var cameraOrientation: CameraOrientation = .portrait
    var scanPrompt: String = "Scan the back of your Credit Card to proceed"
    var backButton: String = "iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAYxJREFUaEPtmNFKAzEQRU9/U1EQCj4IgqAgWKwiCoKCIPggFARFwX5P6e9IoCtl2GyzSSZhIH3Zh+4m58yk2ZtOMP6ZGOenCdTuYOtA60BiBdoS2lHA+eb728RCex/X7ICDv9nM7K4qEloC2/DO4Q641uiChoCEfwCuNODdmLkFJPwjcKkFn1tAwj8D55rwOQUk/Atwpg2fS0DCvwKnJeBzCEj4N+CkFHyqgIR/B45LwqcISPgFMC0NHysg4T+AoxrwMQIS/gs4qAU/VkDC/wB7NeHHCEj4JbAqBD8YAkOihIQvxP0/zSBjiICLwl2uLw2/c5WECLhBpMQvsC5k050peqcLFeiT+Ab2C0l4pxkj0CfxCRzWlBgr0Cdh6kXWFVv+JkxFCZ+EqTDnkzAVp30Spg40PglTR0qfxBNwob3FxmyjQ0xydzL1t4qvE/fATKsTuTvgk3CReDDTxApqCcg3tkmBTmL7GlvobGEuO0DqgJpLKJUt6PkmEFQmxZtaBxSLGzR060BQmRRv+gOFsj4x0r/MDQAAAABJRU5ErkJggg=="
    var permissionPrompt: String = "Permissions not granted by the user."
    var titlePropt: String = "Scan Card"
    
    init(
        scanCardHolderName: Bool = false,
        scanExpiryDate: Bool = false,
        initialScansToDrop: Int,
        validCardsToScanBeforeFinishingScan: Int,
        cardHolderNameBlackListedWords: [String],
        considerPastDatesInExpiryDateScan: Bool,
        maxCardHolderNameLength: Int,
        enableLuhnCheck: Bool,
        cardScannerTimeOut: Int,
        enableDebugLogs: Bool,
        possibleCardHolderNamePositions: [String],
        scanPrompt: String,
        backButton :String,
        permissionPrompt:String,
        titlePropt:String
    ) {
        self.scanCardHolderName = scanCardHolderName
        self.scanExpiryDate = scanExpiryDate
        self.initialScansToDrop = initialScansToDrop
        self.validCardsToScanBeforeFinishingScan = validCardsToScanBeforeFinishingScan
        self.cardHolderNameBlackListedWords = cardHolderNameBlackListedWords
        self.considerPastDatesInExpiryDateScan = considerPastDatesInExpiryDateScan
        self.maxCardHolderNameLength = maxCardHolderNameLength
        self.enableLuhnCheck = enableLuhnCheck
        self.cardScannerTimeOut = cardScannerTimeOut
        self.enableDebugLogs = enableDebugLogs
        self.possibleCardHolderNamePositions = possibleCardHolderNamePositions
        self.scanPrompt = scanPrompt
        self.backButton = backButton
        self.permissionPrompt = permissionPrompt
        self.titlePropt = titlePropt
    }
    
    init(from options: [String: String]?) {
        if let options = options {
            if let scanCardHolderName = options["scanCardHolderName"] {
                self.scanCardHolderName = (scanCardHolderName == "true")
            }
            
            if let scanExpirtyDate = options["scanExpiryDate"] {
                self.scanExpiryDate = (scanExpirtyDate == "true")
            }
            
            if let initialScansToDrop = options["initialScansToDrop"] {
                self.initialScansToDrop = Int(initialScansToDrop) ?? 1
            }
            
            if let validCardsToScanBeforeFinishingScan = options["validCardsToScanBeforeFinishingScan"] {
                self.validCardsToScanBeforeFinishingScan = Int(validCardsToScanBeforeFinishingScan) ?? 6
            }
            
            if let cardHolderNameBlackListedWords = options["cardHolderNameBlackListedWords"] {
                self.cardHolderNameBlackListedWords = cardHolderNameBlackListedWords.components(separatedBy: ",")
            }
            
            if let considerPastDatesInExpiryDateScan = options["considerPastDatesInExpiryDateScan"] {
                self.considerPastDatesInExpiryDateScan = (considerPastDatesInExpiryDateScan == "true")
            }
            
            if let maxCardHolderNameLength = options["maxCardHolderNameLength"] {
                self.maxCardHolderNameLength = Int(maxCardHolderNameLength) ?? 26
            }
            
            if let enableLuhnCheck = options["enableLuhnCheck"] {
                self.enableLuhnCheck = (enableLuhnCheck == "true")
            }
            
            if let cardScannerTimeOut = options["cardScannerTimeOut"] {
                self.cardScannerTimeOut = Int(cardScannerTimeOut) ?? 0
            }
            
            if let enableDebugLogs = options["enableDebugLogs"] {
                self.enableDebugLogs = (enableDebugLogs == "true")
            }
            
            if let possibleCardHolderNamePositions = options["possibleCardHolderNamePositions"] {
                self.possibleCardHolderNamePositions = possibleCardHolderNamePositions.components(separatedBy: ",")
            }
            
            if let prompt = options["prompt"] {
                self.prompt = prompt
            }
            
            if let cameraOrientation = options["cameraOrientation"], let orientation =  CameraOrientation(rawValue: cameraOrientation) {
                self.cameraOrientation = orientation
            }
            
            if let scanPrompt = options["scanPrompt"] {
                self.scanPrompt = scanPrompt
            }
            
            if let backButton = options["backButton"] {
                self.backButton = backButton
            }
            
            if let permissionPrompt = options["permissionPrompt"] {
                self.permissionPrompt = permissionPrompt
            }
            
            if let title = options["title"] {
                self.titlePropt = title
            }
        }
    }
}

enum CameraOrientation: String {
    case portrait
    case landscape
}
