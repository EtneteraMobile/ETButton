//
//  PositionSnapshotTests.swift
//  ETButton-iOS Tests
//
//  Created by Jiří Zoudun on 26/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import ETButton
import FBSnapshotTestCase

class PositionSnapshotTests: FBSnapshotTestCase {
    var button: Button!
    var customStyle: Button.Style!

    override func setUp() {
        super.setUp()

        button = Button(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        button.setTitle("Title", for: .normal)
        button.iconImage = UIImage(named: "icon", in: Bundle(for: PositionSnapshotTests.self), compatibleWith: nil)

        recordMode = false
    }

    func testRelativeLeftPosition() {
        button.style = getButtonStyle(position: .relativeLeft)

        FBSnapshotVerifyView(button)
    }

    func testRelativeLeftPositionWithZeroTextIconOffset() {
        button.style = getButtonStyle(position: .relativeLeft, spacing: 0)

        FBSnapshotVerifyView(button)
    }

    func testRelativeLeftPositionWith20TextIconOffset() {
        button.style = getButtonStyle(position: .relativeLeft, spacing: 20)

        FBSnapshotVerifyView(button)
    }

    func testRelativeRightPosition() {
        button.style = getButtonStyle(position: .relativeRight)

        FBSnapshotVerifyView(button)
    }

    func testRelativeRightPositionWithZeroTextIconOffset() {
        button.style = getButtonStyle(position: .relativeRight, spacing: 0)

        FBSnapshotVerifyView(button)
    }

    func testRelativeRightPositionWith20TextIconOffset() {
        button.style = getButtonStyle(position: .relativeRight, spacing: 20)

        FBSnapshotVerifyView(button)
    }

    func testFixedLeftPosition() {
        button.style = getButtonStyle(position: .fixedLeft)

        FBSnapshotVerifyView(button)
    }

    func testFixedLeftPositionWith0ContentEdgeInsets() {
        button.style = getButtonStyle(position: .fixedLeft)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        FBSnapshotVerifyView(button)
    }

    func testFixedLeftPositionWith20ContentEdgeInsets() {
        button.style = getButtonStyle(position: .fixedLeft, spacing: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        FBSnapshotVerifyView(button)
    }

    func testFixedRightPosition() {
        button.style = getButtonStyle(position: .fixedRight)

        FBSnapshotVerifyView(button)
    }

    func testFixedRightPositionWith0ContentEdgeInsets() {
        button.style = getButtonStyle(position: .fixedRight, spacing: 0)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        FBSnapshotVerifyView(button)
    }

    func testFixedRightPositionWith20ContentEdgeInsets() {
        button.style = getButtonStyle(position: .fixedRight, spacing: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        FBSnapshotVerifyView(button)
    }

    func testFixedLeftPositionContentHorizontalAlignmentLeft() {
        button.style = getButtonStyle(position: .fixedLeft)
        button.contentHorizontalAlignment = .left

        FBSnapshotVerifyView(button)
    }

    func testFixedLeftPositionContentHorizontalAlignmentRight() {
        button.style = getButtonStyle(position: .fixedLeft)
        button.contentHorizontalAlignment = .right

        FBSnapshotVerifyView(button)
    }

    func testFixedRightPositionContentHorizontalAlignmentLeft() {
        button.style = getButtonStyle(position: .fixedRight)
        button.contentHorizontalAlignment = .left

        FBSnapshotVerifyView(button)
    }

    func testFixedRightPositionContentHorizontalAlignmentRight() {
        button.style = getButtonStyle(position: .fixedRight)
        button.contentHorizontalAlignment = .right

        FBSnapshotVerifyView(button)
    }

    func testAboveLabelPosition() {
        button.style = getButtonStyle(position: .aboveLabel)

        FBSnapshotVerifyView(button)
    }

    func testAboveLabelPositionWith0TextIconOffset() {
        button.style = getButtonStyle(position: .aboveLabel, spacing: 0)

        FBSnapshotVerifyView(button)
    }

    func testAboveLabelPositionWith20TextIconOffset() {
        button.style = getButtonStyle(position: .aboveLabel, spacing: 20)

        FBSnapshotVerifyView(button)
    }

    // Helpers

    func getButtonStyle(position: IconImagePosition, spacing: CGFloat = CGFloat.nan) -> Button.Style {
        return Button.Style(backgroundColor: Constants.backgroundColor,
                            backgroundHighlightedColor: Constants.highlightedBackgroundColor,
                            backgroundSelectedColor: Constants.selectedBackgroundColor,
                            backgroundDisabledColor: Constants.disabledBackgroundColor,
                            titleStyle: Button.LabelStyle(textColor: Constants.foregroundColor, font: Constants.boldFont),
                            titleHighlightedStyle: Button.LabelStyle(textColor: Constants.highlightedForegroundColor),
                            titleSelectedStyle: Button.LabelStyle(textColor: Constants.selectedForegroundColor),
                            titleDisabledStyle: Button.LabelStyle(textColor: Constants.disabledForegroundColor, font: Constants.italicFont),
                            iconImagePosition: position,
                            textIconOffset: spacing)
    }
}
