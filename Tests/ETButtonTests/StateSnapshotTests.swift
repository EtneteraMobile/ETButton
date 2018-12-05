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

    // MARK: - Test variables

    private var button: Button!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        // Create button
        button = Button(frame: Constants.buttonRect)

        // FBSnapshotTests record mode.
        recordMode = false
    }

    // MARK: - Test cases

    func testNoneButtonNormalState() {
        setupNoneButton()

        FBSnapshotVerifyView(button)
    }

    func testNoneButtonHighlightedState() {
        setupNoneButton()
        button.isHighlighted = true

        FBSnapshotVerifyView(button)
    }

    func testNoneButtonSelectedState() {
        setupNoneButton()
        button.isSelected = true

        FBSnapshotVerifyView(button)
    }

    func testNoneButtonDisabledState() {
        setupNoneButton()
        button.isEnabled = false

        FBSnapshotVerifyView(button)
    }

    func testBasicButtonNormalState() {
        setupBasicButton()

        FBSnapshotVerifyView(button)
    }

    func testBasicButtonHighlightedState() {
        setupBasicButton()
        button.isHighlighted = true

        FBSnapshotVerifyView(button)
    }

    func testBasicButtonSelectedState() {
        setupBasicButton()
        button.isSelected = true

        FBSnapshotVerifyView(button)
    }

    func testBasicButtonDisabledState() {
        setupBasicButton()
        button.isEnabled = false

        FBSnapshotVerifyView(button)
    }

    func testCustomButtonNormalState() {
        setupCustomButton()

        FBSnapshotVerifyView(button)
    }

    func testCustomButtonHighlightedState() {
        setupCustomButton()
        button.isHighlighted = true

        FBSnapshotVerifyView(button)
    }

    func testCustomButtonSelectedState() {
        setupCustomButton()
        button.isSelected = true

        FBSnapshotVerifyView(button)
    }

    func testCustomButtonDisabledState() {
        setupCustomButton()
        button.isEnabled = false

        FBSnapshotVerifyView(button)
    }

    // MARK: - Private helper methods

    private func setupNoneButton() {
        button.style = .none
        button.setTitle("None", for: .normal)
    }

    private func setupBasicButton() {
        button.style = .basic
        button.setTitle("Basic", for: .normal)
    }

    private func setupCustomButton() {
        button.style = Constants.getButtonStyle()
        button.setTitle("Custom", for: .normal)
    }
}
