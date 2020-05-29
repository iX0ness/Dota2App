//
//  PlayerDetailsViewController.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 27/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UIViewController {
    
    // MARK: - Object properties
    
    private let viewModel: PlayerDetailsViewModel
    private var alertController: UIAlertController?
    
    // MARK: - Object Lifecycle
    
    init(viewModel: PlayerDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = PlayerDetailsView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupNavigationBar()
        setupTableView()
    }
    
    // MARK: - Obejct Methods
    
    func bind() {
        viewModel.didRecentMatchesFetch = { [weak self]  in
            guard let self = self else { return }
            DispatchQueue.main.async {
                guard let view = self.view as? PlayerDetailsView else { return }
                view.recentMatchesTableView.reloadData()
            }
        }
        
        viewModel.fetchErrorCallback = { [weak self] in
            guard let self = self else { return }
            self.presentAlert()
        }
    }
    
    func presentAlert() {
        DispatchQueue.main.async {
            self.alertController = UIAlertController().create()
            self.present(self.alertController!, animated: true, completion: nil)
        }
    }
    
    func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.barTintColor = R.SearchAccount.emptyViewBackgroundColor
        navigationBar.tintColor = .white
    }
    
    func setupTableView() {
        guard let view = view as? PlayerDetailsView else { return }
        view.recentMatchesTableView.delegate = self
        view.recentMatchesTableView.dataSource = self
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension PlayerDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatchTableViewCell.defaultReuseIdentifier, for: indexPath) as? MatchTableViewCell else {
            fatalError("Table view should be able to dequeue cell")
        }
        
        let match = viewModel.getMatch(at: indexPath)
        cell.configure(with: match)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}

// MARK: - UIAlertController

private extension UIAlertController {
    func create() -> UIAlertController {
        let alertController = UIAlertController(title: "Error", message: "Profile data could not been fetched completely", preferredStyle: .alert)
        let dissmissAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(dissmissAction)
        return alertController
    }
}
