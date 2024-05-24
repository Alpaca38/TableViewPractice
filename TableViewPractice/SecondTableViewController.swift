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
    
    var list = [
        Shopping(check: true, label: "그립톡 구매하기", bookmark: true),
        Shopping(check: false, label: "사이다 구매", bookmark: false),
        Shopping(check: false, label: "아이패드 케이스 최저가 알아보기", bookmark: true),
        Shopping(check: false, label: "양말", bookmark: true)
    ]
    
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
        addButton.tintColor = .black
        addButton.titleLabel?.font = .systemFont(ofSize: 14)

    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let text = addTextField.text, text.count > 1 else {
            showCheckAlert(title: "두글자 이상 입력해주세요", message: nil)
            return
        }
        list.append(Shopping(check: false, label: text, bookmark: false))
        addTextField.text = ""
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell") as! SecondTableViewCell
        
        cell.customView.layer.cornerRadius = 10
        cell.customView.backgroundColor = .lightGray.withAlphaComponent(0.12)
        
        let checkImage = list[indexPath.row].check ? "checkmark.square.fill" : "checkmark.square"
        cell.checkButton.setImage(UIImage(systemName: checkImage), for: .normal)
        cell.checkButton.tintColor = .black
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
        cell.shoppingLabel.text = list[indexPath.row].label
        cell.shoppingLabel.font = .systemFont(ofSize: 14)
        
        let bookmarkImage = list[indexPath.row].bookmark ? "star.fill" : "star"
        cell.bookmarkButton.setImage(UIImage(systemName: bookmarkImage), for: .normal)
        cell.bookmarkButton.tintColor = .black
        cell.bookmarkButton.tag = indexPath.row
        cell.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    @objc func checkButtonTapped(sender: UIButton) {
        list[sender.tag].check.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    @objc func bookmarkButtonTapped(sender: UIButton) {
        list[sender.tag].bookmark.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
}
