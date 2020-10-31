//
//  MenuButton.swift
//  Zond
//
//  Created by Evgeny Agamirzov on 11.10.20.
//  Copyright © 2020 Evgeny Agamirzov. All rights reserved.
//

import UIKit

class MenuButton : UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init() {
        super.init(frame: CGRect())
        setImage(#imageLiteral(resourceName: "buttonMissionMenu").color(UIColor.white), for: .normal)
        backgroundColor = Colors.primary
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Dimensions.tileSize),
            widthAnchor.constraint(equalToConstant: Dimensions.tileSize)
        ])
    }
}
