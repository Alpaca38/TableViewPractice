//
//  FirstTableViewController.swift
//  TableViewPractice
//
//  Created by 조규연 on 5/23/24.
//

import UIKit

class FirstTableViewController: UITableViewController {
    
    var headers = ["전체 설정","개인 설정","기타"]
    var totalSettings = ["공지사항", "실험실", "버전 정보"]
    var privateSettings = ["개인/보안", "알림", "채팅", "멀티프로필"]
    var extraSettings = ["고객센터/도움말"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return totalSettings.count
        case 1:
            return privateSettings.count
        case 2:
            return extraSettings.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell")!
        cell.textLabel?.font = .systemFont(ofSize: 12)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = totalSettings[indexPath.row]
        case 1:
            cell.textLabel?.text = privateSettings[indexPath.row]
        case 2:
            cell.textLabel?.text = extraSettings[indexPath.row]
        default:
            cell.textLabel?.text = ""
        }
        
        return cell
    }
}
