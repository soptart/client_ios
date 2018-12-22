//
//  Storyboard.swift
//  Artoo
//


import UIKit

class Storyboard {
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
    let artStoryboard = UIStoryboard(name: "Art", bundle: nil)
    let exhibitStoryboard = UIStoryboard(name: "Exhibit", bundle: nil)
    let mypageStoryboard = UIStoryboard(name: "Mypage", bundle: nil)
    
    struct StaticInstance {
        static var instance: Storyboard?
    }
    
    class func shared() -> Storyboard {
        if StaticInstance.instance == nil {
            StaticInstance.instance = Storyboard()
        }
        return StaticInstance.instance!
    }
}
