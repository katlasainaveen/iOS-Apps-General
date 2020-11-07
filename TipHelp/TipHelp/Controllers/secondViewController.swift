//
//  secondViewController.swift
//  TipHelp
//
//  Created by Sai Naveen Katla on 07/09/20.
//  Copyright © 2020 Sai Naveen Katla. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    var amt: Float = 0.0
    
    @IBOutlet weak var amtLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amtLbl.text = "\(String(describing: amt))"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
