//
//  CountViewModel.swift
//  CountFRP
//
//  Created by Ken Tominaga on 6/8/16.
//  Copyright © 2016 ken0nek. All rights reserved.
//

import UIKit
import Bond

struct CountViewModel {
    let number = Observable<Int>(0)
    let text: EventProducer<String>
    let textColor: EventProducer<UIColor>

    init() {
        self.text = number
            .map { "\($0)" }

        self.textColor = number
            .map {
                if $0 > 0 {
                    return .blueColor()
                } else if $0 == 0 {
                    return .blackColor()
                } else {
                    return .redColor()
                }
        }
    }
}
