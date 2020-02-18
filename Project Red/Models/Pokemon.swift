//
//  Pokemon.swift
//  Project Red
//
//  Created by Aaron Suarez on 1/25/20.
//  Copyright © 2020 Aaron Suarez. All rights reserved.
//

import Foundation
import RealmSwift

class Pokemon: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var count: Int = 0
    
    func choose<N: BinaryFloatingPoint, K: BinaryInteger>(_ n: N, _ k: K) -> Double {
        return Double(tgamma(Double(n + 1)))/Double(tgamma(Double(k + 1))*tgamma(Double(Double(n) - Double(k) + 1)))
    }
    
    func binomialDistributionPercentage(n: Double, p: Double, k: Int) -> Double {
        return pow(1 - p, n) * p * choose(n, k)
    }
    
    func catchPercentage(_ encounterRate: Double) -> Double {
        let n = Double(count)
        return binomialDistributionPercentage(n: n, p: encounterRate, k: 1)
    }
}
