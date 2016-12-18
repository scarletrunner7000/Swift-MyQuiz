//
//  QuestionDataManager.swift
//  MyQuiz
//
//  Created by 稲垣悠一 on 2016/08/16.
//  Copyright © 2016年 稲垣悠一. All rights reserved.
//

import Foundation

class QuestionDataManager {
    
    // シングルトンのオブジェクトを作成
    static let sharedInstance = QuestionDataManager()
    
    // 問題を格納する配列
    var questionDataArray = [QuestionData]()
    
    // 現在の問題のインデックス
    var currentQuestionIndex: Int = 0
    
    private init() {
        // シングルトンであることを保証するために private で宣言しておく
    }
    
    // 問題文の読み込み
    func loadQuestion() {
        questionDataArray.removeAll()
        currentQuestionIndex = 0
        
        // CSV ファイルを取得
        if let csvFilePath = NSBundle.mainBundle().pathForResource("question", ofType: "csv") {
            // CSV データ読み込み
            do {
                if let csvStringData: String = try String(contentsOfFile: csvFilePath, encoding: NSUTF8StringEncoding) {
                    // CSV データを1行ずつ読み込む
                    csvStringData.enumerateLines({ (line, stop) -> () in
                        // カンマ区切りで分割
                        let questionSourceDataArray = line.componentsSeparatedByString(",")
                        let questionData = QuestionData(questionSourceDataArray: questionSourceDataArray)
                        self.questionDataArray.append(questionData)
                        questionData.questionNo = self.questionDataArray.count
                    })
                }
            } catch let error {
                // ファイル読み込みエラー時
                print(error)
            }
        }
    }
    
    // 次の問題を取り出す
    func nextQuestion() -> QuestionData? {
        if currentQuestionIndex < questionDataArray.count {
            let nextQuestion = questionDataArray[currentQuestionIndex]
            currentQuestionIndex += 1
            return nextQuestion
        }
        return nil
    }
    
}




