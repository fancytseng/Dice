//
//  ViewController.swift
//  Dice
//
//  Created by Fancy Tseng on 1/31/21.
//

import UIKit

class ViewController: UIViewController {

    
   
    @IBOutlet weak var image1: UIImageView!
    
    
    @IBOutlet weak var image2: UIImageView!
    
    
    @IBOutlet weak var lblWinLose: UILabel!
    
    @IBOutlet weak var lblBalance: UILabel!
    
    @IBOutlet weak var playBtn: UIButton!
    
    
    let imageArray = ["Dice1", "Dice2", "Dice3", "Dice4", "Dice5", "Dice6"]
    
    var rand1 = Int.random(in: 0...5)
    var rand2 = Int.random(in: 0...5)
    
    var balance = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeImage()
        lblWinLose.text = "Please tap Play bytton"
        lblBalance.text = "Your balance = \(balance)$"

    }
    
    func changeImage(){
        rand1 = Int.random(in: 0...5)
        rand2 = Int.random(in: 0...5)
        
        image1.image = UIImage(named: imageArray[rand1])
        image2.image = UIImage(named: imageArray[rand2])
        
//        print(imageArray[rand1])
//        print(imageArray[rand2])
    }
    
    @IBAction func playSlot(_ sender: UIButton) {
        changeImage()
        
        if rand1 + rand2 == 5 {
            balance = balance + 3
            lblWinLose.text = "You won 3$"
        }
        else if rand1 + rand2 > 5 {
            balance = balance + 1
            lblWinLose.text = "You won 1$"
        }
        else if rand1 + rand2 < 5 {
            balance = balance - 1
            lblWinLose.text = "You lose 1$"
        }
        lblBalance.text = "Your balance = \(balance)$"
        
        if balance <= 0 {
            playBtn.isEnabled = false
            lblWinLose.text = "Please restart app"
        }
    }


}

