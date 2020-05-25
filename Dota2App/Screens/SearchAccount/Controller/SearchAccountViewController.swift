//
//  ViewController.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class SearchAccountViewController: UIViewController {
    
    let factory: SearchControllerFactory & DebouncerFactory & PlayerDetailsFactory
    let viewModel: SearchAccountViewModel
    let searchController: UISearchController
    let debouncer: Debouncer

    init(viewModel: SearchAccountViewModel, factory: SearchControllerFactory & DebouncerFactory & PlayerDetailsFactory) {
        self.viewModel = viewModel
        self.searchController = factory.makeSearchController()
        self.debouncer = factory.makeDebouncer(delay: 0.8)
        self.factory = factory
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
        //setupView(searchAccountView)
        bindView(searchAccountView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let searchAccountView = view as? SearchAccountView else {return}
        setupView(searchAccountView)
    }

}

