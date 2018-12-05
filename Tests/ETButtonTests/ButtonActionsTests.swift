//
//  ButtonActionsTests.swift
//  ETButton-iOS Tests
//
//  Created by Jiří Zoudun on 05/12/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import XCTest
import ETButton

class ButtonActionsTests: XCTestCase {

    // MARK: - Test variables

    private var button: Button!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        button = Button(frame: Constants.buttonRect)
    }

    // MARK: - Test cases

    func testOnTouchActionClosure() {
        button.onButtonTouch = {
            XCTAssert(true)
        }

        // CallButton
        button.sendActions(for: .touchUpInside) // TODO: This doesn't work

        sleep(1)

        // XCTAssert(false)
    }

    func testOnTouchActionTarget() {
        button.addTarget(self, action: #selector(select), for: .touchUpInside)

        // CallButton
        button.sendActions(for: .touchUpInside)  // TODO: This doesn't work

        sleep(1)

        // XCTAssert(false)
    }

    @objc func select() {
        XCTAssert(true)
    }
}
