//
//  ViewController.swift
//  CalculationApp
//
//  Created by 志賀大河 on 2020/01/28.
//  Copyright © 2020 志賀大河. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    // 元金
    @IBOutlet weak var capitalMoney: UITextField!
    // 積立金
    @IBOutlet weak var deposit: UITextField!
    // 年利
    @IBOutlet weak var annualInterest: UITextField!
    // 運用年数
    @IBOutlet weak var years: UITextField!
    
    
    // 合計金額
    @IBOutlet weak var sum: UILabel!
    // 元金
    @IBOutlet weak var capitalMoney2: UILabel!
    // 利息の合計
    @IBOutlet weak var interestSum: UILabel!
    
    var capital:Int? = Int(capitalMoney.text ?? )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.sum.text = ""
        self.capitalMoney2.text = ""
        self.interestSum.text = ""
    }

    
    
    
    
    @IBAction func calculation(_ sender: Any) {
        
        
        
        
        
    }
    
    
    
    @IBAction func chancel(_ sender: Any) {
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return
    }
    

}

