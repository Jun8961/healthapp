//
//  ViewController.swift
//  kanschool
//
//  Created by 島田淳一 on 2020/03/15.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func protein(_ sender: UIButton) {
        performSegue(withIdentifier: "next", sender: 1)
    }
    
    @IBAction func water(_ sender: UIButton) {
        performSegue(withIdentifier: "next", sender: 2)
    }
    
    @IBAction func medicine(_ sender: UIButton) {
        performSegue(withIdentifier: "next", sender: 3)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TimeViewController
        vc.category = sender as! Int
    }
}

