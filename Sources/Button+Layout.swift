//
//  Button+Layout.swift
//  ETButton
//
//  Created by Jiří Zoudun on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit

extension Button {

    private var textIconOffset: CGFloat { return 6 }
    private var padding: CGFloat { return 6 }

    func layoutButton() {

        let space: CGFloat = style.textIconOffset.isNaN == false ? style.textIconOffset : CGFloat(roundf(Float(textIconOffset) / 2))
        let leftPadding = contentEdgeInsets.left > 0 ? contentEdgeInsets.left : padding
        let rightPadding = contentEdgeInsets.right > 0 ? contentEdgeInsets.right : padding

        if self.iconImage != nil {
            layoutButtonWithIcon(space: space, leftPadding: leftPadding, rightPadding: rightPadding)
        } else {
            layoutButtonWithoutIcon()
        }
    }

    private func layoutButtonWithIcon(space: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat) {
        guard let titleLabel = self.titleLabel, let iconImage = iconImage, let imageView = imageView else { return }

        switch style.iconImagePosition {

        case .relativeLeft: // DONE
            // Updates image text spacing only if textIconOffset should be set
            if imageEdgeInsets.right == 0 {
                imageEdgeInsets.right = space
            }

        case .fixedLeft: // DONE
            imageView.left = leftPadding
            switch contentHorizontalAlignment {
            case .left:
                titleLabel.left = imageView.right + space
            case .right:
                titleLabel.right = width - rightPadding
            case .center: fallthrough
            default:
                titleLabel.center.x = self.boundCenterX
                if titleLabel.left < imageView.right + space {
                    titleLabel.left = imageView.right + space
                }
            }

        case .relativeRight: // DONE
            var imageInsets = imageEdgeInsets
            imageInsets.left = titleLabel.right + space
            imageEdgeInsets = imageInsets

            var titleInsets = self.titleEdgeInsets
            titleInsets.left = -iconImage.size.width
            titleInsets.right = iconImage.size.width
            titleEdgeInsets = titleInsets

        case .fixedRight: // DONE
            imageView.right = self.width - rightPadding
            switch contentHorizontalAlignment {
            case .left:
                titleLabel.left = leftPadding

            case .right:
                titleLabel.right = imageView.left - space

            case .center: fallthrough
            default:
                titleLabel.center.x = boundCenterX
                if titleLabel.right > imageView.left - space {
                    titleLabel.right = imageView.left - space
                }
            }
        case .aboveLabel: // DONE
            let imageSize = iconImage.size
            let titleSize = titleLabel.frame.size

            let totalHeight = (imageSize.height + titleSize.height + space / 2.0)

            imageEdgeInsets = UIEdgeInsets(top: -(totalHeight - imageSize.height), left: 0, bottom: 0, right: -titleSize.width)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(totalHeight - titleSize.height), right: 0)

        case .bellowLabel:
            preconditionFailure("Not implemented")
        }
    }

    private func layoutButtonWithoutIcon() {

    }

    func getIntristicContentSize() -> CGSize {
        let space: CGFloat = iconImage != nil ? CGFloat(roundf(Float(textIconOffset) / 2)) : 0
        let leftPadding = contentEdgeInsets.left > 0 ? contentEdgeInsets.left : padding
        let rightPadding = contentEdgeInsets.right > 0 ? contentEdgeInsets.right : padding

        let iconWidth: CGFloat = iconImage?.size.width ?? 0
        let titleWidth: CGFloat = titleLabel?.intrinsicContentSize.width ?? 0
        let width: CGFloat = leftPadding + iconWidth + space + titleWidth + rightPadding

        return CGSize(width: width, height: super.intrinsicContentSize.height)
    }
}

fileprivate extension UIView {

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
