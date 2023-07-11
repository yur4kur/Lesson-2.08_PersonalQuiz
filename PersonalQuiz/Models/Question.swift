//
//  Question.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 15.02.2023.
//

// MARK: Question
struct Question {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Какую пищу вы предпочитаете?",
                responseType: .single,
                answers: [
                    Answer(title: "Стейк", animal: .dog),
                    Answer(title: "Рыба", animal: .cat),
                    Answer(title: "Морковь", animal: .rabbit),
                    Answer(title: "Кукуруза", animal: .turtle)
                ]
            ),
            Question(
                title: "Что вам нравится больше?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Плавать", animal: .dog),
                    Answer(title: "Спать", animal: .cat),
                    Answer(title: "Обниматься", animal: .rabbit),
                    Answer(title: "Есть", animal: .rabbit)
                ]
            ),
            Question(
                title: "Любите ли вы поездки на машине?",
                responseType: .ranged,
                answers: [
                    Answer(title: "Ненавижу", animal: .cat),
                    Answer(title: "Нервничаю", animal: .rabbit),
                    Answer(title: "Не замечаю", animal: .turtle),
                    Answer(title: "Обожаю", animal: .dog)
                ]
            )
        ]
    }
}

// MARK: ResponseType
enum ResponseType {
    case single
    case multiple
    case ranged
}

// MARK: Answer
struct Answer {
    let title: String
    let animal: Animal
}

// MARK: Animal
enum Animal: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        }
    }
    
    static func getResult(_ answers: [Answer]) -> Animal {
        var result: Animal!
        
        let animals = answers.map { ($0.animal, 1) }
        let animalFrequencies = Dictionary(animals, uniquingKeysWith: +)
        let resultAnimal = animalFrequencies.max { $0.value < $1.value }
        
        if let animal = resultAnimal?.key {
            result = animal
        }
        
        return result
    }
}
