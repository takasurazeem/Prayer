//
//  Created by Cihat Gündüz on 25.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import SwiftyUserDefaults
import UIKit

class SettingsViewModel {
  // MARK: - Stored Instance Properties
  static let availableMovementSoundInstruments: [String] = [
    "Baroque Organ", "Bleep City", "Erhu", "Flow Motion", "Grand Piano with Pad & Choir", "Infinite Space",
    "Persian Santoor", "Soft Waves", "Turkish Saz Zither", "Tweed Picked Synth",
  ]

  static let availableLanguageCodes: [String] = Bundle.main.localizations.filter { $0 != "Base" }

  // MARK: - Computed Instance Properties
  var rakatCount: Int {
    get { return Defaults.rakatCount }
    set { Defaults.rakatCount = newValue }
  }

  var fixedTextsSpeedFactor: Double {
    get { return Defaults.fixedTextsSpeedFactor }
    set { Defaults.fixedTextsSpeedFactor = newValue }
  }

  var changingTextSpeedFactor: Double {
    get { return Defaults.changingTextSpeedFactor }
    set { Defaults.changingTextSpeedFactor = newValue }
  }

  var showChangingTextName: Bool {
    get { return Defaults.showChangingTextName }
    set { Defaults.showChangingTextName = newValue }
  }

  private var currentLangCode: String { return Bundle.main.preferredLocalizations.first! }

  var interfaceLanguageCode: String {
    get { guard let langCode = Defaults.interfaceLanguageCode?.first else { return currentLangCode }; return langCode }
    set { Defaults.interfaceLanguageCode = [newValue]; Defaults.defaults.synchronize() }
  }

  var movementSoundInstrument: String {
    get { return Defaults.movementSoundInstrument }
    set { Defaults.movementSoundInstrument = newValue }
  }
}

extension DefaultsKeys {
  private var defaultInstrument: String { return SettingsViewModel.availableMovementSoundInstruments.first! }

  var rakatCount: DefaultsKey<Int> { .init("RakatCount", defaultValue: 4) }
  var fixedTextsSpeedFactor: DefaultsKey<Double> { .init("FixedTextsSpeedFactor", defaultValue: 1.0) }
  var changingTextSpeedFactor: DefaultsKey<Double> { .init("ChangingTextSpeedFactor", defaultValue: 1.0) }
  var showChangingTextName: DefaultsKey<Bool> { .init("ShowChangingTextName", defaultValue: true) }
  // see http://stackoverflow.com/a/9939963/3451975
  var interfaceLanguageCode: DefaultsKey<[String]?> { .init("AppleLanguages") }
  var movementSoundInstrument: DefaultsKey<String> { .init("MovementSoundInstrument", defaultValue: defaultInstrument) }
}
