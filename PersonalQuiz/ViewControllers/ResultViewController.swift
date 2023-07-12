//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

// 1. Избавиться от кнопки возврата назад на экране результатов
// 2. Передать массив с ответами на экран с результатами
// 3. Определить наиболее часто встречающийся тип животного
// 4. Отобразить результаты в соответствии с этим животным

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var animalPictureLabel: UILabel!
    @IBOutlet var animalDefinitionLabel: UILabel!
    
    // MARK: Public properties
    var userAnswers: [Answer]!
    
    // MARK: Private properties
    private var result: Animal {
        getResult(userAnswers)
    }
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 1. Избавиться от кнопки возврата назад на экране результатов
        navigationItem.hidesBackButton.toggle()
        
        // MARK: 4. Отобразить результаты в соответствии с этим животным
        setupLabels(with: result)
    }
    
    // MARK: IBACtions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

// MARK: Extensions
private extension ResultViewController {
    // MARK: 3. Определить наиболее часто встречающийся тип животного
    func getResult(_ answers: [Answer]) -> Animal {
        var result: Animal!
        
        let animals = answers.map { ($0.animal, 1) }
        let animalFrequencies = Dictionary(animals, uniquingKeysWith: +)
        let resultAnimal = animalFrequencies.max { $0.value < $1.value }
        
        if let animal = resultAnimal?.key {
            result = animal
        }
        
        setupLabels(with: result)
        return result
    }
    // MARK: 4. Отобразить результаты в соответствии с этим животным
    func setupLabels(with animal: Animal) {
        animalPictureLabel.text = "Вы - \(animal.rawValue)"
        animalDefinitionLabel.text = animal.definition
    }
}
