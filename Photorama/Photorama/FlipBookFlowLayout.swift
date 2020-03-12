//
//  FlipBookFlowLayout.swift
//  Photorama
//
//  Created by Riley, Kyle M on 3/11/20.
//  Copyright © 2020 Riley, Kyle M. All rights reserved.
//

import UIKit

class FlipbookFlowLayout: UICollectionViewFlowLayout {

// Will Center the CollectionView's ImageView for Any Device
private lazy var setup : Void = {
    Swift.print(#function)
    
    let collectionView = self.collectionView!
    let topSafeAreaInset = collectionView.safeAreaInsets.top

    self.scrollDirection = .vertical
    self.sectionInsetReference = .fromContentInset
    self.minimumLineSpacing = 20.0
    self.minimumInteritemSpacing = 0.0
    self.sectionInset = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)

    let width = collectionView.bounds.width - self.sectionInset.left - self.sectionInset.right
    // Remeber to Subtract NavigationController Bar if Present
    let height = collectionView.bounds.height - self.sectionInset.top - topSafeAreaInset - self.sectionInset.bottom
    self.itemSize = CGSize(width: width, height: height)
    
    Swift.print("CollectionView Bounds Size : \(self.collectionView!.bounds.size)")
} ()

override func prepare() {
    // Call lazy closure (only happens once)
    _ = setup
}

// A Way to Snap to Images as Scrolling Occurs
override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
    var finalOffset = CGPoint()
    let height = self.sectionInset.top + self.itemSize.height
    
    switch velocity.y {
    case let y where y < 0 :
        finalOffset.y = height * ceil(proposedContentOffset.y / height)
    case let y where y == 0 :
        finalOffset.y = height * round(proposedContentOffset.y / height)
    default :
        finalOffset.y = height * floor(proposedContentOffset.y / height)
    }
    
    finalOffset.x = proposedContentOffset.x
    finalOffset.y -= self.collectionView!.safeAreaInsets.top
    
    return finalOffset
}

override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
}

override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let collectionView = self.collectionView, let allAttributes = super.layoutAttributesForElements(in: rect) else {
        return nil
    }
    
    // To Prevent Cache Error
    var modifiedAttributes : [UICollectionViewLayoutAttributes] = []
    
    for attributes in allAttributes {
        // Size of Visible Portion of CollectionView. Here, it will be the size of the iPhone Screen (Ex : iPhone 8 ~ 375, 667)
        let collectionCenter = collectionView.bounds.size.height / 2
        // Scrolling Downwards Increases Y-Offset. Scrolling Upwards Decreases Y-Offset
        let offset = collectionView.contentOffset.y
        // Center of Image Minus Y-Offset. Images Further Down Have Increased Normalized Center
        let normalizedCenter = attributes.center.y - offset
        
        /*
        Swift.print("Attributes : \(attributes)")
        Swift.print("CollectionCenter : \(collectionCenter)")
        Swift.print("Offset : \(offset)")
        Swift.print("Normalized Center : \(normalizedCenter)")
        Swift.print()
        */
        
        let maxDistance = self.sectionInset.top + self.itemSize.height
        let distanceFromCenter = min(collectionCenter - normalizedCenter, maxDistance)
        
        // Ratio will be a value between 0 and 1. View further from center will usually decrease to a 0 ratio
        let ratio = (maxDistance - abs(distanceFromCenter)) / maxDistance
        
        // As Scrolling is Occurring, Will Adjust Alpha of Outgoing/Incoming Image
        let alpha = ratio
        
        // Angle to Adjust Outgoing Image
        let angleToSet = distanceFromCenter / (collectionView.bounds.height / 2)
        
        // To Prevent Cache Error
        let modified = attributes.copy() as! UICollectionViewLayoutAttributes
        
        modified.alpha = alpha
        
        // For the Outgoing Image, Rotate Along Y-Axix. Creates a Vertical Page Flipping Animation
        if (modified.frame.minY - collectionView.safeAreaInsets.top) <= collectionView.contentOffset.y {
            // Enlarges Bottom of Image As it is Outgoing
            modified.transform3D.m34 = 1 / 500
            modified.transform3D = CATransform3DRotate(modified.transform3D, -angleToSet, 1, 0, 0)
        }
        
        modifiedAttributes.append(modified)
    }
    
    return modifiedAttributes
}
}
