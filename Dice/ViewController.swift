//
//  ViewController.swift
//  Dice
//
//  Created by Fancy Tseng on 1/31/21.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var dice1: UIImageView!
    
    @IBOutlet weak var dice2: UIImageView!
    
    @IBOutlet weak var lblWinLose: UILabel!
    
    @IBOutlet weak var lblBalance: UILabel!
    
    @IBOutlet weak var playBtn: UIButton!
    
    
    let imageArray = ["Dice 1", "Dice 2", "Dice 3", "Dice 4", "Dice 5", "Dice 6"]
    
    var rand1 = Int.random(in: 0...5)
    var rand2 = Int.random(in: 0...5)
    
    var balance = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeImage()
        
        // Do any additional setup after loading the view.
    }
    
    func changeImage(){
        rand1 = Int.random(in: 0...5)
        rand2 = Int.random(in: 0...5)
        
        dice1.image = UIImage(named: imageArray[rand1])
        dice2.image = UIImage(named: imageArray[rand2])
        
        print(imageArray[rand1])
        print(imageArray[rand2])
    }
    
    @IBAction func playSlot(_ sender: UIButton) {
        changeImage()
        
        if rand1 + rand2 == 7 {
            balance = balance + 3
            lblWinLose.text = "You won 3$"
        }
        else if rand1 + rand2 > 7 {
            balance = balance + 1
            lblWinLose.text = "You won 1$"
        }
        else if rand1 + rand2 < 7 {
            balance = balance - 1
            lblWinLose.text = "You lose 1$"
        }

        if balance <= 0 {
            playBtn.isEnabled = false
            lblWinLose.text = "Please restart app"
        }
    }


}

