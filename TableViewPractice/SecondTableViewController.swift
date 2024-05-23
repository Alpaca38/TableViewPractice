//
//  SecondTableViewController.swift
//  TableViewPractice
//
//  Created by 조규연 on 5/23/24.
//

import UIKit

class SecondTableViewController: UITableViewController {

    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var list = ["그립톡 구매하기","사이다 구매","아이패드 케이스 최저가 알아보기","양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTextField.backgroundColor = .systemGray6
        addTextField.layer.cornerRadius = 10
        addTextField.layer.borderWidth = 0
        addTextField.placeholder = "무엇을 구매하실 건가요?"
        
        addButton.layer.cornerRadius = 5
        addButton.layer.borderWidth = 0
        addButton.backgroundColor = .systemGray5
        addButton.setTitle("추가", for: .normal)

    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        list.append(addTextField.text!)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell")!
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 10
        cell.textLabel?.font = .systemFont(ofSize: 14)
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
}
