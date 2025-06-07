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
        transform: URL.init(fileURLWithPath:)
    )
    var config: URL

    @Option(
        name: .shortAndLong,
        help: "JSON feed file.",
        transform: URL.init(fileURLWithPath:)
    )
    var feed: URL

    mutating func run() async throws {
        let config = try MariposaConfig(filePath: self.config)
        let feed = JSONFeedClient(filePath: self.feed)

        let latestPost = try feed.latestPost()!
        print("\n\(latestPost.preview)\n")
        print("➡️  Continue? (y/N)")

        guard let shouldContinue = readLine(), shouldContinue.isYes else {
            print("⚠️  Aborted.\n")
            return
        }

        print("\nPosting to Bluesky...")
        let bluesky = BlueskyClient(credentials: config.bluesky)
        guard let blueskyResult = try await bluesky.share(feedItem: latestPost) else {
            print("🚫 Bluesky failed.")
            return
        }
        print("✅ Bluesky succeeded.")
        print("https://bsky.app/profile/\(blueskyResult.session.handle)")

        print("\nPosting to Mastodon...")
        let mastodon = MastodonClient(credentials: config.mastodon)
        guard let mastodonResult = try await mastodon.share(feedItem: latestPost) else {
            print("🚫 Mastodon failed.")
            return
        }
        print("✅ Mastodon succeeded.")
        let _ = mastodonResult
        // TODO:

        print("\n🎉 Finished.\n")
    }
}
