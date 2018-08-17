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

        if s.backgroundColor != cs.backgroundColor { updateBackgroundColor() }
        if s.backgroundHighlightedColor != cs.backgroundHighlightedColor { updateBackgroundHighlightedColor() }
        if s.backgroundDisabledColor != cs.backgroundDisabledColor { updateBackgroundDisabledColor() }
        if s.backgroundView != cs.backgroundView { updateBackgroundView() }
        if s.backgroundHighlightedView != cs.backgroundHighlightedView { updateBackgroundHighlightedView() }
        if s.backgroundDisabledView != cs.backgroundDisabledView { updateBackgroundDisabledView() }
        if s.titleStyle != cs.titleStyle { updateTitleStyle() }
        if s.titleHighlightedStyle != cs.titleHighlightedStyle { updateTitleHighlightedStyle() }
        if s.titleDisabledStyle != cs.titleDisabledStyle { updateTitleDisabledStyle() }
        if s.subtitleStyle != cs.subtitleStyle { updateSubtitleStyle() }
        if s.subtitleHighlightedStyle != cs.subtitleHighlightedStyle { updateSubtitleHighlightedStyle() }
        if s.subtitleDisabledStyle != cs.subtitleDisabledStyle { updateSubtitleDisabledStyle() }
        // Implement and solve comparison of tuples
//        if s.borderWidth != cs.borderWidth { updateBorderWidth() }
//        if s.borderWidths != cs.borderWidths { updateBorderWidths() }
//        if s.borderColor != cs.borderColor { updateBorderColor() }
//        if s.borderColors != cs.borderColors { updateBorderColors() }
//        if s.cornerRadius != cs.cornerRadius { updateCornerRadius() }
//        if s.cornerRadiuses != cs.cornerRadiuses { updateCornerRadiuses() }

        self.currentStyle = style
    }

    func reloadStyle() {
        updateBackgroundColor()
        updateBackgroundHighlightedColor()
        updateBackgroundDisabledColor()
        updateBackgroundView()
        updateBackgroundHighlightedView()
        updateBackgroundDisabledView()
        updateTitleStyle()
        updateTitleHighlightedStyle()
        updateTitleDisabledStyle()
        updateSubtitleStyle()
        updateSubtitleHighlightedStyle()
        updateSubtitleDisabledStyle()
        updateBorderWidth()
        updateBorderWidths()
        updateBorderColor()
        updateBorderColors()
        updateCornerRadius()
        updateCornerRadiuses()
    }

    func updateBackgroundColor() {
        backgroundColor = style.backgroundColor
    }

    func updateBackgroundHighlightedColor() {
        // Not implemented
    }

    func updateBackgroundDisabledColor() {
        // Not implemented
    }

    func updateBackgroundView() {
        // Not implemented
    }

    func updateBackgroundHighlightedView() {
        // Not implemented
    }

    func updateBackgroundDisabledView() {
        // Not implemented
    }

    func updateTitleStyle() {
        setTitleColor(style.titleStyle.textColor, for: .normal)
        titleLabel?.font = style.titleStyle.font
    }

    func updateTitleHighlightedStyle() {
        if let textStyle = style.titleHighlightedStyle {
            setTitleColor(textStyle.textColor, for: .highlighted)
        } else {
            setTitleColor(style.titleStyle.textColor, for: .highlighted)
        }
    }

    func updateTitleDisabledStyle() {
        if let textStyle = style.titleDisabledStyle {
            setTitleColor(textStyle.textColor, for: .disabled)
        } else {
            setTitleColor(style.titleStyle.textColor, for: .disabled)
        }
    }

    func updateSubtitleStyle() {
        // Not implemented
    }

    func updateSubtitleHighlightedStyle() {
        // Not implemented
    }

    func updateSubtitleDisabledStyle() {
        // Not implemented
    }

    func updateBorderWidth() {
        // Not implemented
    }

    func updateBorderWidths() {
        // Not implemented
    }

    func updateBorderColor() {
        // Not implemented
    }

    func updateBorderColors() {
        // Not implemented
    }

    func updateCornerRadius() {
        // Not implemented
    }

    func updateCornerRadiuses() {
        // Not implemented
    }
}
