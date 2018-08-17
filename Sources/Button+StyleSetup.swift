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
        if s.backgroundSelectedColor != cs.backgroundSelectedColor { updateBackgroundSelectedColor() }
        if s.backgroundDisabledColor != cs.backgroundDisabledColor { updateBackgroundDisabledColor() }
        if s.backgroundView != cs.backgroundView { updateBackgroundView() }
        if s.backgroundHighlightedView != cs.backgroundHighlightedView { updateBackgroundHighlightedView() }
        if s.backgroundSelectedView != cs.backgroundSelectedView { updateBackgroundSelectedView() }
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
//        updateBackgroundColor()
//        updateBackgroundHighlightedColor()
//        updateBackgroundHighlightedColor()
//        updateBackgroundDisabledColor()
//        updateBackgroundView()
//        updateBackgroundHighlightedView()
//        updateBackgroundSelectedView()
//        updateBackgroundDisabledView()

        updateStateStyle()

        updateTitleStyle()
        updateTitleHighlightedStyle()
        updateTitleSelectedStyle()
        updateTitleDisabledStyle()
        updateSubtitleStyle()
        updateSubtitleHighlightedStyle()
        updateSubtitleSelectedStyle()
        updateSubtitleDisabledStyle()
        updateBorderWidth()
        updateBorderWidths()
        updateBorderColor()
        updateBorderColors()
        updateCornerRadius()
        updateCornerRadiuses()
    }

    func updateBackgroundColor() {
        updateStateStyle()
    }

    func updateBackgroundHighlightedColor() {
        updateStateStyle()
    }

    func updateBackgroundSelectedColor() {
        updateStateStyle()
    }

    func updateBackgroundDisabledColor() {
        updateStateStyle()
    }

    func updateBackgroundView() {
        updateStateStyle()
    }

    func updateBackgroundHighlightedView() {
        updateStateStyle()
    }

    func updateBackgroundSelectedView() {
        updateStateStyle()
    }

    func updateBackgroundDisabledView() {
        updateStateStyle()
    }

    func updateTitleStyle() {
        updateStateStyle()
    }

    func updateTitleHighlightedStyle() {
        updateStateStyle()
    }

    func updateTitleSelectedStyle() {
        updateStateStyle()
    }

    func updateTitleDisabledStyle() {
        updateStateStyle()
    }

    func updateSubtitleStyle() {
        updateStateStyle()
    }

    func updateSubtitleHighlightedStyle() {
        updateStateStyle()
    }

    func updateSubtitleSelectedStyle() {
        updateStateStyle()
    }

    func updateSubtitleDisabledStyle() {
        updateStateStyle()
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
