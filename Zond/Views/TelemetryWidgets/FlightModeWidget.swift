//
//  FlightModeWidget.swift
//  Zond
//
//  Created by Evgeny Agamirzov on 13.10.20.
//  Copyright © 2020 Evgeny Agamirzov. All rights reserved.
//

import UIKit

fileprivate let defaultValue = "N/A"

class FlightModeWidget : UIView {
    // Stored properties
    private let icon = UIImageView(image: UIImage(#imageLiteral(resourceName: "indicatorMode")))
    private let label = UILabel()
    private let stackView = UIStackView()

    // Computed properties
    private var width: CGFloat {
        return Dimensions.telemetryIconSize + Dimensions.telemetrySpacer + Dimensions.telemetryLabelWidth
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init() {
        super.init(frame: CGRect())

        label.font = Fonts.title
        label.textColor = UIColor.white
        label.text = defaultValue

        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .bottom

        stackView.addArrangedSubview(icon)
        stackView.setCustomSpacing(Dimensions.telemetrySpacer, after: icon)
        stackView.addArrangedSubview(label)

        stackView.translatesAutoresizingMaskIntoConstraints = false;
        addSubview(stackView)

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(equalToConstant: Dimensions.telemetryIconSize),
            icon.heightAnchor.constraint(equalToConstant: Dimensions.telemetryIconSize),
            icon.widthAnchor.constraint(equalToConstant: Dimensions.telemetryIconSize),
            label.widthAnchor.constraint(equalToConstant: Dimensions.telemetryLabelWidth),
            label.heightAnchor.constraint(equalToConstant: Fonts.title.pointSize)
        ])
    }
}

// Public methods
extension FlightModeWidget {
    func update(_ modeString: String?) {
        label.text = modeString == nil ? defaultValue : modeString!
    }
}