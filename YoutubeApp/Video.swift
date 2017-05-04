//
//  Video.swift
//  YoutubeClone
//
//  Created by Nguyễn Phúc Khánh on 5/2/17.
//  Copyright © 2017 Nguyễn Phúc Khánh. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
    
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
