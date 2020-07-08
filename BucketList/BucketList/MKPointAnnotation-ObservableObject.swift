//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by RichK on 6/1/20.
//  Copyright © 2020 Rich Kummer. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        set {
            title = newValue
        }
    }
        
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        set {
            subtitle = newValue
        }
    }
    
}
