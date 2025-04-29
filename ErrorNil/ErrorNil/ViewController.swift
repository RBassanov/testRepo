//
//  ViewController.swift
//  ErrorNil
//
//  Created by Rustam on 26.04.2025.
//

import UIKit

class ViewController: UIViewController {
    
//    lazy var pageTitle: UILabel = {
//        let pageTitle = UILabel()
//        $0.text = "Hello Page"
//        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        $0.textColor = .gray
//        $0.frame = CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 50)
//        
//        return $0
    
    lazy var pageTitle: UILabel = createLabel(text: "Main page", frame: CGRect(x: 30,
                                                                               y: 100,
                                                                               width: view.frame.width - 60,
                                                                               height: 50))

    lazy var userImage: UIImageView = {
        $0.image = .img1
        $0.frame = CGRect(x: 30, y: pageTitle.frame.maxY + 28, width: view.frame.width - 60, height: 300)
        $0.layer.cornerRadius = 100
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    var userItem: UserItem
    
    init(userItem: UserItem) {
        self.userItem = userItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        printContent(userItem.name)
        
        view.addSubview(pageTitle)
        view.addSubview(userImage)
        view.addSubview(bth)
        view.addSubview(circle)
        
        circle.addSubview(viewLabel)
        
    }
    
    lazy var bth: UIButton = {
        $0.setTitle("user bth", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
        $0.frame.size = CGSize(width: view.frame.width - 60, height: 50)
        $0.frame.origin = CGPoint(x: 30, y: userImage.frame.maxY + 30)
        
        return $0
    }(UIButton(primaryAction: bthButton))
    
    lazy var bthButton: UIAction = UIAction { [weak self] _ in
        self?.pageTitle.text = "New Text"
    }
    
    lazy var circle: UIView = {
        $0.backgroundColor = .white
        $0.frame.size = CGSize(width: 100, height: 100)
        $0.center.x = view.center.x
        $0.frame.origin.y = bth.frame.maxY + 30
        $0.layer.cornerRadius = 50
        
        return $0
    }(UIView())
    
    lazy var viewLabel = createLabel(text: "V label", frame: CGRect(x: 10,
                                                                    y: 10,
                                                                    width: circle.frame.width - 20,
                                                                    height: 30))
    
    
    func createLabel(text: String, frame: CGRect) -> UILabel {
        let label = UILabel()
        label.text = text
        label.frame = frame
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .brown
        return label
    }


}

