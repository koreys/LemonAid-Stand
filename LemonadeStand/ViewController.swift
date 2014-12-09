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
    var brewLemonsCount: Int = 0
    
    
    @IBOutlet weak var brewIceCubesCountLbl: UILabel!
    var brewIceCubesCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //Start Day
    @IBAction func startDayBtnPressed(sender: AnyObject) {
            println("Start Day Button Pressed")
        
    }
    
    //Player Supply Buttons
    @IBAction func addLemonSupplyBtn(sender: AnyObject) {
        println("Add to Lemon Supply Btn Pressed")
        
    }
    
    @IBAction func subtractLemonSupplyBtn(sender: AnyObject) {
        println("Sutract Lemon Supply Btn Pressed")
        
    }
    
    @IBAction func addIceCubesSupplyBtn(sender: AnyObject) {
        println("Add Ice Cubes Supply Btn Pressed")
    }
    
    @IBAction func subtractIceCubesSupplyBtn(sender: AnyObject) {
        println("Subtract Ice Cubes Supply Btn Pressed")
    }
    
    
    
    //Brew Mix Buttons
    @IBAction func addLemonBrewBtn(sender: AnyObject) {
    }
    
    @IBAction func subtractLemonBrewBtn(sender: AnyObject) {
    }
    
    @IBAction func addIceCubesBrewBtn(sender: AnyObject) {
    }
    
    @IBAction func subtractIceCubesBrewBtn(sender: AnyObject) {
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

