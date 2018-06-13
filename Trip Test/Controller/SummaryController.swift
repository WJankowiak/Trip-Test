//
//  SummaryController.swift
//  Trip Test
//
//  Created by Wojciech Jankowiak on 31/05/2018.
//  Copyright © 2018 Wojciech Jankowiak. All rights reserved.
//

import UIKit

class SummaryController: UITableViewController {

    var questions : [Question] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    fileprivate func setCorrectImage(_ indexPath: IndexPath, img: UIImageView, value: Int) {
        if(questions[indexPath.row].correctIndex == value){
            img.image = UIImage(named: "tick")
            img.image = img.image!.withRenderingMode(.alwaysTemplate)
            img.tintColor = UIColor.green
        } else {
            img.image = nil
        }
    }
    
    fileprivate func setSelectedImage(_ indexPath: IndexPath, img: UIImageView, value: Int) {
        if(questions[indexPath.row].selectedIndex == value) {
            if(questions[indexPath.row].selectedIndex == questions[indexPath.row].correctIndex) {
                img.image = UIImage(named:"tick")
            } else {
                img.image = UIImage(named:"cross")
            }
            img.image = img.image!.withRenderingMode(.alwaysTemplate)
            img.tintColor = UIColor.red
        } else {
            img.image = nil
        }
    }
    
    fileprivate func setAllSelectedImages(_ indexPath: IndexPath, _ cell: SummaryCell) {
        if(questions[indexPath.row].selectedIndex != -1) {
            setSelectedImage(indexPath, img: cell.imgone!, value: 1)
            setSelectedImage(indexPath, img: cell.imgtwo!, value: 2)
            setSelectedImage(indexPath, img: cell.imgthree!, value: 3)
            setSelectedImage(indexPath, img: cell.imgfour!, value: 4)
            
        }
    }
    
    fileprivate func setAllCorrectImagesForCell(_ indexPath: IndexPath, _ cell: SummaryCell) {
        if(questions[indexPath.row].correctIndex != -1) {
            setCorrectImage(indexPath, img :(cell.firstCorrect!),value: 1)
            setCorrectImage(indexPath, img :(cell.secondCorrect!),value: 2)
            setCorrectImage(indexPath, img :(cell.thirdCorrect!),value: 3)
            setCorrectImage(indexPath, img :(cell.fourthCorrect!),value: 4)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "summary", for: indexPath) as! SummaryCell
        cell.first?.text = questions[indexPath.row].firstAnswer
        cell.second?.text = questions[indexPath.row].secondAnswer
        cell.third?.text = questions[indexPath.row].thirdAnswer
        cell.fourth?.text = questions[indexPath.row].fourthAnswer
        cell.question?.text = questions[indexPath.row].name
        
        setAllSelectedImages(indexPath, cell)
        setAllCorrectImagesForCell(indexPath, cell)
        
        if(questions[indexPath.row].correctIndex == questions[indexPath.row].selectedIndex) {
            cell.backgroundColor = UIColor(displayP3Red: 0, green: 100, blue: 0, alpha: 0.2)
        } else {
            cell.backgroundColor = UIColor (displayP3Red: 100, green: 0, blue: 0, alpha: 0.5)
        }
        
        return cell
    }
    
    override func prepare (for seque: UIStoryboardSegue, sender: Any?) {
        if seque.identifier == "goToBegin" {
            var isCorrect :[Bool] = [false, false, false, false, false]
            for i in 0...1 {
                if questions[i].correctIndex == questions[i].selectedIndex {
                    isCorrect[i] = true
                }
            }
            let destinationController = seque.destination as! LectureSwipeController
            destinationController.Correct = isCorrect
        }
    }
    
       
}
