#!/usr/bin/swift
//
//  Created by Jesse Squires.
//  https://www.jessesquires.com
//
//  GitHub
//  https://github.com/jessesquires/mariposa
//
//  Copyright © 2025-present Jesse Squires
//

import Foundation

let jsonFeedClient = JSONFeedClient(filePath: "feed.json")
let latestPost = try jsonFeedClient.latestPost()!
print(latestPost)

let credentials = BlueskyCredentials(
    email: "email",
    password: "password"
)
let bluesky = BlueskyClient(credentials: credentials)
let result = try await bluesky.share(feedItem: latestPost)

print(result ?? "failed")
