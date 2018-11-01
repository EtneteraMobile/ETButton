//
//  ETButton.swift
//  Etnetera a.s.
//
//  Created by Jiri Zoudun on 17/08/2018.
//  Copyright © 2018 Etnetera a.s.. All rights reserved.
//

import UIKit

open class Button: UIButton {

    /// Button style
    var currentStyle: Style
    public var style: Style {
        didSet {
            updateStyle()
        }
    }

    var customTintColor: UIColor?

    // TODO: ImageView size
    // TODO: Rendering mode

    public var iconImage: UIImage? = nil {
        didSet {
            // TODO: Image rendering mode
            setImage(iconImage, for: .normal)

            setNeedsLayout()
        }
    }

    private let padding: CGFloat = 6

    // MARK: - Initialization

    public override init(frame: CGRect) {
        self.style = Style()
        self.currentStyle = Style()

        super.init(frame: frame)

        self.setupContent()

        super.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.reloadStyle()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Content

    private func setupContent() {
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }

    // MARK: - Overrides
    // MARK: Actions

    @objc func buttonAction() {
        print("\(#function)")
    }

    open override var tintColor: UIColor! {
        didSet {
            customTintColor = tintColor
            self.layer.borderColor = tintColor.cgColor
        }
    }

    open override var isHighlighted: Bool {
        didSet {
            updateStateStyle()
        }
    }

    open override var isSelected: Bool {
        didSet {
            updateStateStyle()
        }
    }

    open override var isEnabled: Bool {
        didSet {
            updateStateStyle()
        }
    }

    open override func layoutSubviews() {
        super.layoutSubviews()

        layoutButton()
    }

    open override var intrinsicContentSize: CGSize {
        return getIntristicContentSize()
    }
}
