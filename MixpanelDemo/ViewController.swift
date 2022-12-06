//
//  ViewController.swift
//  MixpanelDemo
//
//  Created by Marko Engelman on 06/12/2022.
//

import UIKit

class ViewController: UIViewController {
    lazy var button = UIButton(configuration: .borderedTinted(), primaryAction: UIAction(title: "Send event", handler: { [weak self] _ in
        self?.engine?.sendEvent()
    }))
    
    var engine: AnalyticsEngine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

