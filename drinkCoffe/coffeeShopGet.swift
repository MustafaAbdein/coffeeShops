//
//  coffeeShopGet.swift
//  drinkCoffe
//
//  Created by Mostafa on 10/5/18.
//  Copyright © 2018 Mostafa. All rights reserved.
//

import Foundation


struct coffeeShopGet: Codable {
    
    let meta: Meta
    let response: Response
}


struct Meta: Codable {
    let code: Int
    let requestId: String
 }
struct Response: Codable {
    let group: Group
   
  }
struct Group: Codable {
    let results:[Result]
}

struct Result: Codable {
    let displayType : String
    let venue : Venue

}
struct Venue: Codable {
    let id : String
    let name: String
    let location : Location
      let categories : [Categories]
    
}
struct Location: Codable {
   let address : String?
   let crossStreet : String?
    let lat : Double
    let lng : Double
   let labeledLatLngs : [LabeledLatLngs]
    let distance :Int
   let postalCode : String?
   let cc: String
   let city: String?
   let state: String?
   let country: String?
   let formattedAddress :[String]?
}
struct LabeledLatLngs : Codable {
  let label: String
   let lat: Double
   let lng: Double
}
struct Categories : Codable {
   let id : String
   let name: String
   let pluralName: String
   let shortName: String
   let icon : Icon
    let primary : Bool
}
struct Icon:Codable {
   let prefix: String
   let suffix: String
}

/*
 {
 "meta": {
 "code": 200,
 "requestId": "5bbb8c5d351e3d1694c6a18c"
 },
 "response": {
 "group": {
 "results": [
 {
 "displayType": "venue",
 "venue": {
 "id": "51f04ac6498ebb25dcd65684",
 "name": "Cilantro",
 "contact": {},
 "location": {
 "address": "Tolba Oweida St",
 "crossStreet": "El Qawmia",
 "lat": 30.59064941225811,
 "lng": 31.489376993419658,
 "labeledLatLngs": [
 {
 "label": "display",
 "lat": 30.59064941225811,
 "lng": 31.489376993419658
 }
 ],
 "distance": 116,
 "cc": "EG",
 "city": "Zagazig",
 "state": "Eastern",
 "country": "Egypt",
 "formattedAddress": [
 "Tolba Oweida St (El Qawmia)",
 "Zagazig",
 "Eastern",
 "Egypt"
 ]
 },
 "categories": [
 {
 "id": "4bf58dd8d48988d16d941735",
 "name": "Café",
 "pluralName": "Cafés",
 "shortName": "Café",
 "icon": {
 "prefix": "https://ss3.4sqi.net/img/categories_v2/food/cafe_",
 "suffix": ".png"
 },
 "primary": true
 }
 ],
 "verified": false,
 "stats": {
 "tipCount": 0,
 "usersCount": 0,
 "checkinsCount": 0,
 "visitsCount": 0
 },
 "dislike": false,
 "ok": false,
 "beenHere": {
 "count": 0,
 "lastCheckinExpiredAt": 0,
 "marked": false,
 "unconfirmedCount": 0
 }
 },
 "id": "5bbb8c5dde3bbf002b522169",
 "photo": {
 "id": "51f09879498ea29875166996",
 "createdAt": 1374722169,
 "prefix": "https://igx.4sqi.net/img/general/",
 "suffix": "/44034390_N_jlm9mq5dh9iyS3tX1x833NAdQ3cXA-zRdukdkrygw.jpg",
 "width": 960,
 "height": 720,
 "visibility": "public"
 },
 "snippets": {
 "count": 1,
 "items": [
 {
 "detail": {
 "type": "tip",
 "object": {
 "id": "5409c057498ec37d58f93073",
 "createdAt": 1409925207,
 "text": "Cheese cake is very delicious also the atmosphere and decorations are very good",
 "type": "user",
 "canonicalUrl": "https://foursquare.com/item/5409c057498ec37d58f93073",
 "likes": {
 "count": 1,
 "groups": [],
 "summary": "1 like"
 },
 "logView": true,
 "agreeCount": 1,
 "disagreeCount": 0,
 "todo": {
 "count": 0
 },
 "user": {
 "id": "18697276",
 "firstName": "Ahmed",
 "lastName": "Almesalamy",
 "gender": "male",
 "photo": {
 "prefix": "https://igx.4sqi.net/img/user/",
 "suffix": "/B4M0AHRIUSGOERRM.jpg"
 }
 }
 }
 }
 }
 ]
 }
 }
 ],
 "totalResults": 10
 },
 "context": {
 "searchLocationNearYou": true,
 "searchLocationMapBounds": false,
 "searchLocationType": "NearYou",
 "currentLocation": {
 "what": "",
 "where": "",
 "feature": {
 "cc": "EG",
 "name": "Zagazig",
 "displayName": "Zagazig, Eastern",
 "woeType": 7,
 "slug": "az-zaqaziq-egypt",
 "id": "geonameid:359493",
 "longId": "72057594038287429",
 "geometry": {
 "center": {
 "lat": 30.58768,
 "lng": 31.502
 },
 "bounds": {
 "ne": {
 "lat": 30.603048,
 "lng": 31.509991
 },
 "sw": {
 "lat": 30.569651,
 "lng": 31.485443
 }
 }
 }
 },
 "parents": []
 },
 "boundsSummaryRadius": 10000,
 "relatedNeighborhoods": [],
 "geoParams": {
 "ll": "30.589741,31.488774",
 "radius": "10000"
 },
 "geoBounds": {
 "circle": {
 "center": {
 "lat": 30.589741,
 "lng": 31.488774
 },
 "radius": 10000
 }
 }
 }
 }
 }*/
