//
//  ViewController.swift
//  Chapter5VFL
//
//  Created by Herve Desrosiers on 2020-03-03.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(redView)
        view.addSubview(greenView)
        
        let views = [
            "redView" : redView,
            "greenView" : greenView
        ]
        
        let metrics = [
            "padding" : 50.0,
            "spacing" : 25.0
        ]
        
        let hRedConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(padding)-[redView]-(padding)-|",
            options: [],
            metrics: metrics,
            views: views)
        let hGreenConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(padding)-[greenView]-(padding)-|",
            options: [],
            metrics: metrics,
            views: views)
        let vConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-(padding)-[redView(==greenView)]-(spacing)-[greenView]-(padding)-|",
            options: [],
            metrics: metrics,
            views: views)
        
        let constraints = hRedConstraints + hGreenConstraints + vConstraints
        NSLayoutConstraint.activate(constraints)
    }

    private let redView = UIView.makeView(color: .red)
    private let greenView = UIView.makeView(color: .green)
}

private extension UIView {
    static func makeView(color: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }
}

