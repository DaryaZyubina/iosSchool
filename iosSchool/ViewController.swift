//
//  ViewController.swift
//  iosSchool
//
//  Created by Student 1 on 13.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newGen = ColorGenerator(alpha: 1)
        newGen.alpha = 0.5
        var color = Color(red: 1, green: 1, blue: 1, alpha: .bright)    //автоматически создал инициализатор только для структуры!
        color.description()
        // Do any additional setup after loading the view.
        
        var bri = Brightness(rawValue: 1)
    }


}

