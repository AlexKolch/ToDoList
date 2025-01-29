//
//  TaskEntity+CoreDataProperties.swift
//  ToDoTasks
//
//  Created by Алексей Колыченков on 28.01.2025.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var id: String
    @NSManaged public var isCompleted: Bool
    @NSManaged public var title: String
    @NSManaged public var order: Int64 //порядковый номер в массиве

}

extension TaskEntity : Identifiable {

}
