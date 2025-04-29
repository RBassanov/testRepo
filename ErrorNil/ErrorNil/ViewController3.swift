//
//  VIewController2.swift
//  ErrorNil
//
//  Created by Rustam on 28.04.2025.
//

import UIKit

struct UserItem: Identifiable {
    var id = UUID().uuidString
    let name: String
    let surname: String
    let phone: String
    
    static func mockData() -> [UserItem] {
        [
        UserItem(name: "Авиарежим", surname: "surname", phone: "airplane.circle"),
        UserItem(name: "Wi-Fi", surname: "surname", phone: "wifi"),
        UserItem(name: "Bluetooth", surname: "surname", phone: "antenna.radiowaves.left.and.right.circle.fill"),
        UserItem(name: "Сотовая связь", surname: "surname", phone: "antenna.radiowaves.left.and.right.circle.fill"),
        UserItem(name: "Режим модема", surname: "surname", phone: "square.and.arrow.up"),
        UserItem(name: "Аккумулятор", surname: "surname", phone: "square.and.arrow.down.badge.checkmark.fill")
        ]
    }
}

class ViewController3: UIViewController {
    
    var users = UserItem.mockData()
    
    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "mainCell")
        $0.dataSource = self
        $0.delegate = self
        
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(tableView)
        
        title = "Main Page"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
extension ViewController3: UITableViewDataSource {
    // Сколька ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = users[indexPath.row].name
        config.secondaryText = users[indexPath.row].surname
        config.image = UIImage(systemName: users[indexPath.row].phone)
        
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

extension ViewController3: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController(userItem: users[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            users.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
