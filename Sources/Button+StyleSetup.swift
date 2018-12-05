//
//  Button+StyleSetup.swift
//  Example
//
//  Created by Jiří Zoudun on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit

extension Button {

    // swiftlint:disable:next cyclomatic_complexity
    func updateStyle() {
        let s = self.style // swiftlint:disable:this identifier_name
        let cs = self.currentStyle

        var needsUpdateStyle = false

        if s.backgroundColor != cs.backgroundColor { needsUpdateStyle = true }
        if s.backgroundHighlightedColor != cs.backgroundHighlightedColor { needsUpdateStyle = true }
        if s.backgroundSelectedColor != cs.backgroundSelectedColor { needsUpdateStyle = true }
        if s.backgroundDisabledColor != cs.backgroundDisabledColor { needsUpdateStyle = true }
        if s.backgroundView != cs.backgroundView { needsUpdateStyle = true }
        if s.backgroundHighlightedView != cs.backgroundHighlightedView { needsUpdateStyle = true }
        if s.backgroundSelectedView != cs.backgroundSelectedView { needsUpdateStyle = true }
        if s.backgroundDisabledView != cs.backgroundDisabledView { needsUpdateStyle = true }
        if s.titleStyle != cs.titleStyle { needsUpdateStyle = true }
        if s.titleHighlightedStyle != cs.titleHighlightedStyle { needsUpdateStyle = true }
        if s.titleDisabledStyle != cs.titleDisabledStyle { needsUpdateStyle = true }
        if s.subtitleStyle != cs.subtitleStyle { needsUpdateStyle = true }
        if s.subtitleHighlightedStyle != cs.subtitleHighlightedStyle { needsUpdateStyle = true }
        if s.subtitleDisabledStyle != cs.subtitleDisabledStyle { needsUpdateStyle = true }
        // TODO: Implement and solve comparison of tuples
//        if s.borderWidth != cs.borderWidth { updateBorderWidth() }
//        if s.borderWidths != cs.borderWidths { updateBorderWidths() }
//        if s.borderColor != cs.borderColor { updateBorderColor() }
//        if s.borderColors != cs.borderColors { updateBorderColors() }
//        if s.cornerRadius != cs.cornerRadius { updateCornerRadius() }
//        if s.cornerRadiuses != cs.cornerRadiuses { updateCornerRadiuses() }

        self.currentStyle = style

        if needsUpdateStyle == true {
            updateStateStyle()
        }
    }

    func reloadStyle() {
        updateStateStyle()
    }
}
