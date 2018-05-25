//
//  TrackRealm.swift
//  SwiftRadio
//
//  Created by Tyler Boudreau on 2018-05-25.
//  Copyright © 2018 matthewfecher.com. All rights reserved.
//

import Foundation
import RealmSwift

class RealmTrack: Object {
    
    @objc dynamic var artist: String?
    @objc dynamic var songTitle: String?
}
