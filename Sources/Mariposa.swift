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

    @Flag(
        name: .shortAndLong,
        help: "Print additional information."
    )
    var verbose = false

    mutating func run() async throws {
        print("\nUsing config: \(self.config.relativePath)")
        print("\nUsing feed: \(self.feed.relativePath)")

        let config = try MariposaConfig(filePath: self.config)
        print("\n\(config)")

        let jsonFeedClient = JSONFeedClient(filePath: self.feed)
        let latestPost = try jsonFeedClient.latestPost()!

        print("\n\(latestPost.preview)\n")
        print("Continue? (y/N)")

        guard let answer = readLine(), answer.isYes else {
            print("Aborted.")
            return
        }

        print("answer: \(String(describing: answer))")

        //let bluesky = BlueskyClient(credentials: config.bluesky)
        //let blueskyResult = try await bluesky.share(feedItem: latestPost)
        //print(blueskyResult ?? "failed")
        //
        //let mastodon = MastodonClient(credentials: config.mastodon)
        //let mastodonResult = try await mastodon.share(feedItem: latestPost)
        //print(mastodonResult?.json ?? "failed")
    }
}
