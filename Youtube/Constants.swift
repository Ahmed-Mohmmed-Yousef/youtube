//
//  Constants.swift
//  Youtube
//
//  Created by Ahmed on 5/27/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import Foundation


struct Constants {
    static var API_KEY = "AIzaSyDNevJuGXMae0MbO8IwG4Xl362nhsb_qzA"
    static var PLAYLIST_ID = "PLMRqhzcHGw1ZkH8RuznGMS0NZs0jWQQ5a"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
