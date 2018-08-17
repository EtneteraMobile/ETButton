//
//  BasicButtonsViewController.swift
//  Example
//
//  Created by Jiří Zoudun on 17/08/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit
import ETButton

class BasicButtonsVC: UIViewController {


    static let backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
    static let highlightedBackgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
    static let disabledBackgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)

    let noneButton = Button()
    let noneButtonStyle = Button.Style.none

    let normalButton = Button()
    let normalButtonStyle = Button.Style.basic

    let backgroundButton = Button()
    let backgroundButtonStyle = Button.Style(backgroundColor: BasicButtonsVC.backgroundColor, backgroundHighlightedColor: highlightedBackgroundColor)

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

        let buttons = [noneButton, normalButton, backgroundButton]
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
        backgroundButton.style = backgroundButtonStyle

        noneButton.setTitle("None Button", for: .normal)
        normalButton.setTitle("Normal Button", for: .normal)
        backgroundButton.setTitle("Background Button", for: .normal)
    }

}
