//
//  Constants.swift
//  ETButton-iOS Tests
//
//  Created by Jiří Zoudun on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit
import ETButton

class Constants {
    static let buttonRect = CGRect(x: 0, y: 0, width: 200, height: 44)

    static let backgroundColor = UIColor(red: 0.133, green: 0.407, blue: 0.121, alpha: 1)
    static let highlightedBackgroundColor = UIColor(red: 0.133 - 0.1, green: 0.407 - 0.1, blue: 0.121 - 0.1, alpha: 1)
    static let selectedBackgroundColor = UIColor(red: 0.7, green: 1, blue: 0.7, alpha: 1)
    static let disabledBackgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)

    static let foregroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let highlightedForegroundColor = UIColor(red: 0.5, green: 0, blue: 0, alpha: 1)
    static let selectedForegroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let disabledForegroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)

    static let boldFont = UIFont.boldSystemFont(ofSize: 14)
    static let italicFont = UIFont.italicSystemFont(ofSize: 14)

    static func getButtonStyle(position: IconImagePosition = .relativeLeft, spacing: CGFloat = CGFloat.nan, cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0) -> Button.Style {
        return Button.Style(backgroundColor: Constants.backgroundColor,
                            backgroundHighlightedColor: Constants.highlightedBackgroundColor,
                            backgroundSelectedColor: Constants.selectedBackgroundColor,
                            backgroundDisabledColor: Constants.disabledBackgroundColor,
                            titleStyle: Button.LabelStyle(textColor: Constants.foregroundColor, font: Constants.boldFont),
                            titleHighlightedStyle: Button.LabelStyle(textColor: Constants.highlightedForegroundColor),
                            titleSelectedStyle: Button.LabelStyle(textColor: Constants.selectedForegroundColor),
                            titleDisabledStyle: Button.LabelStyle(textColor: Constants.disabledForegroundColor, font: Constants.italicFont),
                            iconImagePosition: position,
                            textIconOffset: spacing,
                            borderWidth: (Edge.all, borderWidth),
                            borderColor: (Edge.all, .red),
                            borderHighlightedColor: (Edge.all, .blue),
                            borderSelectedColor: (Edge.all, .purple),
                            borderDisabledColor: (Edge.all, .black),
                            cornerRadius: (Corner.all, cornerRadius))
    }
}
