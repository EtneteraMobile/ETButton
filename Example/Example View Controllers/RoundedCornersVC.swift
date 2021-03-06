//
//  RoundedCornersVC.swift
//  Example
//
//  Created by Jiří Zoudun on 26/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit
import ETButton

class RoundedCornersVC: UIViewController {

    static let backgroundColor = UIColor(red: 0.133, green: 0.407, blue: 0.121, alpha: 1)
    static let highlightedBackgroundColor = UIColor(red: 0.133 - 0.1, green: 0.407 - 0.1, blue: 0.121 - 0.1, alpha: 1)
    static let selectedBackgroundColor = UIColor(red: 0.7, green: 1, blue: 0.7, alpha: 1)
    static let disabledBackgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)

    static let foregroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let highlightedForegroundColor = UIColor(red: 0.5, green: 0, blue: 0, alpha: 1)
    static let selectedForegroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let disabledForegroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)

    let basic = Button()
    let rounded5 = Button()
    let rounded15 = Button()
    let roundedHalf = Button()

    let buttonsView = UIStackView()

    // Metrics
    let displayPadding: CGFloat = 10
    let buttonHeight: CGFloat = 44

    override func viewDidLoad() {
        super.viewDidLoad()

        setupContent()
    }

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

        let buttons = [basic, rounded5, rounded15, roundedHalf]

        buttons.forEach {
            buttonsView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                $0.heightAnchor.constraint(equalToConstant: buttonHeight)
                ])
        }

        buttonsView.addArrangedSubview(footerView)

        basic.style = getButtonStyle(position: .relativeLeft, spacing: 10)
        rounded5.style = getButtonStyle(position: .relativeLeft, spacing: 10, cornerRadius: 5)
        rounded15.style = getButtonStyle(position: .relativeLeft, spacing: 10, cornerRadius: 15)
        roundedHalf.style = getButtonStyle(position: .relativeLeft, spacing: 10, cornerRadius: buttonHeight / 2)

        basic.setTitle("basic", for: .normal)
        basic.iconImage = UIImage(named: "icon")

        rounded5.setTitle("rounded5", for: .normal)
        rounded5.iconImage = UIImage(named: "icon")

        rounded15.setTitle("rounded15", for: .normal)
        rounded15.iconImage = UIImage(named: "icon")

        roundedHalf.setTitle("roundedHalf", for: .normal)
        roundedHalf.iconImage = UIImage(named: "icon")
    }

    func getButtonStyle(position: IconImagePosition, spacing: CGFloat = CGFloat.nan, cornerRadius: CGFloat = 0) -> Button.Style {
        return Button.Style(backgroundColor: ImageButtonsVC.backgroundColor,
                            backgroundHighlightedColor: ImageButtonsVC.highlightedBackgroundColor,
                            backgroundSelectedColor: ImageButtonsVC.selectedBackgroundColor,
                            backgroundDisabledColor: ImageButtonsVC.disabledBackgroundColor,
                            titleStyle: Button.LabelStyle(textColor: ImageButtonsVC.foregroundColor, font: UIFont.boldSystemFont(ofSize: 14)),
                            titleHighlightedStyle: Button.LabelStyle(textColor: ImageButtonsVC.highlightedForegroundColor),
                            titleSelectedStyle: Button.LabelStyle(textColor: ImageButtonsVC.selectedForegroundColor),
                            titleDisabledStyle: Button.LabelStyle(textColor: ImageButtonsVC.disabledForegroundColor),
                            iconImagePosition: position,
                            textIconOffset: spacing,
                            cornerRadius: (Corner.all, cornerRadius))
    }
}
