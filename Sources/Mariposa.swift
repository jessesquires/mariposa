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
import ArgumentParser

@main
struct Mariposa: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Automate posting JSON feeds to Bluesky and Mastodon."
    )

    @Option(
        name: .shortAndLong,
        help: "YAML configuration file.",
        transform: MariposaConfig.init(filePath:)
    )
    var config: MariposaConfig

    @Option(
        name: .shortAndLong,
        help: "JSON feed file.",
        transform: JSONFeed.init(filePath:)
    )
    var feed: JSONFeed

    mutating func run() async throws {
        guard let latestPost = self.feed.latest else {
            print("\n🚫 No posts found in feed.")
            return
        }

        print("""
        
        👀 Preview:
            \(latestPost.title)
            \(latestPost.url)
        
        """)

        print("➡️  Continue? (y/N):", terminator: " ")
        guard let shouldContinue = readLine(), shouldContinue.isYes else {
            print("⚠️  Aborted.")
            return
        }

        try await self.shareToBluesky(latestPost: latestPost)
        try await self.shareToMastodon(latestPost: latestPost)

        print("\n🎉 Finished.")
    }

    func shareToBluesky(latestPost: JSONFeedItem) async throws {
        print("\nPosting to Bluesky...", terminator: " ")
        let bluesky = BlueskyClient(credentials: self.config.bluesky)
        guard let blueskyResult = try await bluesky.share(feedItem: latestPost) else {
            printFailure()
            return
        }
        printSuccess()
        print(blueskyResult.profileURL)
    }

    func shareToMastodon(latestPost: JSONFeedItem) async throws {
        print("\nPosting to Mastodon...", terminator: " ")
        let mastodon = MastodonClient(credentials: self.config.mastodon)
        guard let mastodonResult = try await mastodon.share(feedItem: latestPost) else {
            printFailure()
            return
        }
        printSuccess()
        print(mastodonResult.url)
    }
}
