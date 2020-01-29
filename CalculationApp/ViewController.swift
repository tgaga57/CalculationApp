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
    @IBOutlet weak var capitalMoneyTextField: UITextField!
    // 積立金
    @IBOutlet weak var depositTextField: UITextField!
    // 年利
    @IBOutlet weak var annualInterestTextField: UITextField!
    // 運用年数
    @IBOutlet weak var yearsTextfield: UITextField!
    
    // 合計金額
    @IBOutlet weak var sum: UILabel!
    // 元金
    @IBOutlet weak var capitalMoney2: UILabel!
    // 利息の合計
    @IBOutlet weak var interestSum: UILabel!
    
    var alertController:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 最初は文字がはいっていないようにした
        sum.text = ""
        capitalMoney2.text = ""
        interestSum.text = ""
        
        // delegateの設定
        self.capitalMoneyTextField.delegate = self
        self.depositTextField.delegate = self
        self.annualInterestTextField.delegate = self
        self.yearsTextfield.delegate = self
        
    }
    
    
    // 計算ボタン
    @IBAction func calculation(_ sender: Any) {
        // textfieldの文字をint型に変換
        var capital: Int? = Int(capitalMoneyTextField.text!)
        var deposite: Int? = Int(depositTextField.text!)
        var annualInterest: Int? = Int(annualInterestTextField.text!)
        var years: Int? = Int(yearsTextfield.text!)
        
        
        // 合計金額の表示
        if capitalMoneyTextField.text == nil || yearsTextfield.text == nil {
            createAlert(title: "数字を入力してください", message: "もう一度お願いします")
            
            print("error")
        } else {
            capitalMoney2.text =  String(capital! * years!)
                   print(capitalMoney2.text!)
                   
        }
    
    }
    
    // キャンセルボタン
    @IBAction func chancel(_ sender: Any) {
        
        // リセットを呼び出し
        reset()
    }
    
    //テキストフィールドでリターンが押されたときに通知され起動するメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    // テキストフィールド以外を触った時にキーボードを消す
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //  アラートの生成
    // 引数に自分でアラートの文字を入れることができる
    func createAlert(title:String,message:String) {
        
        alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alertController,animated: true)
        
    }
    
    
    func reset()  {
        // 全て初期化
              capitalMoneyTextField.text = ""
              depositTextField.text = ""
              annualInterestTextField.text = ""
              yearsTextfield.text = ""
              sum.text = ""
              capitalMoney2.text = ""
              interestSum.text = ""
    }
    
}
