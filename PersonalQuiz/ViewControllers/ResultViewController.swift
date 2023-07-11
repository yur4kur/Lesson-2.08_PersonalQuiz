//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Избавиться от кнопки возврата назад на экране результатов // Done
    // 2. Передать массив с ответами на экран с результатами // Done
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным

    var userAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton.toggle()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
