//
//  PhotoCoreDataProperties.swift
//  Photorama
//
//  Created by Riley, Kyle M on 3/11/20.
//  Copyright © 2020 Riley, Kyle M. All rights reserved.
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var dateTaken: NSDate?
    @NSManaged public var photoID: String?
    @NSManaged public var remoteURL: NSURL?
    @NSManaged public var title: String?
    @NSManaged public var totalViews: Int64
    @NSManaged public var tags: NSSet?

}

// MARK: Generated accessors for tags
extension Photo {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}