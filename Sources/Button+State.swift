//
//  Button+State.swift
//  ETButton
//
//  Created by Jiří Zoudun on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit

public extension Button {

    func updateStateStyle() {
        var bgColor = style.backgroundColor
        var font = style.titleStyle.font

        // TODO: Update border color
        // TODO: Handle background view
        // TODO: Update subtitle

        if self.isSelected {
            bgColor = style.backgroundSelectedColor ?? bgColor
            font = style.titleSelectedStyle?.font ?? font
        } else if self.isHighlighted {
            bgColor = style.backgroundHighlightedColor ?? bgColor
            font = style.titleHighlightedStyle?.font ?? font
        } else if self.isEnabled == false {
            bgColor = style.backgroundDisabledColor ?? bgColor
            font = style.titleDisabledStyle?.font ?? font
        }

        applyCornerRadius()

        self.backgroundColor = bgColor

        self.titleLabel?.font = font

        self.setTitleColor(style.titleStyle.textColor, for: .normal)
        self.setTitleColor(style.titleHighlightedStyle?.textColor ?? style.titleStyle.textColor, for: .highlighted)
        self.setTitleColor(style.titleSelectedStyle?.textColor ?? style.titleStyle.textColor, for: .selected)
        self.setTitleColor(style.titleDisabledStyle?.textColor ?? style.titleStyle.textColor, for: .disabled)
    }

    private func applyCornerRadius() {
        switch style.cornerRadius?.0 {
        default:
            let radius = style.cornerRadius?.1 ?? 0
            self.layer.cornerRadius = radius
        }
    }
}
