//
//  UIView+Extenstions.swift
//  ETButton-iOS
//
//  Created by Jiří Zoudun on 05/12/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit

// MARK: - Frame layout helpers

extension UIView {

    var left: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }

    var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set {
            frame.origin.x = newValue - frame.size.width
        }
    }

    var top: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }

    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set {
            frame.origin.y = newValue - frame.size.height
        }
    }

    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }

    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }

    var boundCenterX: CGFloat {
        return self.bounds.origin.x + self.bounds.size.width * 0.5
    }

    var boundCenterY: CGFloat {
        return self.bounds.origin.y + self.bounds.size.height * 0.5
    }
}
