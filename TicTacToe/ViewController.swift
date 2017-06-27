//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ian Kirson on 6/25/17.
//  Copyright © 2017 Ian Kirson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer) {
        if gameOver {
            //END THE GAME
        }
        else {
            for label in labelsArray {
            if label.canTap {
                if xTurn {
                    if label.frame.contains(sender.location(in: backgroundView)) {
                        label.text = "X"
                        checkForWinner()
                        xTurn = !xTurn
                        label.canTap = false
                        numberOfTurns += 1
                        if numberOfTurns == 9 {
                            displayWinningMessage(message: "The game ended in a draw.")
                        }
                    }
                }
                else {
                    if label.frame.contains(sender.location(in: backgroundView)) {label.text = "O"
                        checkForWinner()
                        xTurn = !xTurn
                        label.canTap = false
                        numberOfTurns += 1
                        if numberOfTurns == 9 {
                            displayWinningMessage(message: "The game ended in a draw.")
                        }
                    }
                }
            }
        }
    }
    }
    
    var labelsArray = [GridLabel] ()
    var xTurn = true
    var gameOver = false
    var numberOfTurns = 0
    
    func displayWinningMessage(message:String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) {
            (action) -> Void in self.resetGame()
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    
    func checkForWinner() {
        if (gridLabel0.text == "X" && gridLabel1.text == "X" && gridLabel2.text == "X") || (gridLabel3.text == "X" && gridLabel4.text == "X" && gridLabel5.text == "X") || (gridLabel6.text == "X" && gridLabel7.text == "X" && gridLabel8.text == "X") || (gridLabel0.text == "X" && gridLabel3.text == "X" && gridLabel6.text == "X") || (gridLabel1.text == "X" && gridLabel4.text == "X" && gridLabel7.text == "X") || (gridLabel2.text == "X" && gridLabel5.text == "X" && gridLabel8.text == "X") || (gridLabel0.text == "X" && gridLabel4.text == "X" && gridLabel8.text == "X") || (gridLabel2.text == "X" && gridLabel4.text == "X" && gridLabel6.text == "X") {
            displayWinningMessage(message: "The winner is X!!!")
        }
        
        if (gridLabel0.text == "O" && gridLabel1.text == "O" && gridLabel2.text == "O") || (gridLabel3.text == "O" && gridLabel4.text == "O" && gridLabel5.text == "O") || (gridLabel6.text == "O" && gridLabel7.text == "O" && gridLabel8.text == "O") || (gridLabel0.text == "O" && gridLabel3.text == "O" && gridLabel6.text == "O") || (gridLabel1.text == "O" && gridLabel4.text == "O" && gridLabel7.text == "O") || (gridLabel2.text == "O" && gridLabel5.text == "O" && gridLabel8.text == "O") || (gridLabel0.text == "O" && gridLabel4.text == "O" && gridLabel8.text == "O") || (gridLabel2.text == "O" && gridLabel4.text == "O" && gridLabel6.text == "O") {
            displayWinningMessage(message: "The winner is O!!!")
        }
    }
    
    func resetGame () {
        for label in labelsArray {
            label.text = ""
            label.canTap = true
        }
        xTurn = true
        gameOver = false
        numberOfTurns = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelsArray = [gridLabel0,gridLabel1,gridLabel2,gridLabel3,gridLabel4,gridLabel5,gridLabel6,gridLabel7,gridLabel8]

        }
    }






