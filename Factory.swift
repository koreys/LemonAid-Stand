//
//  Factory.swift
//  LemonadeStand
//
//  Created by Korey Stanley on 12/9/14.
//  Copyright (c) 2014 Black Sand. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    class func createTodaysCustomers(numOfCustomers: Int) -> [Customer] {
        var customers: [Customer] = []
        
        for var index = 0; index < numOfCustomers + 1; index++ {
            println("Creating customer Number: \(index + 1).")
            var customer = Customer()
            var lemonadePref: Double = drand48()
            
            if lemonadePref < 0.4 {
                customer.likesAcidicLemonade = true
                println("His Lemonade Pref is: \(lemonadePref). He Likes Acidic Lemonade.")
            }
            else if lemonadePref >= 0.4 && lemonadePref <= 0.6 {
                customer.likeEqualPartsLemonade = true
                println("His Lemonade Pref is: \(lemonadePref). He Likes Eqaul Lemonade.")
            }
            else if lemonadePref > 0.6 {
                customer.likesDilutedLemonade = true
                println("His Lemonade Pref is: \(lemonadePref). He Likes Diluted Lemonade.")
            }
            
            customer.lemonadePref = lemonadePref
            customers.append(customer)
            
        }
        
        
        return customers
    }
    
}
