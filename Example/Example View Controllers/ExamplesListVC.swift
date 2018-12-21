//
//  ExamplesListVC.swift
//  Example
//
//  Created by Jiří Zoudun on 21/12/2018.
//  Copyright © 2018 Etnetera a.s. All rights reserved.
//

import UIKit

class ExamplesListVC: UIViewController {
    private let tableView = UITableView()

    private static let controllers: [(String, UIViewController.Type)] = [("Basic", BasicButtonsVC.self),
                                      ("Image", ImageButtonsVC.self),
                                      ("Rounded corners", RoundedCornersVC.self),
                                      ("Border", BordersVC.self)]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupContent()
    }

    // MARK: Content

    private func setupContent() {
        title = "Button usage examples"

        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

// MARK: - UITableViewDelegate & DataSource implementation

extension ExamplesListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExamplesListVC.controllers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.accessoryType = .disclosureIndicator

        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = ExamplesListVC.controllers[indexPath.row].0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ExamplesListVC.controllers[indexPath.row].1.init()
        vc.title = ExamplesListVC.controllers[indexPath.row].0

        navigationController?.pushViewController(vc, animated: true)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
