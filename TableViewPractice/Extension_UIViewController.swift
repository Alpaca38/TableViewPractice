//
//  Extension_UIViewController.swift
//  TableViewPractice
//
//  Created by 조규연 on 5/24/24.
//

import UIKit

extension UIViewController {
    func showCheckAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let check = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(check)
        
        present(alert, animated: true)
    }
}
