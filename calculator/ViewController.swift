//
//  ViewController.swift
//  calculator
//
//  Created by Yang Nina on 2021/4/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var clearBtn: UIButton!
    
    //是否為新值
    var newvalue = true
    var preNum:Double = 0
    var currentNum:Double = 0
    enum OperationType {
        case add
        case subtract
        case multiply
        case divide
        case none
    }
    var operation: OperationType = .none
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numbers(_ sender: UIButton) {
        clearBtn.setTitle("C", for: UIControl.State.normal)
        //記錄輸入的值
        let inputnum = sender.tag
        if newvalue == true{
            resultLabel.text = "\(inputnum)"
            newvalue = false
            //輸入一個字元後，要把字元相加
        }
        else{
            //字元相加
            resultLabel.text! += "\(inputnum)"
            }
        currentNum = Double(resultLabel.text!)!
        
    }
    //改變正/負號
    @IBAction func changesign(_ sender: UIButton) {
        currentNum = Double(resultLabel.text!)! * -1
        anscheck(from: currentNum)
    }
    //百分比
    @IBAction func percent(_ sender: UIButton) {
        currentNum = Double(resultLabel.text!)! / 100
        anscheck(from: currentNum)
    }
    @IBAction func divide(_ sender: UIButton) {
        if preNum != 0 {
            nowresult()
        }
        preNum = currentNum
        newvalue = true
        operation = .divide
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        if preNum != 0 {
            nowresult()
        }
        preNum = currentNum
        newvalue = true
        operation = .multiply
    }
    @IBAction func subtract(_ sender: UIButton) {
        if preNum != 0 {
            nowresult()
        }
        preNum = currentNum
        newvalue = true
        operation = .subtract
    }
    @IBAction func add(_ sender: UIButton) {
        if preNum != 0 {
            nowresult()
        }
        preNum = currentNum
        newvalue = true
        operation = .add
    }
    @IBAction func equal(_ sender: UIButton) {
        nowresult()
        preNum = currentNum
        operation = .none
        newvalue = true
    }
    @IBAction func point(_ sender: UIButton) {
        if resultLabel.text != nil{
            resultLabel.text = resultLabel.text! + "."
        }
    }
    @IBAction func clear(_ sender: UIButton) {
        resultLabel.text = "\(0)"
        clearBtn.setTitle("AC", for: UIControl.State.normal)
        preNum = 0
        currentNum = 0
        newvalue = true
    }
    func nowresult(){
        switch operation {
            case .divide:
                currentNum = preNum / currentNum
                anscheck(from: currentNum)
            case .multiply:
                currentNum = preNum * currentNum
                anscheck(from: currentNum)
            case .subtract:
                currentNum = preNum - currentNum
                anscheck(from: currentNum)
            case .add:
                currentNum = preNum + currentNum
                anscheck(from: currentNum)
            case .none:
                currentNum = preNum
                anscheck(from: currentNum)
        }
    }
    
    func anscheck(from number: Double) {
        var check: String
        //floor取不大於number的整數
        //如果相等，代表number為整數，去掉小數點
        if floor(number) == number {
            check = "\(Int(number))"
        }
        else {
            check = "\(number)"
        }
        resultLabel.text = check
    }
}

