//
//  ViewController.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        let button = UIButton()
       
        
        view.addSubview(button)
        button.titleLabel?.text = "press me"
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    }


}

