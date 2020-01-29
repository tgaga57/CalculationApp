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
    
    var moneySum = 0
    var capitalmoneySum = 0
    var intetSum = 0
    
    // アラート用
    var alertController:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 何もはいっていない
        sum.text = ""
        capitalMoney2.text = ""
        interestSum.text = ""
        
        // delegateの設定
        self.capitalMoneyTextField.delegate = self
        self.depositTextField.delegate = self
        self.annualInterestTextField.delegate = self
        self.yearsTextfield.delegate = self
        
    }
    
    // 数字入力しかできないようにする
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 0から9までの数字しか許さない
        let allowedCharacters = "0123456789"
        // この中にallowedChraracrtesを入れる
        let charactersSet = CharacterSet(charactersIn: allowedCharacters)
        // String型
        let typedCharacterSet = CharacterSet(charactersIn: string)
        
        // 入力を反映させたテキストを取得する
        // 文字数の制限
        let resultText: String = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if resultText.count <= 14 {
            return charactersSet.isSuperset(of: typedCharacterSet)
        } else {
            return false
        }
        
        
    }
    
    
    
    // 計算ボタン
    @IBAction func calculation(_ sender: Any) {
        
        // textfieldの文字をint型に変換
        let capital: Int! = Int(capitalMoneyTextField.text!)
        let deposite: Int! = Int(depositTextField.text!)
        let annualInterest: Int! = Int(annualInterestTextField.text!)
        let years: Int! = Int(yearsTextfield.text!)
        
        // nilが全ての場合
        if capital == nil && deposite == nil && annualInterest == nil && years == nil {
            
            createAlert(title: "nil", message: "もう一度お願いします")
            
            reset()
            
        } else if capital == nil || deposite == nil || annualInterest == nil || years == nil{ // nilが一つでもある場合
            
            createAlert(title: "nil", message: "もう一度お願いします")
            
            reset()
            
            
        } else {
            
            capitalmoneySum = capital * (deposite * 12 * years)
            capitalMoney2.text = String(capitalmoneySum)
            
            
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


