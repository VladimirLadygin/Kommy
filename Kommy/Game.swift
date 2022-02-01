//
//  Game.swift
//  Kommy
//
//  Created by Владимир Ладыгин on 31.01.2022.
//

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    fileprivate var guessedLetters = [Character]()
    
    init(word: String, incorrectMovesRemaining: Int) {
        self.word = word
        self.incorrectMovesRemaining = incorrectMovesRemaining
    }
    
    var guessedWord: String {
    var wordToShow = ""
    for letter in word {
        if guessedLetters.contains(Character(letter.lowercased())) || letter == "-" || letter == " " {
            wordToShow += String(letter)
        } else {
            wordToShow += "_"
        }
    }
    return wordToShow
    }
    
    mutating func playerGuessed(letter: Character) {
        let lowercasedLetter = Character(letter.lowercased())
        guessedLetters.append(lowercasedLetter)
        if !word.lowercased().contains(lowercasedLetter)    {
            incorrectMovesRemaining -= 1
        }
        print(#line, guessedWord == word, "_\(guessedWord)_", "_\(word)_") //Check values in variables for fix trouble equal
        print(#line, word,incorrectMovesRemaining,guessedWord) //For view
    }
}
