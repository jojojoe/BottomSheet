//
//  BinaryFloatingPoint+Helpers.swift
//  BottomSheet
//
//  Created by Mikhail Maslo on 14.11.2021.
//  Copyright © 2021 Joom. All rights reserved.
//
import Foundation
import UIKit

//
public extension BinaryFloatingPoint {
    func isAlmostEqual(to other: Self) -> Bool {
        Swift.abs(self - other) < Swift.abs(self + other).ulp
    }

    func isAlmostEqual(to other: Self, accuracy: Self) -> Bool {
        Swift.abs(self - other) < (Swift.abs(self + other) * accuracy).ulp
    }

    func isAlmostEqual(to other: Self, error: Self) -> Bool {
        Swift.abs(self - other) <= error
    }
}
