//
//  ETButton.swift
//  Etnetera a.s.
//
//  Created by Jiri Zoudun on 17/08/2018.
//  Copyright © 2018 Etnetera a.s.. All rights reserved.
//

import UIKit

// TODO: ImageView size
// TODO: Rendering mode
// TODO: Handle background view
// TODO: Update subtitle

open class Button: UIButton {

    // MARK: - Constants

    // Default button padding
    private static let padding: CGFloat = 6

    // MARK: - Variables

    var currentStyle: Style

    /**
     Style which defines visual style of button.
     */
    public var style: Style {
        didSet {
            updateStyle()
        }
    }

    /**
     Image used as button icon.

     The image can be positioned via button style and in case of `.relativeLeft` also with `imageContentInsets` and `titleContentInsets` variables.
     In other cases the image position can be altered by `textIconOffset` in button's style.
     */
    public var iconImage: UIImage? = nil {
        didSet {
            setImage(iconImage, for: .normal)

            setNeedsLayout()
        }
    }

    // MARK: - Actions

    /**
     Closure called on `.touchUpInside` event.

     It's posible to attach selector directly via `addTarget` method.
     */
    public var onButtonTouch: (() -> Void)?

    // MARK: - Initialization

    public override init(frame: CGRect) {
        self.style = Style()
        self.currentStyle = Style()

        super.init(frame: frame)

        self.setupContent()
        self.setupActions()

        self.reloadStyle()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Content

    private func setupContent() {
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: Button.padding, bottom: 0, right: Button.padding)
    }

    // MARK: - Actions

    private func setupActions() {
        super.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc func buttonAction() {
        onButtonTouch?()
    }

    // MARK: - Overrides

    open override var tintColor: UIColor! {
        didSet {
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
