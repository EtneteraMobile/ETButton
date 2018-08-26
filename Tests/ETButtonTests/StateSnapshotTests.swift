//
//  StateSnapshotTests.swift
//  Etnetera a.s.
//
//  Created by Jiri Zoudun on 17/08/2018.
//  Copyright © 2018 Etnetera a.s.. All rights reserved.
//

import Foundation
import ETButton
import FBSnapshotTestCase

class StateSnapshotTests: FBSnapshotTestCase {

    var button: Button!
    var customStyle: Button.Style!

    override func setUp() {
        super.setUp()

        button = Button(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        customStyle = Button.Style(backgroundColor: Constants.backgroundColor,
                                    backgroundHighlightedColor: Constants.highlightedBackgroundColor,
                                    backgroundSelectedColor: Constants.selectedBackgroundColor,
                                    backgroundDisabledColor: Constants.disabledBackgroundColor,
                                    titleStyle: Button.LabelStyle(textColor: Constants.foregroundColor, font: Constants.boldFont),
                                    titleHighlightedStyle: Button.LabelStyle(textColor: Constants.highlightedForegroundColor),
                                    titleSelectedStyle: Button.LabelStyle(textColor: Constants.selectedForegroundColor),
                                    titleDisabledStyle: Button.LabelStyle(textColor: Constants.disabledForegroundColor, font: Constants.italicFont))

        recordMode = false
    }

    func testNoneButtonNormalState() {
        button.style = .none
        button.setTitle("none", for: .normal)

        FBSnapshotVerifyView(button)
    }

    func testNoneButtonHighlightedState() {
        button.style = .none
        button.setTitle("none", for: .normal)
        button.isHighlighted = true

        FBSnapshotVerifyView(button)
    }

    func testNoneButtonSelectedState() {
        button.style = .none
        button.setTitle("none", for: .normal)
        button.isSelected = true

        FBSnapshotVerifyView(button)
    }

    func testNoneButtonDisabledState() {
        button.style = .none
        button.setTitle("none", for: .normal)
        button.isEnabled = false

        FBSnapshotVerifyView(button)
    }

    func testBasicButtonNormalState() {
        button.style = .basic
        button.setTitle("basic", for: .normal)

        FBSnapshotVerifyView(button)
    }

    func testBasicButtonHighlightedState() {
        button.style = .basic
        button.setTitle("basic", for: .normal)
        button.isHighlighted = true

        FBSnapshotVerifyView(button)
    }

    func testBasicButtonSelectedState() {
        button.style = .basic
        button.setTitle("basic", for: .normal)
        button.isSelected = true

        FBSnapshotVerifyView(button)
    }

    func testBasicButtonDisabledState() {
        button.style = .basic
        button.setTitle("basic", for: .normal)
        button.isEnabled = false

        FBSnapshotVerifyView(button)
    }

    func testCustomButtonNormalState() {
        button.style = customStyle
        button.setTitle("custom", for: .normal)

        FBSnapshotVerifyView(button)
    }

    func testCustomButtonHighlightedState() {
        button.style = customStyle
        button.setTitle("custom", for: .normal)
        button.isHighlighted = true

        FBSnapshotVerifyView(button)
    }

    func testCustomButtonSelectedState() {
        button.style = customStyle
        button.setTitle("custom", for: .normal)
        button.isSelected = true

        FBSnapshotVerifyView(button)
    }

    func testCustomButtonDisabledState() {
        button.style = customStyle
        button.setTitle("custom", for: .normal)
        button.isEnabled = false

        FBSnapshotVerifyView(button)
    }
}
