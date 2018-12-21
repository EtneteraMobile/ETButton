//
//  LayoutComputationTests.swift
//  ETButton-iOS Tests
//
//  Created by Jiří Zoudun on 10/12/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import XCTest
@testable import ETButton

class LayoutComputationTests: XCTestCase {

    private var button: Button!

    override func setUp() {
        super.setUp()

        button = Button(frame: CGRect.zero)
    }

    func testIntristicContentSizeForNoneButton() {
        button.style = Constants.getButtonStyle()
        button.setTitle("None", for: .normal)

        let size = button.intrinsicContentSize
        guard let buttonSize = button.titleLabel?.intrinsicContentSize else {
            XCTFail("Missung button's title.")
            return
        }
        XCTAssert(size.width == buttonSize.width + button.contentEdgeInsets.left + button.contentEdgeInsets.right)
    }

    func testIntristicContentSizeForButtonWithTitleAndImageOnLeftSide() {
        button.style = Constants.getButtonStyle()
        button.iconImage = UIImage(named: "icon", in: Bundle(for: PositionSnapshotTests.self), compatibleWith: nil)
        button.setTitle("LeftSideImage", for: .normal)

        let size = button.intrinsicContentSize
        guard let buttonTitleSize = button.titleLabel?.intrinsicContentSize, let buttonIconSize = button.iconImage?.size else {
            XCTFail("Missung button's title.")
            return
        }

        let space = getSpace()

        let expectedSize = buttonTitleSize.width + buttonIconSize.width + space + button.contentEdgeInsets.left + button.contentEdgeInsets.right

        XCTAssert(size.width == expectedSize, "Size \(size) != expected size \(expectedSize)")
    }

    func testIntristicContentSizeForButtonWithTitleAndImageWithCustomOffset() {
        button.style = Constants.getButtonStyle(spacing: 20)
        button.iconImage = UIImage(named: "icon", in: Bundle(for: PositionSnapshotTests.self), compatibleWith: nil)
        button.setTitle("LeftSideImage", for: .normal)

        let size = button.intrinsicContentSize
        guard let buttonTitleSize = button.titleLabel?.intrinsicContentSize, let buttonIconSize = button.iconImage?.size else {
            XCTFail("Missung button's title.")
            return
        }

        let space = getSpace()

        let expectedSize = buttonTitleSize.width + buttonIconSize.width + space + button.contentEdgeInsets.left + button.contentEdgeInsets.right

        XCTAssert(size.width == expectedSize, "Size \(size) != expected size \(expectedSize)")
    }

    func testIntristicContentSizeForButtonWithoutTitleAndImage() {
        button.style = Constants.getButtonStyle(spacing: 20)
        button.iconImage = nil
        button.setTitle(nil, for: .normal)

        let size = button.intrinsicContentSize
        guard let buttonTitleSize = button.titleLabel?.intrinsicContentSize else {
            XCTFail("Missung button's title.")
            return
        }

        let space = getSpace()

        let expectedSize = buttonTitleSize.width + button.contentEdgeInsets.left + button.contentEdgeInsets.right

        XCTAssert(size.width == expectedSize, "Size \(size) != expected size \(expectedSize)")
    }

    // MARK: - Helper methods

    private func getSpace() -> CGFloat {
        let textIconOffset: CGFloat = 6 // Constant defined in Button+Layout file for default spacing between icon and title
        let offset: CGFloat = button.style.textIconOffset.isNaN == false ? button.style.textIconOffset : CGFloat(roundf(Float(textIconOffset) / 2))
        let space: CGFloat = button.iconImage != nil ? offset : 0
        return space
    }
}
