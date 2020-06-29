//
//  UIApplication+Extension.swift
//  Pokemon
//
//  Created by Marco André Marinho Lopes on 29/06/2020.
//  Copyright © 2020 Marco Lopes. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
