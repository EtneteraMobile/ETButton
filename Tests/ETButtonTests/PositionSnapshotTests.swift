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
        button.style = Constants.getButtonStyle(position: .relativeLeft)

        FBSnapshotVerifyView(button)
    }

    func testRelativeLeftPositionWithZeroTextIconOffset() {
        button.style = Constants.getButtonStyle(position: .relativeLeft, spacing: 0)

        FBSnapshotVerifyView(button)
    }

    func testRelativeLeftPositionWith20TextIconOffset() {
        button.style = Constants.getButtonStyle(position: .relativeLeft, spacing: 20)

        FBSnapshotVerifyView(button)
    }

    func testRelativeRightPosition() {
        button.style = Constants.getButtonStyle(position: .relativeRight)

        FBSnapshotVerifyView(button)
    }

    func testRelativeRightPositionWithZeroTextIconOffset() {
        button.style = Constants.getButtonStyle(position: .relativeRight, spacing: 0)

        FBSnapshotVerifyView(button)
    }

    func testRelativeRightPositionWith20TextIconOffset() {
        button.style = Constants.getButtonStyle(position: .relativeRight, spacing: 20)

        FBSnapshotVerifyView(button)
    }

    func testFixedLeftPosition() {
        button.style = Constants.getButtonStyle(position: .fixedLeft)

        FBSnapshotVerifyView(button)
    }

    func testFixedLeftPositionWith0ContentEdgeInsets() {
        button.style = Constants.getButtonStyle(position: .fixedLeft)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        FBSnapshotVerifyView(button)
    }

    func testFixedLeftPositionWith20ContentEdgeInsets() {
        button.style = Constants.getButtonStyle(position: .fixedLeft, spacing: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        FBSnapshotVerifyView(button)
    }

    func testFixedRightPosition() {
        button.style = Constants.getButtonStyle(position: .fixedRight)

        FBSnapshotVerifyView(button)
    }

    func testFixedRightPositionWith0ContentEdgeInsets() {
        button.style = Constants.getButtonStyle(position: .fixedRight, spacing: 0)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        FBSnapshotVerifyView(button)
    }

    func testFixedRightPositionWith20ContentEdgeInsets() {
        button.style = Constants.getButtonStyle(position: .fixedRight, spacing: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        FBSnapshotVerifyView(button)
    }

    func testFixedLeftPositionContentHorizontalAlignmentLeft() {
        button.style = Constants.getButtonStyle(position: .fixedLeft)
        button.contentHorizontalAlignment = .left

        FBSnapshotVerifyView(button)
    }

    func testFixedLeftPositionContentHorizontalAlignmentRight() {
        button.style = Constants.getButtonStyle(position: .fixedLeft)
        button.contentHorizontalAlignment = .right

        FBSnapshotVerifyView(button)
    }

    func testFixedRightPositionContentHorizontalAlignmentLeft() {
        button.style = Constants.getButtonStyle(position: .fixedRight)
        button.contentHorizontalAlignment = .left

        FBSnapshotVerifyView(button)
    }

    func testFixedRightPositionContentHorizontalAlignmentRight() {
        button.style = Constants.getButtonStyle(position: .fixedRight)
        button.contentHorizontalAlignment = .right

        FBSnapshotVerifyView(button)
    }

    func testAboveLabelPosition() {
        button.style = Constants.getButtonStyle(position: .aboveLabel)

        FBSnapshotVerifyView(button)
    }

    func testAboveLabelPositionWith0TextIconOffset() {
        button.style = Constants.getButtonStyle(position: .aboveLabel, spacing: 0)

        FBSnapshotVerifyView(button)
    }

    func testAboveLabelPositionWith20TextIconOffset() {
        button.style = Constants.getButtonStyle(position: .aboveLabel, spacing: 20)

        FBSnapshotVerifyView(button)
    }
}
