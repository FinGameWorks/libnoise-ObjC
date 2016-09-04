//
//  Utils.swift
//  libNoiseSwift
//
//  Created by Fincher Justin on 16/8/31.
//  Copyright © 2016年 JustZht. All rights reserved.
//

import Foundation
import Surge

/**
 return (value * value * (3.0 - 2.0 * value)); for a Double
 
 - parameter value: Double
 
 - returns: Double:(value * value * (3.0 - 2.0 * value))
 */
public func MapCubicSCurve(value: Double) -> Double
{
    let valueSqr = Surge.mul([value], y: [value])[0]
    let valueMul = Surge.sub([3.0], y: Surge.mul([2.0], y: [value]))[0]
    return Surge.mul([valueSqr], y: [valueMul])[0]
}

/**
 return (value * value * (3.0 - 2.0 * value)); for an Array of Double
 
 - parameter value: [Double]
 
 - returns: [Double]:(value * value * (3.0 - 2.0 * value))
 */
public func MapCubicSCurve(value: [Double]) -> [Double]
{
    let valueSqrArray = Surge.mul(value, y: value)
    let valueMulArray = Surge.sub([Double](count: valueSqrArray.count, repeatedValue: 3.0), y: Surge.mul([Double](count: valueSqrArray.count, repeatedValue: 2.0), y: value))
    return Surge.mul(valueSqrArray, y: valueMulArray)
}