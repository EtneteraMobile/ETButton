//
//  ETButton.swift
//  Etnetera a.s.
//
//  Created by Jiri Zoudun on 17/08/2018.
//  Copyright © 2018 Etnetera a.s.. All rights reserved.
//

import UIKit

public class Button: UIButton {

    /// Button style
    internal var currentStyle: Style
    public var style: Style {
        didSet {
            updateStyle()
        }
    }

    // MARK: - Initialization

    public override init(frame: CGRect) {
        self.style = Style()
        self.currentStyle = Style()

        super.init(frame: frame)

        super.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.reloadStyle()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Actions

    @objc func buttonAction() {
        print("\(#function)")
    }
}
