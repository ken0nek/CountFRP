//
//  CountViewModel.swift
//  CountFRP
//
//  Created by Ken Tominaga on 6/8/16.
//  Copyright © 2016 ken0nek. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

struct CountViewModel {
    let number = Observable<Int>(0)
    let text: Signal<String, NoError>
    let textColor: Signal<UIColor, NoError>

    init() {
        self.text = number
            .map { "\($0)" }

        self.textColor = number
            .map {
                if $0 > 0 {
                    return .blue
                } else if $0 == 0 {
                    return .black
                } else {
                    return .red
                }
        }
    }
}
