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

let config = try MariposaConfig(filePath: "config.yml")
print(config)

let jsonFeedClient = JSONFeedClient(filePath: "feed.json")
let latestPost = try jsonFeedClient.latestPost()!
print(latestPost)

let bluesky = BlueskyClient(credentials: config.bluesky)
let blueskyResult = try await bluesky.share(feedItem: latestPost)
print(blueskyResult ?? "failed")

let mastodon = MastodonClient(credentials: config.mastodon)
let mastodonResult = try await mastodon.share(feedItem: latestPost)
print(mastodonResult?.json ?? "failed")
