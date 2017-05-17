//
//  SubscriptionCell.swift
//  YoutubeApp
//
//  Created by npk on 5/17/17.
//  Copyright © 2017 TTung. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {

    override func fetchVideos() {
        
        ApiService.sharedInstance.fetchSubscriptionFeed { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
