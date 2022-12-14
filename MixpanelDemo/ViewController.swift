//
//  ViewController.swift
//  MixpanelDemo
//
//  Created by Marko Engelman on 06/12/2022.
//

import UIKit
import Dispatch

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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            
            self.engine.map {
                let mixpanelPrimaryIDLabel = UILabel()
                mixpanelPrimaryIDLabel.text = """
                Primary ID:
                \($0.primaryMixpanelID)
                """
                mixpanelPrimaryIDLabel.numberOfLines = 0
                mixpanelPrimaryIDLabel.textAlignment = .center
                
                let mixpanelSecondaryIDLabel = UILabel()
                mixpanelSecondaryIDLabel.text = """
                Secondary ID:
                \($0.secondaryMixpanelID)
                """
                mixpanelSecondaryIDLabel.numberOfLines = 0
                mixpanelSecondaryIDLabel.textAlignment = .center
                
                let stackView = UIStackView(arrangedSubviews: [mixpanelPrimaryIDLabel, mixpanelSecondaryIDLabel])
                stackView.axis = .vertical
                stackView.distribution = .equalSpacing
                stackView.spacing = 8
                
                self.view.addSubview(stackView)
                stackView.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([
                    stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                    stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
                    stackView.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -30)
                ])
            }
        })
    }
}

