//
//  FrameComputationTests.swift
//  ETButton-iOS Tests
//
//  Created by Jiří Zoudun on 05/12/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import XCTest
@testable import ETButton

class FrameComputationTests: XCTestCase {

    // MARK: - Test variables

    private var button: Button!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        button = Button(frame: Constants.buttonRect)
    }

    func testLeftGetter() {
        XCTAssertTrue(button.left == button.frame.origin.x)
    }

    func testLeftSetter() {
        button.left = 40

        XCTAssertTrue(button.frame.origin.x == 40)
    }

    func testRightGetter() {
        XCTAssertTrue(button.right == button.frame.origin.x + button.frame.size.width)
    }

    func testRightSetter() {
        button.right = 40

        XCTAssertTrue(button.frame.origin.x + button.frame.size.width == 40)
    }

    func testTopGetter() {
        XCTAssertTrue(button.top == button.frame.origin.y)
    }

    func testTopSetter() {
        button.top = 40

        XCTAssertTrue(button.frame.origin.y == 40)
    }

    func testBottomGetter() {
        XCTAssertTrue(button.bottom == button.frame.origin.y + button.frame.size.height)
    }

    func testBottomSetter() {
        button.bottom = 40

        XCTAssertTrue(button.frame.origin.y + button.frame.size.height == 40)
    }

    func testWidthGetter() {
        XCTAssertTrue(button.width == button.frame.size.width)
    }

    func testWidthSetter() {
        button.width = 40

        XCTAssertTrue(button.frame.size.width == 40)
    }

    func testHeightGetter() {
        XCTAssertTrue(button.height == button.frame.size.height)
    }

    func testHeightSetter() {
        button.height = 40

        XCTAssertTrue(button.frame.size.height == 40)
    }

    func testBoundCenterXGetter() {
        XCTAssertTrue(button.boundCenterX == button.frame.origin.x + button.frame.size.width * 0.5)
    }

    func testBoundCenterYGetter() {
        XCTAssertTrue(button.boundCenterY == button.frame.origin.y + button.frame.size.height * 0.5)
    }
}
