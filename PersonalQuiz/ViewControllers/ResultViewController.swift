//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var animalPictureLabel: UILabel!
    @IBOutlet var animalDefinitionLabel: UILabel!
    
    // MARK: Public properties
    var userAnswers: [Answer]!
    
    // MARK: Private propeties
    private var result: Animal {
        Animal.getResult(userAnswers)
    }
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton.toggle()
        animalPictureLabel.text = String(result.rawValue)
        animalDefinitionLabel.text = result.definition
    }
    
    // MARK: IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
