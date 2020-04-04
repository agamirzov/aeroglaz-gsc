//
//  Utils.swift
//  DroneMap
//
//  Created by Evgeny Agamirzov on 31.03.20.
//  Copyright © 2020 Evgeny Agamirzov. All rights reserved.
//

import CoreGraphics
import UIKit

enum LayoutType {
    case horizontal
    case vertical
    case grid
}

func alignViews<View: UIView>(_ views: inout [View],
                              withLayout layout: LayoutType,
                              within area: CGSize,
                              using ratios: [CGFloat] = []) {
    var vCount = 0
    var hCount = 0
    switch layout {
        case .horizontal:
            vCount = 1
            hCount = views.count
        case .vertical:
            vCount = views.count
            hCount = 1
        case .grid:
            // Grid layout has two columns by default
            vCount = views.count / 2
            hCount = 2
    }

    var ratios = ratios
    if ratios.isEmpty {
        ratios = Array(repeating: CGFloat(1.0) / CGFloat(vCount),
                       count: vCount)
    }

    // Ratios array must satisfy certian criteria
    assert(ratios.count == vCount)
    assert(ratios.reduce(0, { x, y in x + y }) == 1.0)

    var viewIdx = 0
    var ratioIdx = 0
    var x = CGFloat(0.0)
    var y = CGFloat(0.0)
    for _ in 0..<vCount {
        let width = area.width / CGFloat(hCount)
        let height = area.height * ratios[ratioIdx]
        for _ in 0..<hCount {
            views[viewIdx].frame = CGRect(x: x, y: y, width: width, height: height)
            viewIdx += 1
            x += width
        }
        y += height
        ratioIdx += 1
        x = 0.0
    }
}
