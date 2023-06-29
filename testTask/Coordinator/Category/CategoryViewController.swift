//
//  CategoryViewController.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import UIKit
import Combine

class CategoryViewController: UIViewController {
    
    var infoLabell: UILabel?
    var viewModel: CategoryViewModel!
    var showSwiftUI: () -> () = {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        
        setupLabel()
        setupButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        infoLabell?.text = "\(viewModel.name) with email \(viewModel.email)"
    }
    
    func setupButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 500, width: 200, height: 60))
        button.setTitleColor(.systemRed, for: .normal)
        button.setTitle("to swiftui", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func setupLabel() {
        let infoLabel = UILabel(frame: CGRect(x: 100, y: 300, width: 300, height: 60))
        //infoLabel.text = "\(viewModel.name) with email \(viewModel.email)"
        self.view.addSubview(infoLabel)
        self.infoLabell = infoLabel
    }
    
    @objc func buttonAction() {
        showSwiftUI()
    }
    


}
