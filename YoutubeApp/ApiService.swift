//
//  ApiService.swift
//  YoutubeApp
//
//  Created by npk on 5/11/17.
//  Copyright © 2017 TTung. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(_ completion: @escaping ([Video]) -> ()) {
        
        fetchFeedForUrlString(urlString: "\(baseUrl)/home_num_likes.json", completion: completion)
    }
    
    func fetchTrendingFeed(_ completion: @escaping ([Video]) -> ()) {
        
        fetchFeedForUrlString(urlString: "\(baseUrl)/trending.json", completion: completion)     }
    
    
    func fetchSubscriptionFeed(_ completion: @escaping ([Video]) -> ()) {
        
        fetchFeedForUrlString(urlString: "\(baseUrl)/subscriptions.json",completion: completion)
    }
    
    func fetchFeedForUrlString(urlString: String, completion: @escaping ([Video]) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            do {
                if let unwrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: AnyObject]]  {
                    
                    DispatchQueue.main.async(execute: {
                        completion(jsonDictionaries.map({return Video(dictionary: $0)}))
                    })
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }) .resume()
    }
}

//let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//
//var videos = [Video]()
//
//for dictionary in json as! [[String: AnyObject]] {
//
//    let video = Video()
//    video.title = dictionary["title"] as? String
//    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
//
//    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
//
//    let channel = Channel()
//    channel.name = channelDictionary["name"] as? String
//    channel.profileImageName = channelDictionary["profile_image_name"] as? String
//
//    video.channel = channel
//
//    videos.append(video)
//}
//
//DispatchQueue.main.async(execute: {
//    completion(videos)
//})

//let numbersArray = [1, 2, 3]
//let doubleNumbersArray = numbersArray.map({return $0 * 2})
//let stringsArray = numbersArray.map({return "\($0 * 2)"})
//print(stringsArray)
//
//var videos = [Video]()
//
//for dictionary in jsonDictionaries as! [[String: AnyObject]] {
//    let video = Video(dictionary: dictionary)
//    videos.append(video)
//}


