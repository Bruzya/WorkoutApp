//
//  Int + ext.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 19.12.2023.
//

import Foundation

extension Int {
    func getTimeFromSecond() -> String {
        
        if self / 60 == 0 {
            return "\(self % 60) sec"
        }
        
        if self % 60 == 0 {
            return "\(self / 60) min"
        }
        
        return "\(self / 60) min \(self % 60) sec"
    }
}
