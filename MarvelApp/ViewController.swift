//
//  ViewController.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 03/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let a = CharacterProvider()

        a.getCharacters(offset: 0) { (result) in
            switch result {
            case .success(let characters):
                print(characters)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

