//
//  QuestionViewController.swift
//  MyQuiz
//
//  Created by 稲垣悠一 on 2016/08/16.
//  Copyright © 2016年 稲垣悠一. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionNoLabel: UILabel!
    @IBOutlet weak var questionTextLabel: UITextView!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var correctImageView: UIImageView!
    @IBOutlet weak var incorrectImageView: UIImageView!
    
    var questionData: QuestionData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionNoLabel.text = "Q.\(questionData.questionNo)"
        questionTextLabel.text = questionData.question
        for (i, answerButton) in answerButtons.enumerate() {
            answerButton.setTitle(questionData.answers[i], forState: UIControlState.Normal)
            answerButton.tag = i + 1
        }
    }
    
    // 次の問題に遷移する
    func goNextQuestion() {
        if let nextQuestion = QuestionDataManager.sharedInstance.nextQuestion() {
            // storyboard の Identifier を元に ViewController を生成する
            if let nextQuestionViewController = storyboard?.instantiateViewControllerWithIdentifier("question") as? QuestionViewController {
                nextQuestionViewController.questionData = nextQuestion
                
                // segue を利用しない明示的な画面遷移
                self.presentViewController(nextQuestionViewController, animated: true, completion: nil)
            }
        } else {
            // 問題文がない場合は結果画面へ遷移する
            // storyboard の Identifier を元に ViewController を生成する
            if let resultViewController = storyboard?.instantiateViewControllerWithIdentifier("result") as? ResultViewController {
                // segue を利用しない明示的な画面遷移
                self.presentViewController(resultViewController, animated: true, completion: nil)
            }
            
        }
    }
    
    @IBAction func tapAnswerButton(sender: UIButton) {
        questionData.userChoiceAnswerNumber = sender.tag - 1
        
        AudioServicesPlaySystemSound(questionData.isCorrect() ? 1025 : 1006)
        UIView.animateWithDuration(2.0, animations: { () -> Void in
            let targetImageView = self.questionData.isCorrect() ? self.correctImageView : self.incorrectImageView
            targetImageView.alpha = 1.0
        }, completion: { (Bool) -> Void in
            self.goNextQuestion()
        })
    }
    
    
}




