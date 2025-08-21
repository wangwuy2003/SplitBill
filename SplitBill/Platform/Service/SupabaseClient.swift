//
//  SupabaseClient.swift
//  SplitBill
//
//  Created by MacMini A6 on 21/8/25.
//
import Foundation
import Supabase

struct Supabase {
    static let client = SupabaseClient(supabaseURL: URL(string: Constants.supabaseURL)!,
                                       supabaseKey: Constants.supabaseKey)
}
