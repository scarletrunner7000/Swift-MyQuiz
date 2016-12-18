//
//  StartViewController.swift
//  MyQuiz
//
//  Created by 稲垣悠一 on 2016/08/16.
//  Copyright © 2016年 稲垣悠一. All rights reserved.
//

import Foundation
import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    // 次の画面に遷移する前に呼び出される準備処理
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        QuestionDataManager.sharedInstance.loadQuestion()
        
        // 遷移先画面取り出し
        if let nextViewController = segue.destinationViewController as? QuestionViewController {
            if let questionData = QuestionDataManager.sharedInstance.nextQuestion() {
                nextViewController.questionData = questionData
            }
        }
    }
    
    // タイトルに戻ってくる時に呼び出される処理
    @IBAction func goToTitle(segue: UIStoryboardSegue) {
        
    }
    
}




