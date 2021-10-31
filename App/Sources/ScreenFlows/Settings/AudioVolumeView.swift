//
//  Created by Cihat Gündüz on 30.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import AVKit
import UIKit
import MediaPlayer
import HandyUIKit

class AudioVolumeView: UIView {
  private let currentPortLabel: UILabel
  private let deviceChooserButton: MPVolumeView

  override init(
    frame: CGRect
  ) {
    deviceChooserButton = .init(frame: .init(x: 36, y: 0, width: 25, height: frame.height))
    deviceChooserButton.showsVolumeSlider = false

    currentPortLabel = .init(frame: .init(size: frame.size))
    currentPortLabel.textColor = .secondaryLabel
    currentPortLabel.textAlignment = .right

    super.init(frame: frame)

    addSubview(deviceChooserButton)
    addSubview(currentPortLabel)
    currentPortLabel.bindEdgesToSuperview()

    updateCurrentPortLabel()
    subscribeToRouteChangeNotification()

    #if targetEnvironment(simulator)
      let imageView = UIImageView(image: UIImage(systemName: "airplayvideo"))
      imageView.contentMode = .scaleAspectFit
      deviceChooserButton.addSubview(imageView)
      imageView.bindEdgesToSuperview()
    #endif
  }

  required init?(
    coder: NSCoder
  ) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    NotificationCenter.default.removeObserver(self)
  }

  @objc
  private func updateCurrentPortLabel() {
    currentPortLabel.text = AVAudioSession.sharedInstance().currentRoute.outputs.first?.portName
  }

  private func subscribeToRouteChangeNotification() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(updateCurrentPortLabel),
      name: AVAudioSession.routeChangeNotification,
      object: nil
    )
  }
}
