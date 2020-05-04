//
//  PlayerDetailsViewController.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 27/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UIViewController {
    
    let viewModel: PlayerDetailsViewModel
    var alertController: UIAlertController?
    var alertController2: UIAlertController?
    var isPresenting = false
    
    init(viewModel: PlayerDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        print("Deinitialized")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = PlayerDetailsView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifyErrorAlert()
    }
    
    
    func notifyErrorAlert() {
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
    
}

private extension UIAlertController {
    func create() -> UIAlertController {
        let alertController = UIAlertController(title: "Error", message: "Profile data could not been fetched completely", preferredStyle: .alert)
        let dissmissAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(dissmissAction)
        return alertController
    }
}
