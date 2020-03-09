//
//  ViewController.swift
//  Dota2App
//
//  Created by Levchuk Misha on 03/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class SearchAccountViewController: UIViewController {

    let viewModel: SearchAccountViewModel
    let networkingClient = NetworkingClient()
    let accounts = GetAccounts(accountName: "342878356")
    let wonLostStatistic = GetWonLostStatistic(accountID: "221666230")

    init(viewModel: SearchAccountViewModel) {
        self.viewModel = viewModel
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
        searchAccountView.accountsTableView.dataSource = self
        searchAccountView.accountsTableView.delegate = self
        
        networkingClient.send(request: accounts) { result in
            switch result {
            case .success(let data):
                print(data)
                
            case .failure(let error):
                print(error)
            }
        }
        
    }



}

