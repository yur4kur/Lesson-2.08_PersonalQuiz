//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

// 2. Передать массив с ответами на экран с результатами // Done
// 3. Определить наиболее часто встречающийся тип животного
// 4. Отобразить результаты в соответствии с этим животным

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalPictureLabel: UILabel!
    @IBOutlet var animalDefinitionLabel: UILabel!
    
    // MARK: 2. Передать массив с ответами на экран с результатами
    var userAnswers: [Answer]!
    
    // MARK: 3. Определить наиболее часто встречающийся тип животного
    private var result: Animal {
        Animal.getResult(userAnswers)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 1. Избавиться от кнопки возврата назад на экране результатов
        navigationItem.hidesBackButton.toggle()
        
        // MARK: 4. Отобразить результаты в соответствии с этим животным
        animalPictureLabel.text = String(result.rawValue)
        animalDefinitionLabel.text = result.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
