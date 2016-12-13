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

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"
