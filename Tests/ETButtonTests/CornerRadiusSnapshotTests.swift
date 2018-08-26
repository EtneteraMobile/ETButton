//
//  CornerRadiusSnapshotTests.swift
//  ETButton-iOS Tests
//
//  Created by Jiří Zoudun on 26/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import ETButton
import FBSnapshotTestCase

class CornerRadiusSnapshotTests: FBSnapshotTestCase {
    var button: Button!
    var customStyle: Button.Style!
    let buttonHeight: CGFloat = 44

    override func setUp() {
        super.setUp()

        button = Button(frame: CGRect(x: 0, y: 0, width: 200, height: buttonHeight))
        button.setTitle("Title", for: .normal)
        button.iconImage = UIImage(named: "icon", in: Bundle(for: PositionSnapshotTests.self), compatibleWith: nil)

        recordMode = false
    }

    func testSquareCornerRadius() {
        button.style = Constants.getButtonStyle(position: .relativeLeft, spacing: 10, cornerRadius: 0)

        FBSnapshotVerifyView(button)
    }

    func test10CornerRadius() {
        button.style = Constants.getButtonStyle(position: .relativeLeft, spacing: 10, cornerRadius: 10)

        FBSnapshotVerifyView(button)
    }

    func testHalfHeightCornerRadius() {
        button.style = Constants.getButtonStyle(position: .relativeLeft, spacing: 10, cornerRadius: buttonHeight / 2)

        FBSnapshotVerifyView(button)
    }

    func testNegativeCornerRadius() {
        button.style = Constants.getButtonStyle(position: .relativeLeft, spacing: 10, cornerRadius: -10)

        FBSnapshotVerifyView(button)
    }

}
