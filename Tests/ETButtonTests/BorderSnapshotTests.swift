//
//  BorderSnapshotTests.swift
//  ETButton-iOS
//
//  Created by Jiří Zoudun on 11/11/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import ETButton
import FBSnapshotTestCase

class BorderSnapshotTest: FBSnapshotTestCase {

    // MARK: - Test variables

    var button: Button!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        button = Button(frame: Constants.buttonRect)
        button.setTitle("Title", for: .normal)
        button.iconImage = UIImage(named: "icon", in: Bundle(for: PositionSnapshotTests.self), compatibleWith: nil)

        recordMode = false
    }

    // MARK: - Test cases

    func testNoBorder() {
        button.style = Constants.getButtonStyle(position: .relativeLeft, spacing: 10, cornerRadius: 0, borderWidth: 0)

        FBSnapshotVerifyView(button)
    }

    func testSquareBorder() {
        button.style = Constants.getButtonStyle(position: .relativeLeft, spacing: 10, cornerRadius: 0, borderWidth: 2)

        FBSnapshotVerifyView(button)
    }

    func testRoundedCornerBorder() {
        button.style = Constants.getButtonStyle(position: .relativeLeft, spacing: 10, cornerRadius: 10, borderWidth: 2)

        FBSnapshotVerifyView(button)
    }

    func testNegativeBorderWidth() {
        button.style = Constants.getButtonStyle(position: .relativeLeft, spacing: 10, borderWidth: -20)

        FBSnapshotVerifyView(button)
    }

    func testCustomBorderTint() {
        button.style = Constants.getButtonStyle(position: .relativeLeft, spacing: 10, cornerRadius: 10, borderWidth: 2)
        button.tintColor = .blue

        FBSnapshotVerifyView(button)
    }

    func testCustomBorderTintSetBeforeStyle() {
        button.tintColor = .blue
        button.style = Constants.getButtonStyle(position: .relativeLeft, spacing: 10, cornerRadius: 10, borderWidth: 2)

        FBSnapshotVerifyView(button)
    }
}
