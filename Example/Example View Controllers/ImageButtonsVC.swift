//
//  ImageButtonsVC.swift
//  Example
//
//  Created by Jiří Zoudun on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit
import ETButton

class ImageButtonsVC: UIViewController {

    static let backgroundColor = UIColor(red: 0.133, green: 0.407, blue: 0.121, alpha: 1)
    static let highlightedBackgroundColor = UIColor(red: 0.133 - 0.1, green: 0.407 - 0.1, blue: 0.121 - 0.1, alpha: 1)
    static let selectedBackgroundColor = UIColor(red: 0.7, green: 1, blue: 0.7, alpha: 1)
    static let disabledBackgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)

    static let foregroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let highlightedForegroundColor = UIColor(red: 0.5, green: 0, blue: 0, alpha: 1)
    static let selectedForegroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let disabledForegroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)

    let relativeRight = Button()
    let fixedRight = Button()
    let relativeRightWider = Button()
    let fixedRightWider = Button()
    let fixedRightAlignmentLeft = Button()
    let fixedRightAlignmentRight = Button()
    let relativeLeft = Button()
    let fixedLeft = Button()
    let relativeLeftWider = Button()
    let fixedLeftWider = Button()
    let fixedLeftAlignmentRight = Button()
    let fixedLeftAlignmentLeft = Button()

    let aboveLabel = Button()

    let buttonsView = UIStackView()

    // Metrics
    let displayPadding: CGFloat = 10
    let buttonHeight: CGFloat = 44

    override func viewDidLoad() {
        super.viewDidLoad()

        setupContent()
    }

    // swiftlint:disable:next function_body_length
    private func setupContent() {
        view.backgroundColor = .white

        view.addSubview(buttonsView)
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        buttonsView.spacing = 5
        buttonsView.axis = .vertical
        buttonsView.alignment = .center

        NSLayoutConstraint.activate([
            buttonsView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            buttonsView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            buttonsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])

        // Fills up rest of the stackView
        let footerView = UIView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.backgroundColor = .green

        let buttons = [relativeRight, fixedRight, relativeRightWider, fixedRightWider, fixedRightAlignmentLeft, fixedRightAlignmentRight, relativeLeft, fixedLeft, relativeLeftWider, fixedLeftWider, fixedLeftAlignmentRight, fixedLeftAlignmentLeft, aboveLabel]

        buttons.forEach {
            buttonsView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.titleLabel?.lineBreakMode = .byWordWrapping

            NSLayoutConstraint.activate([
                $0.heightAnchor.constraint(equalToConstant: buttonHeight)
                ])
        }

        buttonsView.addArrangedSubview(footerView)

        relativeRight.style = getButtonStyle(position: .relativeRight)
        fixedRight.style = getButtonStyle(position: .fixedRight)
        relativeRightWider.style = getButtonStyle(position: .relativeRight)
        fixedRightWider.style = getButtonStyle(position: .fixedRight)
        fixedRightAlignmentLeft.style = getButtonStyle(position: .fixedRight)
        fixedRightAlignmentRight.style = getButtonStyle(position: .fixedRight)
        relativeLeft.style = getButtonStyle(position: .relativeLeft)
        fixedLeft.style = getButtonStyle(position: .fixedLeft)
        relativeLeftWider.style = getButtonStyle(position: .relativeLeft)
        fixedLeftWider.style = getButtonStyle(position: .fixedLeft)
        fixedLeftAlignmentRight.style = getButtonStyle(position: .fixedLeft)
        fixedLeftAlignmentLeft.style = getButtonStyle(position: .fixedLeft)
        aboveLabel.style = getButtonStyle(position: .aboveLabel)

        relativeRight.setTitle("relativeRight", for: .normal)
        relativeRight.iconImage = UIImage(named: "icon")

        fixedRight.setTitle("fixedRight", for: .normal)
        fixedRight.iconImage = UIImage(named: "icon")

        relativeRightWider.setTitle("relativeRightWider", for: .normal)
        relativeRightWider.iconImage = UIImage(named: "icon")

        fixedRightWider.setTitle("fixedRightWider", for: .normal)
        fixedRightWider.iconImage = UIImage(named: "icon")

        fixedRightAlignmentLeft.setTitle("fixedRightAlignmentLeft", for: .normal)
        fixedRightAlignmentLeft.iconImage = UIImage(named: "icon")
        fixedRightAlignmentLeft.contentHorizontalAlignment = .left

        fixedRightAlignmentRight.setTitle("fixedRightAlignmentRight", for: .normal)
        fixedRightAlignmentRight.iconImage = UIImage(named: "icon")
        fixedRightAlignmentRight.contentHorizontalAlignment = .right

        relativeLeft.setTitle("relativeLeft", for: .normal)
        relativeLeft.iconImage = UIImage(named: "icon")

        fixedLeft.setTitle("fixedLeft", for: .normal)
        fixedLeft.iconImage = UIImage(named: "icon")

        relativeLeftWider.setTitle("relativeLeftWider", for: .normal)
        relativeLeftWider.iconImage = UIImage(named: "icon")

        fixedLeftWider.setTitle("fixedLeftWider", for: .normal)
        fixedLeftWider.iconImage = UIImage(named: "icon")

        fixedLeftAlignmentRight.setTitle("fixedLeftAlignmentRight", for: .normal)
        fixedLeftAlignmentRight.iconImage = UIImage(named: "icon")
        fixedLeftAlignmentRight.contentHorizontalAlignment = .right

        fixedLeftAlignmentLeft.setTitle("fixedLeftAlignmentRight", for: .normal)
        fixedLeftAlignmentLeft.iconImage = UIImage(named: "icon")
        fixedLeftAlignmentLeft.contentHorizontalAlignment = .left

        aboveLabel.setTitle("aboveLabel", for: .normal)
        aboveLabel.iconImage = UIImage(named: "icon")

        // Custom widths
        NSLayoutConstraint.activate([
            relativeRightWider.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, constant: -2 * displayPadding),
            fixedRightWider.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, constant: -2 * displayPadding),
            fixedRightAlignmentLeft.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, constant: -2 * displayPadding),
            fixedRightAlignmentRight.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, constant: -2 * displayPadding),
            relativeLeftWider.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, constant: -2 * displayPadding),
            fixedLeftWider.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, constant: -2 * displayPadding),
            fixedLeftAlignmentRight.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, constant: -2 * displayPadding),
            fixedLeftAlignmentLeft.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, constant: -2 * displayPadding)
        ])
    }

    func getButtonStyle(position: IconImagePosition, spacing: CGFloat = CGFloat.nan) -> Button.Style {
        return Button.Style(backgroundColor: ImageButtonsVC.backgroundColor,
                            backgroundHighlightedColor: ImageButtonsVC.highlightedBackgroundColor,
                            backgroundSelectedColor: ImageButtonsVC.selectedBackgroundColor,
                            backgroundDisabledColor: ImageButtonsVC.disabledBackgroundColor,
                            titleStyle: Button.LabelStyle(textColor: ImageButtonsVC.foregroundColor, font: UIFont.boldSystemFont(ofSize: 14)),
                            titleHighlightedStyle: Button.LabelStyle(textColor: ImageButtonsVC.highlightedForegroundColor),
                            titleSelectedStyle: Button.LabelStyle(textColor: ImageButtonsVC.selectedForegroundColor),
                            titleDisabledStyle: Button.LabelStyle(textColor: ImageButtonsVC.disabledForegroundColor),
                            iconImagePosition: position,
                            textIconOffset: spacing)
    }
}
