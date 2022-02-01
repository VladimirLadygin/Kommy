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
    var currentGame: Game!
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
    ] .shuffled()
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    //Mark: Methods
    func enableButtons( enable: Bool = true) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }

    func newRound() {
        guard !listOfWords.isEmpty else {
            enableButtons(enable: false)
            updateUI ()
            return
        }
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
        enableButtons()

        print(newWord,incorrectMovesAllowed)
    }
    func updateCorrectWordLabel() {
        var displayWord = [String] ()
        for letter in currentGame.guessedWord {
            displayWord.append(String(letter))
        }
        correctWordLabel.text = displayWord.joined(separator: " ")
    }


    func updateState () {
        print(#line, currentGame.guessedWord == currentGame.word)
        if currentGame.incorrectMovesRemaining < 1 {
            totalLosses += 1
        } else if currentGame.guessedWord.lowercased() == currentGame.word.lowercased() {
            totalWins += 1
        } else  {
            updateUI()
        }
    }


    func updateUI() {
        let movesRemaining = currentGame.incorrectMovesRemaining
        let imageNumber = (movesRemaining + 6*6) % 6
        let image = "Gensek\(imageNumber)"
        gensecImageView.image = UIImage(named: image)
        updateCorrectWordLabel()
        scoreLabel.text = "Выиграно: \(totalWins), Проиграно: \(totalLosses)"
//        print(movesRemaining,imageNumber,gensecImageView.image)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        newRound()
    }
    
    //Mark: IBAction
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        currentGame.playerGuessed(letter: Character(letter))
        updateState()
    }

    
    
}


