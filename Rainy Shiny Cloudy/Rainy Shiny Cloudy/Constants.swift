//
//  Constants.swift
//  Rainy Shiny Cloudy
//
//  Created by Miguel Herrero on 13/12/16.
//  Copyright © 2016 Miguel Herrero. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "20966562cd1e9b1ec0855ad491e2d3df"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)40.42\(LONGITUDE)-3.7\(APP_ID)\(API_KEY)"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=40.42&lon=-3.7&cnt=10&mode=json&appid=20966562cd1e9b1ec0855ad491e2d3df"
