//
//  TestViewControllerCollectionViewController.swift
//  Trip Test
//
//  Created by Wojciech Jankowiak on 29/05/2018.
//  Copyright © 2018 Wojciech Jankowiak. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TestViewController: UICollectionViewController {
    
    var questions : [Question] = [
        Question(name: "Pod względem architektonicznym jaką budowlą jest katedra w Galway", firstAnswer: "Ekleryczną", secondAnswer: "Eklektyczną", thirdAnswer: "Erotyczną", fourthAnswer: "Ironiczną", correctIndex: 2),
        Question(name: "W którym roku ukończono wieże kościoła Sagrada Familia", firstAnswer: "1920", secondAnswer: "1830", thirdAnswer: "1550", fourthAnswer: "1835", correctIndex:1),
        Question(name: "Co z języka francuskiego oznacza Notre Dame", firstAnswer: "Nasza Katedra", secondAnswer: "Nasza Matka", thirdAnswer: "Nasza Pani", fourthAnswer: "Ósma Żona", correctIndex: 3),
        Question (name: "W którym roku rozstrzygnięto konkurs na projekt Fasady Il Duomo we Florencji", firstAnswer: "1355", secondAnswer: "966", thirdAnswer: "1871", fourthAnswer: "1999", correctIndex: 3),
        Question (name: "Jaką funkcję pełni obecnie Hagia Sofia", firstAnswer: "Muzeum", secondAnswer: "Magazyn", thirdAnswer: "Stoi pusta i nieużywana", fourthAnswer: "Szpital", correctIndex: 1)]
    var questions2 : [Question] = [
        Question(name: "W jakich latach wybudowano Katedrę w Galway", firstAnswer: "1948–1965", secondAnswer: "1958–1985", thirdAnswer: "1957–1965", fourthAnswer: "1958–1965", correctIndex:4),
        Question(name: "W jakim mieście znajduje się Sagrada Familia", firstAnswer: "Paryż", secondAnswer: "Berlin", thirdAnswer: "Florencja", fourthAnswer: "Barcelona", correctIndex: 4),
        Question(name: "Jak długo trwała budowa katedry Notre Dame w Paryżu", firstAnswer: "mniej niż 100 lat", secondAnswer: "powyżej 180 lat", thirdAnswer: "równo 150 lat", fourthAnswer: "budowa trwa nadal", correctIndex: 2),
        Question(name: "Co znaczy nazwa Il Duomo", firstAnswer: "Władca", secondAnswer: "Kościół", thirdAnswer: "Katedra", fourthAnswer: "Bóg", correctIndex: 3),
        Question(name: "W jakim mieście znajduje się Sagrada Familia", firstAnswer: "Paryż", secondAnswer: "Berlin", thirdAnswer: "Florencja", fourthAnswer: "Barcelona", correctIndex: 4)]
    var isCorrect : [Bool] = [true, true, true, true, true]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        print (isCorrect)
        for question in questions {
            question.selectedIndex = -1
        }
        
        for question in questions2 {
            question.selectedIndex = -1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }

    fileprivate func setImage(_ indexPath: IndexPath, field: UIImageView, value: Int) {
        if(questions[indexPath.row].selectedIndex == value || questions2[indexPath.row].selectedIndex == value) {
            field.image = UIImage(named:"tick")
        } else {
            field.image = nil
        }
    }
    
    fileprivate func setCellData(_ indexPath: IndexPath, _ cell: QuestionCell) {
        if (isCorrect[indexPath.row]) {
            cell.first?.setTitle(questions[indexPath.row].firstAnswer, for: .normal)
            cell.second?.setTitle(questions[indexPath.row].secondAnswer, for: .normal)
            cell.third?.setTitle(questions[indexPath.row].thirdAnswer, for: .normal)
            cell.fourth?.setTitle(questions[indexPath.row].fourthAnswer, for: .normal)
            cell.question?.text = questions[indexPath.row].name
        } else {
            cell.first?.setTitle(questions2[indexPath.row].firstAnswer, for: .normal)
            cell.second?.setTitle(questions2[indexPath.row].secondAnswer, for: .normal)
            cell.third?.setTitle(questions2[indexPath.row].thirdAnswer, for: .normal)
            cell.fourth?.setTitle(questions2[indexPath.row].fourthAnswer, for: .normal)
            cell.question?.text = questions2[indexPath.row].name
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "questionCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! QuestionCell
        setCellData(indexPath, cell)
        
        if(isCorrect[indexPath.row]) {
                setImage(indexPath, field: (cell.imgone!), value: 1)
                setImage(indexPath, field: (cell.imgtwo!), value: 2)
                setImage(indexPath, field: (cell.imgthree!), value: 3)
                setImage(indexPath, field: (cell.imgfour!), value: 4)
        } else {
                setImage(indexPath, field: (cell.imgone!), value: 1)
                setImage(indexPath, field: (cell.imgtwo!), value: 2)
                setImage(indexPath, field: (cell.imgthree!), value: 3)
                setImage(indexPath, field: (cell.imgfour!), value: 4)
        }
        return cell
    }

    fileprivate func setSelected(_ i: Int, value: Int) {
        if(isCorrect[i]) {
            if questions[i].selectedIndex != value
            {
                questions[i].selectedIndex = value
            } else {
                questions[i].selectedIndex = -1
            }
            } else {
            if questions2[i].selectedIndex != value
            {
                questions2[i].selectedIndex = value
            } else {
                questions2[i].selectedIndex = -1
            }
        }
    }
    
    @IBAction func firstClick(_ sender: UIButton, forEvent event: UIEvent) {
        for i in 0...4 {
            if(questions[i].firstAnswer==sender.titleLabel?.text || questions2[i].firstAnswer==sender.titleLabel?.text) {
                setSelected(i, value: 1)
            }
        }
        self.collectionView?.reloadData()
    }
    @IBAction func secondClick(_ sender: UIButton) {
        for i in 0...4 {
            if(questions[i].secondAnswer==sender.titleLabel?.text || questions2[i].secondAnswer==sender.titleLabel?.text) {
                setSelected(i, value: 2)
            }
        }
        self.collectionView?.reloadData()
    }
    
    @IBAction func thirdClick(_ sender: UIButton) {
        for i in 0...4 {
            if(questions[i].thirdAnswer==sender.titleLabel?.text || questions2[i].thirdAnswer==sender.titleLabel?.text) {
               setSelected(i, value: 3)
            }
        }
        self.collectionView?.reloadData()
    }
    
    @IBAction func fourthClick(_ sender: UIButton) {
        for i in 0...4 {
            if(questions[i].fourthAnswer==sender.titleLabel?.text || questions2[i].fourthAnswer==sender.titleLabel?.text) {
                setSelected(i, value: 4)
            }
        }
    self.collectionView?.reloadData()
    }
    
    override func prepare (for seque: UIStoryboardSegue, sender: Any?) {
        if seque.identifier == "showTestSummary" {
            var questionsToSend : [Question] = [Question(), Question(), Question(), Question(), Question()]
            for i in 0...4 {
                if isCorrect[i] {
                 questionsToSend[i] = self.questions[i]
                } else {
                    questionsToSend[i] = self.questions2[i]
                }
            }
        
            let destinationController = seque.destination as! SummaryController
            destinationController.questions = questionsToSend
        }
    }
}
