//
//  Lecture.swift
//  Trip Test
//
//  Created by Wojciech Jankowiak on 27/05/2018.
//  Copyright © 2018 Wojciech Jankowiak. All rights reserved.
//

import Foundation


class Lecture {
    var imageName: String;
    var lectureText: String;
    
    init(imageName:String,lectureText:String) {
        self.imageName=imageName;
        self.lectureText=lectureText;
    }
    convenience init () {
        self.init(imageName:"",lectureText:"")
    }
}
