//
//  Constants.swift
//  AINoteTaker
//
//  Created by Luong Manh on 11/3/25.
//
import Foundation

struct Constants {
    static let firstTimeLaunchApp = "firstTimeLaunchApp"
    static let hasCompletedIAP = "hasCompletedIAPOnboarding"
    static let hasCompletedOnboarding = "hasCompletedOnboarding"
    static let iapMonthly = "com.tgg.AINoteTaker.product.subscription.monthly"
    static let lifeTime = "com.tgg.AINoteTaker.product.lifetime"
    
    static let privacyURLString = "https://www.google.com/policies/privacy/"
    static let termsURLString = "https://www.google.com/policies/terms/"
    
    static let supabaseURL = "https://ryfefemoxlivlasdfute.supabase.co"
    static let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5ZmVmZW1veGxpdmxhc2RmdXRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTU3NjI3MzEsImV4cCI6MjA3MTMzODczMX0.p5p5p2x3wwKnRVJiBCZjb9G6ycOWYvo41STGRx6R9CA"
}

enum UserDefaultsKey {
    static let hasCompletedIAPOnboarding = "hasCompletedIAPOnboarding"
    static let defaultFoldersInitializedKey = "defaultFoldersInitialized"
}
