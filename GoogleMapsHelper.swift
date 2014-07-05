//
//  GoogleMapsHelper.swift
//  ChitownBikes
//
//  Created by Rob Timpone on 7/5/14.
//  Copyright (c) 2014 Rob Timpone. All rights reserved.
//

import CoreLocation

enum TransportationMode: String {
    case Driving = "driving"
    case Transit = "transit"
    case Bicycling = "bicycling"
    case Walking = "walking"
}

struct GoogleMapsHelper {
    
    static let baseUrl = "comgooglemaps-x-callback://"
    
    ///Returns true if the current device can open a google maps url
    static func canOpenGoogleMaps() -> Bool {
        return UIApplication.sharedApplication().canOpenURL(NSURL(string: baseUrl))
    }
    
    ///A url to open google maps with optional start/end coordinates, transportation mode, and callback button
    static func urlWithStartingLocation(possibleStart: CLLocationCoordinate2D?, destination possibleDestination: CLLocationCoordinate2D?, transportationMode possibleMode: TransportationMode?, showCallback shouldShowCallback: Bool) -> NSURL {
        
        //the base google maps url with callback support
        var urlString = "comgooglemaps-x-callback://"
        
        //a counter to keep track of the number of query parameters that have been added to the url
        var queryParameters = 0
        
        //a nested function to add a query parameter to the url string
        func addParameter(parameter: String) {
            let separatorString = queryParameters == 0 ? "?" : "&"
            ++queryParameters
            
            urlString += separatorString
            urlString += parameter
        }
        
        //add a starting location if one was provided
        if let start = possibleStart {
            addParameter("saddr=\(start.latitude),\(start.longitude)")
        }
        
        //add a destination if one was provided
        if let destination = possibleDestination {
            addParameter("daddr=\(destination.latitude),\(destination.longitude)")
        }

        //specify directions mode if one was provided
        if let mode = possibleMode {
            addParameter("directionsmode=\(mode.toRaw())")
        }

        //add a callback button to google maps if should show callback
        if shouldShowCallback {
            let appName = NSBundle.mainBundle().infoDictionary["CFBundleName"] as String
            addParameter("x-success=chitownbikes://resume=true&x-source=\(appName)")
        }

        return NSURL(string: urlString)
    }
    
}