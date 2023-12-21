//
//  WorkoutModel.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 20.12.2023.
//

import Foundation
import RealmSwift

final class WorkoutModel: Object {
    @Persisted var workoutDate: Date
    @Persisted var workoutNumberOfDay: Int = 0
    @Persisted var workoutName: String = "Unknown"
    @Persisted var workoutRepeat: Bool = true
    @Persisted var workoutSets: Int
    @Persisted var workoutReps: Int
    @Persisted var workoutTimer: Int
    @Persisted var workoutImage: Data?
    @Persisted var workoutStatus: Bool = false
}
