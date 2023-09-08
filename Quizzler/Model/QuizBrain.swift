//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Nawra Alaradi on 06/09/2023.
//

import Foundation
import UIKit
import AVFoundation

struct QuizBrain {
    let quiz = [  Question(q: "A slug's blood is green.", a: "True"),
                        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                        Question(q: "Google was originally called 'Backrub'.", a: "True"),
                        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")]
    var currentIndex = 0
    var score = 0
    var player: AVAudioPlayer!
    mutating func checkAnswer(_ userAnswer:String) -> UIColor {
        let q = quiz[currentIndex]
        let actualAnswer = q.a
        if userAnswer == actualAnswer {
            score += 1
            
            let url = Bundle.main.url(forResource: "correct", withExtension: "mp3")
                       
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
            return UIColor.green
        }else {
           
            let url = Bundle.main.url(forResource: "wrong", withExtension: "mp3")
                       
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
            return UIColor.red
        }
    }
    mutating func updateCurrentIndex() {
        if currentIndex < quiz.count - 1 {
            print("Current Index: \(currentIndex), length : \(quiz.count) ")
            currentIndex += 1
            
        }  else {
            currentIndex = 0
            score = 0
        }
    }
    func getQuestionText() -> String {
        return quiz[currentIndex].q
    }
    
    func getProgress() -> Float {
       return Float(currentIndex + 1) / Float(quiz.count)
    }
}
