//
//  ViewController.swift
//  TipHelp
//
//  Created by Sai Naveen Katla on 07/09/20.
//  Copyright © 2020 Sai Naveen Katla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var enterAmount: UITextField!
    @IBOutlet weak var splitPerson: UILabel!
    var percentageTip: Float?
    var brain: Cal?
    var split: Int?
    var value: Float = 0
    
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var ten: UIButton!
    @IBOutlet weak var fifteen: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func percenTapped(_ sender: UIButton) {
        zero.backgroundColor = .clear
        zero.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        five.backgroundColor = .clear
        five.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        seven.backgroundColor = .clear
        seven.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        ten.backgroundColor = .clear
        ten.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        fifteen.backgroundColor = .clear
        fifteen.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
        sender.backgroundColor = #colorLiteral(red: 0, green: 0.3333932459, blue: 0, alpha: 1)
        sender.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        switch sender.currentTitle! {
        case "0%":
            percentageTip = 0
        case "5%":
            percentageTip = 0.05
        case "7%":
            percentageTip = 0.07
        case "10%":
            percentageTip = 0.1
        case "15%":
            percentageTip = 0.15
        default:
            percentageTip = 0
        }
    }
    
    @IBAction func calculateTapped(_ sender: Any) {
        let amt = (enterAmount.text! as NSString).floatValue
        let total = (amt + (amt * (percentageTip ?? 0)))
        
        value =  Float(total / (Float(split ?? 1)))
        
        
        
        performSegue(withIdentifier: "final", sender: self)
    }
    
    @IBAction func stepperIncreased(_ sender: UIStepper) {
        splitPerson.text = "\(sender.value)"
        split = Int(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! secondViewController
        destination.amt = value
        
        
    }
}

