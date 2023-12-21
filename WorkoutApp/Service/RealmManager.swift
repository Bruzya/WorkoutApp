//
//  RealmManager.swift
//  WorkoutApp
//
//  Created by Evgenii Mazrukho on 20.12.2023.
//

import RealmSwift

final class RealmManager {
    
    static let shared = RealmManager()
    private init() {}
    
    let realm = try! Realm()
    
    func saveWorkoutModel(_ model: WorkoutModel) {
        try! realm.write {
            realm.add(model)
        }
    }
}
