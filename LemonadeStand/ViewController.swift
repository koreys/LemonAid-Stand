//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Korey Stanley on 12/8/14.
//  Copyright (c) 2014 Black Sand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Intial Values
    @IBOutlet weak var playerMoneyLbl: UILabel!
    var playerMoney: Int = 10
    
    
    @IBOutlet weak var playerLemonsLbl: UILabel!
    var playerLemons: Int = 0
    
    
    @IBOutlet weak var playerIceCubesLbl: UILabel!
    var playerIceCubes: Int = 0
    
    
    @IBOutlet weak var lemonSupplyLbl: UILabel!
    var lemonSupply: Int = 0
    
    
    @IBOutlet weak var iceCubeSupplyLbl: UILabel!
    var iceCubeSupply: Int = 0
    
    
    @IBOutlet weak var brewLemonsCountLbl: UILabel!
    var brewLemonsCount: Double = 0.0
    
    
    @IBOutlet weak var brewIceCubesCountLbl: UILabel!
    var brewIceCubesCount: Double = 0.0
    
    var todaysLemonadeRatio: Double = 0.0
    
    @IBOutlet weak var imgWeather: UIImageView!
    var todaysWeather: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateTodaysWeather()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //Start Day
    @IBAction func startDayBtnPressed(sender: AnyObject) {
        println("Start Day Button Pressed")
        
        if brewLemonsCount == 0.0 || brewIceCubesCount == 0.0 {
            showAlertWithMsg(header: "Wait !", msg: "You must have atleast one lemon and 1 ice cube in each brew.")
        }
        else {
            //Figure out brew ratio
            todaysLemonadeRatio = brewLemonsCount / brewIceCubesCount
            println("Todays brew ration is \(todaysLemonadeRatio)")
            
            
            //Create a random amount of customers between 1 and 10
            var customerCount: Int = Int(arc4random_uniform(UInt32(10)))
            if todaysWeather == 0 {
                //Today is Cold
                if customerCount > 3 {
                    customerCount -= 3
                }
                else if customerCount > 2 {
                    customerCount -= 2
                    
                }
                println("Today is cold... Business is slow")
                
            }
            else if todaysWeather == 2 {
                //Today is warm
                customerCount += 4
                println("Today is warm! Extra busy Today")
            }
            
            println("Today we will have \(customerCount + 1) customers")
            var customers: [Customer] = Factory.createTodaysCustomers(customerCount)
            
            //Check to see if we have the right Lemonade for each Customer
            var todaysWinnings: Int = 0
            
            for customer in customers {
                if customer.likesDilutedLemonade == true {
                    if todaysLemonadeRatio < 1 {
                        println("Paying Customer!")
                        playerMoney += 1
                        todaysWinnings += 1
                        playerMoneyLbl.text = "\(playerMoney)"
                    }
                }
                else if customer.likeEqualPartsLemonade == true {
                    if todaysLemonadeRatio == 1 {
                        println("Paying Customer!")
                        playerMoney += 1
                        todaysWinnings += 1
                        playerMoneyLbl.text = "\(playerMoney)"
                    }
                }
                else if customer.likesAcidicLemonade == true {
                    if todaysLemonadeRatio > 1 {
                        println("Paying Customer!")
                        playerMoney += 1
                        todaysWinnings += 1
                        playerMoneyLbl.text = "\(playerMoney)"
                    }
                }
            }
            
            if todaysWinnings > 0 {
                showAlertWithMsg(header: "Todays Earnings", msg: "Today you had \(customers.count) potential customers. Total earnings for the day was $ \(todaysWinnings)")
            }
            else {
                showAlertWithMsg(header: "Try Again Tommorrow", msg: "Today you had \(customers.count) potential customers. None of them preferred your mixture.")
            }
            
            //Set mixture back to zero
            brewIceCubesCount = 0.0
            brewLemonsCount = 0.0
            brewIceCubesCountLbl.text = "\(brewIceCubesCount)"
            brewLemonsCountLbl.text = "\(brewLemonsCount)"
            generateTodaysWeather()
        }
        
    
    }
    
    
    
    
    //Player Supply Buttons
    @IBAction func addLemonSupplyBtn(sender: AnyObject) {
        println("Add to Lemon Supply Btn Pressed")
        if playerMoney >= 2 {
            playerLemons += 1
            playerMoney -= 2
            playerLemonsLbl.text = "\(playerLemons)"
            playerMoneyLbl.text = "\(playerMoney)"
        }
        else {
            println("Player is out of Money")
            showAlertWithMsg(header: "Oh No...", msg: "Your out of Money 😢")
        }
        
    }
    
    @IBAction func subtractLemonSupplyBtn(sender: AnyObject) {
        println("Sutract Lemon Supply Btn Pressed")
        if playerLemons >= 1 {
            playerLemons -= 1
            playerMoney += 2
            playerLemonsLbl.text = "\(playerLemons)"
            playerMoneyLbl.text = "\(playerMoney)"
        }
        else {
            println("Player has no more lemons to sell back to supplier")
            showAlertWithMsg(header: "Sorry", msg: "You have no lemons to sell back to the supplier.")
        }
        
    }
    
    @IBAction func addIceCubesSupplyBtn(sender: AnyObject) {
        println("Add Ice Cubes Supply Btn Pressed")
        if playerMoney >= 1 {
            playerIceCubes += 1
            playerMoney -= 1
            playerIceCubesLbl.text = "\(playerIceCubes)"
            playerMoneyLbl.text = "\(playerMoney)"
        }
        else {
            println("Player is out of Money")
            showAlertWithMsg(header: "Oh No...", msg: "Your out of Money 😢")
        }
    }
    
    @IBAction func subtractIceCubesSupplyBtn(sender: AnyObject) {
        println("Subtract Ice Cubes Supply Btn Pressed")
        if playerIceCubes >= 1 {
            playerIceCubes -= 1
            playerMoney += 1
            playerIceCubesLbl.text = "\(playerIceCubes)"
            playerMoneyLbl.text = "\(playerMoney)"
        }
        else {
            println("Player has no more ice cubes to sell back to supplier")
            showAlertWithMsg(header: "Sorry", msg: "You have no ice cubes to sell back to the supplier.")
        }
    }
    
    
    
    //Brew Mix Buttons
    @IBAction func addLemonBrewBtn(sender: AnyObject) {
        println("Add Lemon to the Brew buttom pressed.")
        if playerLemons > 0 {
            playerLemons -= 1
            brewLemonsCount += 1
            playerLemonsLbl.text = "\(playerLemons)"
            brewLemonsCountLbl.text = "\(brewLemonsCount)"
        }
        else {
            showAlertWithMsg(header: "Sorry", msg: "You dont have any more lemons to add to your brew.")
        }
    }
    
    @IBAction func subtractLemonBrewBtn(sender: AnyObject) {
        println("Remove Lemon from brew button pressed.")
        if brewLemonsCount > 0 {
            brewLemonsCount -= 1
            playerLemons += 1
            playerLemonsLbl.text = "\(playerLemons)"
            brewLemonsCountLbl.text = "\(brewLemonsCount)"
        }
        else {
            showAlertWithMsg(header: "Sorry", msg: "There are no more lemons in your brew to remove.")
        }
    }
    
    @IBAction func addIceCubesBrewBtn(sender: AnyObject) {
        println("Add Ice Cubes to the Brew buttom pressed.")
        if playerIceCubes > 0 {
            playerIceCubes -= 1
            brewIceCubesCount += 1
            playerIceCubesLbl.text = "\(playerIceCubes)"
            brewIceCubesCountLbl.text = "\(brewIceCubesCount)"
        }
        else {
            showAlertWithMsg(header: "Sorry", msg: "You dont have any more Ice Cubes to add to your brew.")
        }
    }
    
    @IBAction func subtractIceCubesBrewBtn(sender: AnyObject) {
        println("Remove Ice Cubes from brew button pressed.")
        if brewIceCubesCount > 0 {
            brewIceCubesCount -= 1
            playerIceCubes += 1
            playerIceCubesLbl.text = "\(playerIceCubes)"
            brewIceCubesCountLbl.text = "\(brewIceCubesCount)"
        }
        else {
            showAlertWithMsg(header: "Sorry", msg: "There are no more Ice Cubes in your brew to remove.")
        }
    }
    
    
    func showAlertWithMsg(header: String = "Alert", msg: String){
        var alert = UIAlertController(title: header, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    func generateTodaysWeather() {
        todaysWeather = Int(arc4random_uniform(UInt32(3)))
        if todaysWeather == 0 {
            //Today is Cold
            imgWeather.image = UIImage(named: "Cold")
        }
        else if todaysWeather == 1 {
            //Today is mild
            imgWeather.image = UIImage(named: "Mild")
        }
        else {
            //Today is warm
            imgWeather.image = UIImage(named: "Warm")
        }
    }
    
    
    
    
    
    
    
}

