//
//  ViewController.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

//    let networkingClient = NetworkingClient()
//    let accounts = GetAccounts(accountName: "342878356")
//    let wonLostStatistic = GetWonLostStatistic(accountID: "221666230")

class SearchAccountViewController: UIViewController {

    let viewModel: SearchAccountViewModel
    let searchController: UISearchController
    let debouncer: Debouncer

    init(viewModel: SearchAccountViewModel, factory: SearchControllerFactory & DebouncerFactory) {
        self.viewModel = viewModel
        self.searchController = factory.makeSearchController()
        self.debouncer = factory.makeDebouncer(delay: 0.8)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = SearchAccountView(viewModel: viewModel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let searchAccountView = view as? SearchAccountView else {return}
        setupView(searchAccountView)
        bindView(searchAccountView)
        
    }

}

