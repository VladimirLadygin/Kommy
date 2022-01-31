//
//  ViewController.swift
//  Kommy
//
//  Created by Владимир Ладыгин on 31.01.2022.
//

import UIKit

class ViewController: UIViewController {
//Mark: Outlets
    @IBOutlet weak var gensecImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //Mark: Properties
    let incorrectMovesAllowed = 5
    var listOfWords = [
        "Атеизм",
                "Базис",
                "Буржуазия",
                "Буржуазная демократия",
                "Демократический централизм",
                "Диктатура пролетариата",
                "Империализм",
                "Интернационализм",
                "Капитализм",
                "Экспроприация",
                "Капиталисты",
                "Классовая борьба",
                "Классы",
                "Консенсунс",
                "Коммунизм",
                "Коммунистическая партия",
                "Марксизм-ленинизм",
                "Маркс",
                "Ленин",
                "Пролетариат",
                "Ревизионизм",
                "Симпозиум",
                "Эксплуатация",
                "Энгельс",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

