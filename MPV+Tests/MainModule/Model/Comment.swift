//
//  Comment.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import Foundation

struct Comment: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
