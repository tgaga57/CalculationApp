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
    
    // アラート用
    var alertController:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 何もはいっていない
        sum.text = ""
        capitalMoney2.text = ""
        interestSum.text = ""
        capitalMoneyTextField.text = ""
        depositTextField.text = ""
        annualInterestTextField.text = ""
        yearsTextfield.text = ""
        
        // delegateの設定
        self.capitalMoneyTextField.delegate = self
        self.depositTextField.delegate = self
        self.annualInterestTextField.delegate = self
        self.yearsTextfield.delegate = self
        
        print(sum.text)
        print(capitalMoney2.text)
        print(interestSum.text)
        print(capitalMoneyTextField.text)
        print(annualInterestTextField.text)
        print(yearsTextfield.text)
    }
    
    // 数字入力しかできないようにする
    // 文字数の制限
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 0から9までの数字しか許さない
        let allowedCharacters = "0123456789"
        // この中にallowedChraracrtesを入れる
        let charactersSet = CharacterSet(charactersIn: allowedCharacters)
        // String型
        let typedCharacterSet = CharacterSet(charactersIn: string)
        
        let resultText: String = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        // textfieldの数をとって桁数が15以上にならないようにする
        if resultText.count <= 15 {
            
            print(resultText.count)
            
            return charactersSet.isSuperset(of: typedCharacterSet)
            
        }
        
        return false
    }
    
    
    // 計算ボタン
    @IBAction func calculation(_ sender: Any) {
        
        // textfieldの文字をint型に変換
        var capital: Int? = Int(capitalMoneyTextField.text!)
        var deposite: Int? = Int(depositTextField.text!)
        var annualInterest: Int? = Int(annualInterestTextField.text!)
        var years: Int? = Int(yearsTextfield.text!)
        
        if capitalMoneyTextField.text == "" || depositTextField.text == "" || annualInterestTextField.text == "" || yearsTextfield.text == ""{
            
            createAlert(title: "", message: <#T##String#>)
            reset()
            
            
            
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


