//
//  ViewController.swift
//  CountFRP
//
//  Created by Ken Tominaga on 6/8/16.
//  Copyright © 2016 ken0nek. All rights reserved.
//

import UIKit
import Bond

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var timesButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!

    let viewModel = CountViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib

        plusButton.bnd_tap
            .observe { [unowned self] event in
                self.viewModel.number.value += 1
            }

        minusButton.bnd_tap
            .observe { [unowned self] event in
                self.viewModel.number.value -= 1
        }

        timesButton.bnd_tap
            .observe { [unowned self] event in
                self.viewModel.number.value *= 2
        }

        divideButton.bnd_tap
            .observe { [unowned self] event in
                self.viewModel.number.value /= 2
        }

        clearButton.bnd_tap
            .observe { [unowned self] event in
                self.viewModel.number.value = 0
        }

        viewModel.text.bindTo(numberLabel.bnd_text)

        viewModel.textColor.bindTo(numberLabel.bnd_textColor)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

