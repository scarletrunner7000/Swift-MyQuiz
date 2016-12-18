//
//  ResultViewController.swift
//  MyQuiz
//
//  Created by 稲垣悠一 on 2016/08/16.
//  Copyright © 2016年 稲垣悠一. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var correctPercentLabel: UILabel!
    
    let questionCount = QuestionDataManager.sharedInstance.questionDataArray.count
    var correctCount :Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let questionCount = QuestionDataManager.sharedInstance.questionDataArray.count
        var correctCount :Int = 0
        for questionData in QuestionDataManager.sharedInstance.questionDataArray {
            if questionData.isCorrect() {
                correctCount += 1
            }
        }
        let correctPercent :Float = (Float(correctCount) / Float(questionCount)) * 100
        // 小数第1位までを表示
        correctPercentLabel.text = String(format: "%.01f", correctPercent) + "%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
