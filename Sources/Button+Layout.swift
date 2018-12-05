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

    func layoutButton() {

        let space: CGFloat = style.textIconOffset.isNaN == false ? style.textIconOffset : CGFloat(roundf(Float(textIconOffset) / 2))
        let leftPadding = contentEdgeInsets.left
        let rightPadding = contentEdgeInsets.right

        if self.iconImage != nil {
            layoutButtonWithIcon(space: space, leftPadding: leftPadding, rightPadding: rightPadding)
        } else {
            layoutButtonWithoutIcon()
        }
    }

    private func layoutButtonWithIcon(space: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat) {
        switch style.iconImagePosition {
        case .relativeLeft: // DONE
            layoutRelativeLeftButton(space: space, leftPadding: leftPadding, rightPadding: rightPadding)
        case .fixedLeft: // DONE
            layoutFixedLeftButton(space: space, leftPadding: leftPadding, rightPadding: rightPadding)
        case .relativeRight: // DONE
            layoutRelativeRightButton(space: space, leftPadding: leftPadding, rightPadding: rightPadding)
        case .fixedRight: // DONE
            layoutFixedRightButton(space: space, leftPadding: leftPadding, rightPadding: rightPadding)
        case .aboveLabel: // DONE
            layoutAboveLabelButton(space: space, leftPadding: leftPadding, rightPadding: rightPadding)
        case .bellowLabel: // TODO
            layoutBellowLabelutton(space: space, leftPadding: leftPadding, rightPadding: rightPadding)
        }
    }

    private func layoutButtonWithoutIcon() {
        // Empty
    }

    func getIntristicContentSize() -> CGSize {
        let offset: CGFloat = style.textIconOffset.isNaN == false ? style.textIconOffset : CGFloat(roundf(Float(textIconOffset) / 2))
        let space: CGFloat = iconImage != nil ? offset : 0

        let leftPadding = contentEdgeInsets.left
        let rightPadding = contentEdgeInsets.right

        let iconWidth: CGFloat = iconImage?.size.width ?? 0
        let titleWidth: CGFloat = titleLabel?.intrinsicContentSize.width ?? 0
        let width: CGFloat = leftPadding + iconWidth + space + titleWidth + rightPadding

        return CGSize(width: width, height: super.intrinsicContentSize.height)
    }
}

// MARK: - Helpers

fileprivate extension Button {
    func layoutRelativeLeftButton(space: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat) {
        // Updates image text spacing only if textIconOffset should be set
        if imageEdgeInsets.right == 0 {
            imageEdgeInsets.right = space
        }
    }

    func layoutFixedLeftButton(space: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat) {
        guard let titleLabel = self.titleLabel, let imageView = imageView else { return }

        imageView.left = leftPadding
        switch contentHorizontalAlignment {
        case .left:
            titleLabel.left = imageView.right + space
        case .right:
            titleLabel.right = width - rightPadding
        default:
            titleLabel.center.x = self.boundCenterX
            if titleLabel.left < imageView.right + space {
                titleLabel.left = imageView.right + space
            }
        }
    }

    func layoutRelativeRightButton(space: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat) {
        guard let titleLabel = self.titleLabel, let iconImage = iconImage else { return }

        var imageInsets = imageEdgeInsets
        imageInsets.left = titleLabel.width + space
        imageInsets.right = -titleLabel.width - space
        imageEdgeInsets = imageInsets

        var titleInsets = self.titleEdgeInsets
        titleInsets.left = -iconImage.size.width
        titleInsets.right = iconImage.size.width
        titleEdgeInsets = titleInsets
    }

    func layoutFixedRightButton(space: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat) {
        guard let titleLabel = self.titleLabel, let imageView = imageView else { return }

        imageView.right = self.width - rightPadding
        switch contentHorizontalAlignment {
        case .left:
            titleLabel.left = leftPadding

        case .right:
            titleLabel.right = imageView.left - space

        default:
            titleLabel.center.x = boundCenterX
            if titleLabel.right > imageView.left - space {
                titleLabel.right = imageView.left - space
            }
        }
    }

    func layoutAboveLabelButton(space: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat) {
        guard let titleLabel = self.titleLabel, let iconImage = iconImage else { return }

        let imageSize = iconImage.size
        let titleSize = titleLabel.frame.size

        let totalHeight = (imageSize.height + titleSize.height + space / 2.0)

        imageEdgeInsets = UIEdgeInsets(top: -(totalHeight - imageSize.height), left: 0, bottom: 0, right: -titleSize.width)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(totalHeight - titleSize.height), right: 0)
    }

    func layoutBellowLabelutton(space: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat) {
        preconditionFailure("Not implemented")
    }
}
