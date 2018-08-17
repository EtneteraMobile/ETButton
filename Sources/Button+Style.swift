//
//  ETButton+Styles.swift
//  Example
//
//  Created by Jiří Zoudun on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit

public struct Edge: OptionSet, Equatable {
    public let rawValue: Int

    static let top = Edge(rawValue: 1)
    static let left = Edge(rawValue: 2)
    static let bottom = Edge(rawValue: 4)
    static let right = Edge(rawValue: 8)
    static let all = Edge(rawValue: 15)

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public struct Corner: OptionSet, Equatable {
    public let rawValue: Int

    static let topLeft = Corner(rawValue: 1)
    static let topRight = Corner(rawValue: 2)
    static let bottomLeft = Corner(rawValue: 4)
    static let bottomRight = Corner(rawValue: 8)
    static let all = Corner(rawValue: 15)

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

// TODO: Spacing with asociated values?
public enum IconImagePosition: Int {
    case normal, relativeLeft, fixedLeft, relativeRight, fixedRight, bellowLabel, aboveLabel
}

public extension Button {

    // MARK: - Styles
    // MARK: Text
    public struct LabelStyle: Equatable {
        let textColor: UIColor
        let font: UIFont

        public init(textColor: UIColor = .blue, font: UIFont = UIFont.systemFont(ofSize: UIFont.buttonFontSize)) {
            self.textColor = textColor
            self.font = font
        }
    }

    // MARK: Button
    public struct Style {

        public static let none = Style()
        public static let basic = Style(backgroundHighlightedColor: .lightGray)

        // Background
        let backgroundColor: UIColor
        let backgroundHighlightedColor: UIColor?
        let backgroundSelectedColor: UIColor?
        let backgroundDisabledColor: UIColor?

        let backgroundView: UIView?
        let backgroundHighlightedView: UIView?
        let backgroundSelectedView: UIView?
        let backgroundDisabledView: UIView?

        // Title
        let titleStyle: LabelStyle
        let titleHighlightedStyle: LabelStyle?
        let titleSelectedStyle: LabelStyle?
        let titleDisabledStyle: LabelStyle?

        // Subtitle
        let subtitleStyle: LabelStyle?
        let subtitleHighlightedStyle: LabelStyle?
        let subtitleSelectedStyle: LabelStyle?
        let subtitleDisabledStyle: LabelStyle?

        // Borders
        let borderWidth: (Edge, CGFloat)? // Width for all specified borders
        let borderWidths: [(Edge, CGFloat)]? // Separate width for each border

        let borderColor: (Edge, UIColor)? // Color for all specified borders
        let borderColors: [(Edge, UIColor)]? // Separate color for each border

        // Corners
        let cornerRadius: (Corner, CGFloat)? // Radius for all specified borders
        let cornerRadiuses: [(Corner, CGFloat)]? // Separate radius for each border

        public init(backgroundColor: UIColor = .clear,
                    backgroundHighlightedColor: UIColor? = nil,
                    backgroundSelectedColor: UIColor? = nil,
                    backgroundDisabledColor: UIColor? = nil,
                    backgroundView: UIView? = nil,
                    backgroundHighlightedView: UIView? = nil,
                    backgroundSelectedView: UIView? = nil,
                    backgroundDisabledView: UIView? = nil,
                    titleStyle: LabelStyle = LabelStyle(),
                    titleHighlightedStyle: LabelStyle? = nil,
                    titleSelectedStyle: LabelStyle? = nil,
                    titleDisabledStyle: LabelStyle? = nil,
                    subtitleStyle: LabelStyle? = nil,
                    subtitleHighlightedStyle: LabelStyle? = nil,
                    subtitleSelectedStyle: LabelStyle? = nil,
                    subtitleDisabledStyle: LabelStyle? = nil,
                    borderWidth: (Edge, CGFloat)? = nil,
                    borderWidths: [(Edge, CGFloat)]? = nil,
                    borderColor: (Edge, UIColor)? = nil,
                    borderColors: [(Edge, UIColor)]? = nil,
                    cornerRadius: (Corner, CGFloat)? = nil,
                    cornerRadiuses: [(Corner, CGFloat)]? = nil) {

            self.backgroundColor = backgroundColor
            self.backgroundHighlightedColor = backgroundHighlightedColor
            self.backgroundSelectedColor = backgroundSelectedColor
            self.backgroundDisabledColor = backgroundDisabledColor
            self.backgroundView = backgroundView
            self.backgroundHighlightedView = backgroundHighlightedView
            self.backgroundSelectedView = backgroundSelectedView
            self.backgroundDisabledView = backgroundDisabledView
            self.titleStyle = titleStyle
            self.titleHighlightedStyle = titleHighlightedStyle
            self.titleSelectedStyle = titleSelectedStyle
            self.titleDisabledStyle = titleDisabledStyle
            self.subtitleStyle = subtitleStyle
            self.subtitleHighlightedStyle = subtitleHighlightedStyle
            self.subtitleSelectedStyle = subtitleSelectedStyle
            self.subtitleDisabledStyle = subtitleDisabledStyle
            self.borderWidth = borderWidth
            self.borderWidths = borderWidths
            self.borderColor = borderColor
            self.borderColors = borderColors
            self.cornerRadius = cornerRadius
            self.cornerRadiuses = cornerRadiuses
        }
    }
}
