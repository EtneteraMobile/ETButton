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

    public static let top = Edge(rawValue: 1)
    public static let left = Edge(rawValue: 2)
    public static let bottom = Edge(rawValue: 4)
    public static let right = Edge(rawValue: 8)
    public static let all = Edge(rawValue: 15)

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public struct Corner: OptionSet, Equatable {
    public let rawValue: Int

    public static let topLeft = Corner(rawValue: 1)
    public static let topRight = Corner(rawValue: 2)
    public static let bottomLeft = Corner(rawValue: 4)
    public static let bottomRight = Corner(rawValue: 8)
    public static let all = Corner(rawValue: 15)

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

// TODO: Spacing with asociated values?

public enum IconImagePosition: Int {
    case relativeLeft
    case fixedLeft // DOCU: Doesn't respect image and title insets - use relativeLeft
    case relativeRight // DOCU: Doesn't respect image and title insets - use relativeLeft
    case fixedRight // DOCU: Doesn't respect image and title insets - use relativeLeft
    case aboveLabel // DOCU: Doesn't respect image and title insets - use relativeLeft
    case bellowLabel // DOCU: Not implemented at all
}

public extension Button {

    // MARK: - Styles
    // MARK: Text

    /**
     Style of the label.

     This struct is used as a part of the button style. It can't be set by itself right now.
     */
    public struct LabelStyle: Equatable {
        public var textColor: UIColor
        public var font: UIFont
        public var lineBreakMode: NSLineBreakMode

        /**
         Creates style of label.
         */
        public init(textColor: UIColor = .blue, font: UIFont = UIFont.systemFont(ofSize: UIFont.buttonFontSize), lineBreakMode: NSLineBreakMode = .byTruncatingTail) {
            self.textColor = textColor
            self.font = font
            self.lineBreakMode = lineBreakMode
        }
    }

    // MARK: Button

    /**
     Visual style of button.

     This struct will set a style of whole button. Here can be set up different aspects of visual parts.

     # Parameters:
     - backgroundColor: Color of button's background
     - backgroundHighlightedColor: Color of button's background in highlighted state
     - backgroundSelectedColor: Color of button's background in selected state
     - backgroundDisabledColor: Color of button's background in disabled state
     - backgroundView: NOT IMPLEMENTED
     - backgroundHighlightedView: NOT IMPLEMENTED
     - backgroundSelectedView: NOT IMPLEMENTED
     - backgroundDisabledView: NOT IMPLEMENTED
     - titleStyle: Style of button's title
     - titleHighlightedStyle: Style of button's title in highlighted state
     - titleSelectedStyle: Style of button's title in selected state
     - titleDisabledStyle: Style of button's title in disabled state
     - iconImagePosition: Icon position in button. For more information see **Note** section
     - textIconOffset: Offset of title and icon in button. For more information see **Note** section
     - subtitleStyle: NOT IMPLEMENTED
     - subtitleHighlightedStyle: NOT IMPLEMENTED
     - subtitleSelectedStyle: NOT IMPLEMENTED
     - subtitleDisabledStyle: NOT IMPLEMENTED
     - borderWidth: Tuple *(Edge, Width)* specifies width of button's border. Only implemented option is `Edge.all`.
     - borderWidths: NOT IMPLEMENTED
     - borderColor: Tuple *(Edge, Color)* specifies color of button's border. Only implemented option is `Edge.all`.
     - borderColors: NOT IMPLEMENTED
     - borderHighlightedColor: Tuple *(Edge, Color)* specifies color of button's border for highlighted state. Only implemented option is `Edge.all`.
     - borderHighlightedColors: NOT IMPLEMENTED
     - borderSelectedColor: Tuple *(Edge, Color)* specifies color of button's border for selected state. Only implemented option is `Edge.all`.
     - borderSelectedColors: NOT IMPLEMENTED
     - borderDisabledColor: Tuple *(Edge, Color)* specifies color of button's border for disabled state. Only implemented option is `Edge.all`.
     - borderDisabledColors: NOT IMPLEMENTED
     - cornerRadius: Tuple *(Corner, Radius)* specifies radius of button's corne. Only implemented option is `Corner.all`.
     - cornerRadiuses: NOT IMPLEMENTED

     - Note: `iconImagePosition` specifies position of icon according to the button's title. The position `.relativeLeft` works with `titleEdgeInsets` and `imageEdgeInsets` variables of button. Other positions don't respect these properties. If you need to set offset between icon and title use the `textIconOffset` variable in style struct. `.bellowLabel` is not implemented.

     - ToDo: Button class doesn't respect following Style settings: `backgroundView` and related parameters; `subtitleStyle` and related parameters; separate setup for borders and corners
     */
    public struct Style {

        /**
         Style with no background and no foreground style.
         */
        public static let none = Style()

        /**
         Style with gray highlighted state.
         */
        public static let basic = Style(backgroundHighlightedColor: .lightGray)

        // Background
        public var backgroundColor: UIColor
        public var backgroundHighlightedColor: UIColor?
        public var backgroundSelectedColor: UIColor?
        public var backgroundDisabledColor: UIColor?

        public var backgroundView: UIView?
        public var backgroundHighlightedView: UIView?
        public var backgroundSelectedView: UIView?
        public var backgroundDisabledView: UIView?

        // Title
        public var titleStyle: LabelStyle
        public var titleHighlightedStyle: LabelStyle?
        public var titleSelectedStyle: LabelStyle?
        public var titleDisabledStyle: LabelStyle?

        // Icon
        public var iconImagePosition: IconImagePosition

        // Spacing
        public var textIconOffset: CGFloat

        // Subtitle
        public var subtitleStyle: LabelStyle?
        public var subtitleHighlightedStyle: LabelStyle?
        public var subtitleSelectedStyle: LabelStyle?
        public var subtitleDisabledStyle: LabelStyle?

        // Borders
        public var borderWidth: (Edge, CGFloat)? /// Width for all specified borders
        public var borderWidths: [(Edge, CGFloat)]? /// Separate width for each border

        public var borderColor: (Edge, UIColor)? /// Color for all specified borders
        public var borderColors: [(Edge, UIColor)]? /// Separate color for each border

        public var borderHighlightedColor: (Edge, UIColor)? /// Color for all specified borders
        public var borderHighlightedColors: [(Edge, UIColor)]? /// Separate color for each border

        public var borderSelectedColor: (Edge, UIColor)? /// Color for all specified borders
        public var borderSelectedColors: [(Edge, UIColor)]? /// Separate color for each border

        public var borderDisabledColor: (Edge, UIColor)? /// Color for all specified borders
        public var borderDisabledColors: [(Edge, UIColor)]? /// Separate color for each border

        // Corners
        /// Radius for all specified borders. Works only for .all.
        public var cornerRadius: (Corner, CGFloat)?
        /// Separate radius for each border. Doesn't work in this version.
        public var cornerRadiuses: [(Corner, CGFloat)]?

        /**
         Creates a new button style.
         */
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
                    iconImagePosition: IconImagePosition = .relativeLeft,
                    textIconOffset: CGFloat = CGFloat.nan,
                    subtitleStyle: LabelStyle? = nil,
                    subtitleHighlightedStyle: LabelStyle? = nil,
                    subtitleSelectedStyle: LabelStyle? = nil,
                    subtitleDisabledStyle: LabelStyle? = nil,
                    borderWidth: (Edge, CGFloat)? = nil,
                    borderWidths: [(Edge, CGFloat)]? = nil,
                    borderColor: (Edge, UIColor)? = nil,
                    borderColors: [(Edge, UIColor)]? = nil,
                    borderHighlightedColor: (Edge, UIColor)? = nil,
                    borderHighlightedColors: [(Edge, UIColor)]? = nil,
                    borderSelectedColor: (Edge, UIColor)? = nil,
                    borderSelectedColors: [(Edge, UIColor)]? = nil,
                    borderDisabledColor: (Edge, UIColor)? = nil,
                    borderDisabledColors: [(Edge, UIColor)]? = nil,
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
            self.iconImagePosition = iconImagePosition
            self.textIconOffset = textIconOffset
            self.subtitleStyle = subtitleStyle
            self.subtitleHighlightedStyle = subtitleHighlightedStyle
            self.subtitleSelectedStyle = subtitleSelectedStyle
            self.subtitleDisabledStyle = subtitleDisabledStyle
            self.borderWidth = borderWidth
            self.borderWidths = borderWidths
            self.borderColor = borderColor
            self.borderColors = borderColors
            self.borderHighlightedColor = borderHighlightedColor
            self.borderHighlightedColors = borderHighlightedColors
            self.borderSelectedColor = borderSelectedColor
            self.borderSelectedColors = borderSelectedColors
            self.borderDisabledColor = borderDisabledColor
            self.borderDisabledColors = borderDisabledColors
            self.cornerRadius = cornerRadius
            self.cornerRadiuses = cornerRadiuses
        }
    }
}
