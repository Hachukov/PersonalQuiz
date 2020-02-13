//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 11.02.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    var resultArrey: [Answer] = []
    
    
    // 2. Определить наиболее часто встречающийся тип животного
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    // 3. Отобразить результаты в соотвствии с этим животным
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var arr: [AnimalType] = []
        for i in resultArrey {
            arr.append(i.type)
            
        }
        for i in arr {
            resultDescriptionLabel.text = i.difinition
            resultLabel.text = "\(i.self)"

            
        }
        
        print("\(arr.removeUniques())")
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    deinit {
        print("ResultsViewController was been dealocated")
    }
    
}

extension Array where Element: Hashable {
    
    // removingUnique возвтрощает измененный масив
    func removingUnique() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) != nil
        }
    }
    // removeUniques меняет мосив на месте
    mutating func removeUniques() {
        self = self.removingUnique()
    }
}
