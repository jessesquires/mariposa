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

let blueskyCredentials = BlueskyCredentials(
    email: "email",
    password: "password"
)
let bluesky = BlueskyClient(credentials: blueskyCredentials)
let blueskyResult = try await bluesky.share(feedItem: latestPost)
print(blueskyResult ?? "failed")

let mastodonCredentials = MastodonCredentials(
    instanceName: "mastodon.social",
    accessToken: "token"
)
let mastodon = MastodonClient(credentials: mastodonCredentials)
let mastodonResult = try await mastodon.share(feedItem: latestPost)
print(mastodonResult?.json ?? "failed")
