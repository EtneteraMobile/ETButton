//
//  BasicButtonsVC.swift
//  Example
//
//  Created by Jiří Zoudun on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit
import ETButton

class BasicButtonsVC: UIViewController {

    static let backgroundColor = UIColor(red: 0.133, green: 0.407, blue: 0.121, alpha: 1)
    static let highlightedBackgroundColor = UIColor(red: 0.133 - 0.1, green: 0.407 - 0.1, blue: 0.121 - 0.1, alpha: 1)
    static let selectedBackgroundColor = UIColor(red: 0.7, green: 1, blue: 0.7, alpha: 1)
    static let disabledBackgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)

    static let foregroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let highlightedForegroundColor = UIColor(red: 0.5, green: 0, blue: 0, alpha: 1)
    static let selectedForegroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let disabledForegroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)

    let noneButton = Button()
    let noneButtonStyle = Button.Style.none

    let normalButton = Button()
    let normalButtonStyle = Button.Style.basic

    let stateButton = Button()
    let stateButtonStyle = Button.Style(backgroundColor: BasicButtonsVC.backgroundColor,
                                        backgroundHighlightedColor: highlightedBackgroundColor,
                                        backgroundSelectedColor: selectedBackgroundColor,
                                        backgroundDisabledColor: disabledBackgroundColor,
                                        titleStyle: Button.LabelStyle(textColor: foregroundColor, font: UIFont.boldSystemFont(ofSize: 14)),
                                        titleHighlightedStyle: Button.LabelStyle(textColor: highlightedForegroundColor),
                                        titleSelectedStyle: Button.LabelStyle(textColor: selectedForegroundColor),
                                        titleDisabledStyle: Button.LabelStyle(textColor: disabledForegroundColor))

    let selectedButton = Button()
    let disabledButton = Button()
    let highlightedButton = Button()

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

        let buttons = [noneButton, normalButton, stateButton, highlightedButton, selectedButton, disabledButton]
        buttons.forEach {
            buttonsView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                $0.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, constant: -2 * displayPadding),
                $0.heightAnchor.constraint(equalToConstant: buttonHeight)
            ])
        }

        buttonsView.addArrangedSubview(footerView)

        noneButton.style = noneButtonStyle
        normalButton.style = normalButtonStyle
        stateButton.style = stateButtonStyle
        highlightedButton.style = stateButtonStyle
        selectedButton.style = stateButtonStyle
        disabledButton.style = stateButtonStyle

        highlightedButton.isHighlighted = true
        highlightedButton.isUserInteractionEnabled = false
        selectedButton.isSelected = true
        disabledButton.isEnabled = false

        noneButton.setTitle("None Button", for: .normal)
        normalButton.setTitle("Normal Button", for: .normal)
        stateButton.setTitle("STATE BUTTON", for: .normal)
        highlightedButton.setTitle("highlighted Button", for: .normal)
        selectedButton.setTitle("Selected Button", for: .normal)
        disabledButton.setTitle("Disabled Button", for: .normal)
    }
}
