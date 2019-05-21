//
//  ViewController.swift
//  Swift Project
//
//  Created by Genesis on 5/14/19.
//  Copyright © 2019 Genesis. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var treeImageView: UIImageView!
    @IBAction func buttonpressed(_ sender: UIButton) {
    sender.isEnabled = false
    let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
    currentGame.playerGuessed(letter: letter)
    updateGameState()
    }
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totallosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }

    }
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

    var listofwords = ["a ","ability", "able", "about", "above"," accept", "according" ,"account", "across", "act ","action" ,"activity", "actually", "add", "address"," administration", "admit" ,"adult", "affect" ,"after" ,"again", "against" ,"age" ,"agency" ,"agent" ,"ago", "agree" ,"agreement" ,"ahead", "air"," all"," allow", "almost", "alone", "along", "already", "also", "although", "always", "American", "among", "amount", "analysis", "and", "animal", "another", "answer", "any", "anyone", "anything", "appear", "apply", "approach"," area", "argue"," arm", "around", "arrive", "art", "article" ,"artist" ,"as", "ask" ,"assume" ,"at" ,"attack", "attention", "attorney", "audience", "author" ,"authority", "available" ,"avoid" ,"away" ,"baby"," back"," bad", "bag"," ball", "bank" ,"bar","base" ,"be", "beat" ,"beautiful", "because" ,"become", "bed" ,"before", "begin", "behavior", "behind", "believe" ,"benefit", "best"," better" ,"between", "beyond", "big" ,"bill", "billion", "bit", "black", "blood", "blue", "board", "body", "book", "born", "both", "box"," boy", "break", "bring", "brother", "budget"," build"," building"," business"," but"," buy"," by"," call", "camera", "campaign", "can", "cancer", "candidate", "capital"," car"," card" ,"care"," career"," carry"," case"," catch", "cause"," cell"," center", "central"," century"," certain"," certainly" ,"chair" ,"challenge" ,"chance", "change"," character" ,"charge" ,"check" ,"child" ,"choice" ,"choose"," church" ,"citizen" ,"city" ,"civil" ,"claim" ,"class" ,"clear"," clearly" ,"close", "coach"," cold"," collection"," college"," color", "come"," commercial", "common", "community"," company","  compare"," computer"," concern"," condition", "conference", "Congress", "consider", "consumer"," contain"," continue"," control", "cost", "could"," country", "couple", "course"," court"," cover"," create", "crime", "cultural", "culture"," cup", "current", "customer"," cut", "dark", "data"," daughter", "day","dead "]
    let incorrectmovesallowed = 7
    var totallosses = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    var currentGame : Game!
    struct Game {
        var word: String
        var incorrectMovesRemaining: Int
        var guessedLetters: [Character]
    
      mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.characters.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
        var formattedWord: String {
            var guessedWord = ""
            for letter in word.characters {
                if guessedLetters.contains(letter) {
                    guessedWord += "\(letter)"
                } else {
                    guessedWord += "_"
                }
            }
            return guessedWord
        }

}
    func enableletterbuttons(_ enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
    }

        func newRound() {
            if !listofwords.isEmpty{
            let newWord = listofwords.removeFirst()
            currentGame = Game(word: newWord,incorrectMovesRemaining: incorrectmovesallowed, guessedLetters: [])
                enableletterbuttons(true)
            updateUI()
            } else {
                enableletterbuttons(false)
            }
    }
        
        func updateUI() {
             var letters = [String]()
            for letter in currentGame.formattedWord.characters {
                letters.append(String(letter))
            }
            let wordWithSpacing = letters.joined(separator: " ")
            correctWordLabel.text = wordWithSpacing
            correctWordLabel.text = currentGame.formattedWord
            ScoreLabel.text = "Wins: \(totalWins), Losses: \(totallosses)"
            treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
            }
          
    }
    
    
    

        // Do any additional setup after loading the view, typically from a nib.


