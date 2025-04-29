//
//  VIewController2.swift
//  ErrorNil
//
//  Created by Rustam on 28.04.2025.
//

import UIKit

class VIewController2: UIViewController {
    
    lazy var pageTitle: UILabel = createLabel(text: "Main page page you, Main page page you, Main page page you, Main page page you, Main page page you, Main page page you, Main page page you,")

    lazy var topImage = createImageView(image: .img1)
    
    lazy var bottomImage = createImageView(image: .img1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        view.addSubview(topImage)
        view.addSubview(pageTitle)
        view.addSubview(bottomImage)
        view.addSubview(bth)
        
        NSLayoutConstraint.activate([
            topImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            topImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topImage.heightAnchor.constraint(equalToConstant: 200),
            
            pageTitle.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 30),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            bottomImage.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 30),
            bottomImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bottomImage.heightAnchor.constraint(equalTo: topImage.heightAnchor, multiplier: 0.5),
            
            bth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bth.heightAnchor.constraint(equalToConstant: 50),
            bth.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
    }
    
    lazy var bth: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("user bth", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
        
        return $0
    }(UIButton(primaryAction: bthButton))
    
    lazy var bthButton: UIAction = UIAction { [weak self] _ in
        
    }
    
    
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .brown
        return label
    }
    
    func createImageView(image: UIImage) -> UIImageView {{
        $0.image = image
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
        
    }
}
