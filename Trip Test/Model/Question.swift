//
//  Question.swift
//  Trip Test
//
//  Created by Wojciech Jankowiak on 27/05/2018.
//  Copyright © 2018 Wojciech Jankowiak. All rights reserved.
//

import Foundation

class Question {
    var name:          String
    var firstAnswer:   String
    var secondAnswer:  String
    var thirdAnswer:   String
    var fourthAnswer:  String
    var isCorrect:     Bool
    var correctIndex:  Int
    var selectedIndex: Int
    
    init(name: String, firstAnswer: String, secondAnswer: String, thirdAnswer: String, fourthAnswer: String, correctIndex: Int){
        self.name = name
        self.firstAnswer = firstAnswer
        self.secondAnswer = secondAnswer
        self.thirdAnswer = thirdAnswer
        self.fourthAnswer = fourthAnswer
        self.isCorrect = true
        self.correctIndex = correctIndex
        self.selectedIndex = -1
    }
    convenience init() {
        self.init(name:"",firstAnswer:"",secondAnswer:"",thirdAnswer:"",fourthAnswer:"",correctIndex:1)
    }
}
