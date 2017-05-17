//
//  Video.swift
//  YoutubeClone
//
//  Created by Nguyễn Phúc Khánh on 5/2/17.
//  Copyright © 2017 Nguyễn Phúc Khánh. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: NSNumber?
    var uploadDate: NSDate?
    var duration: NSNumber?
    
    var channel: Channel?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "channel" {
            //custome channel setup
            self.channel = Channel()
            
            self.channel?.setValuesForKeys(value as! [String: AnyObject])
            
        } else {
            super.setValue(Any?.self, forKey: key)

        }
    }
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dictionary)
    }
}

class Channel: NSObject {
    var name: String?
    var profile_image_name: String?
}

