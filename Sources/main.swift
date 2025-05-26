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

let credentials = BlueskyCredentials(
    email: "",
    password: ""
)
let createSessionRequest = try URLRequest.blueskyCreateSession(credentials: credentials)
let (sessionData, sessionResponse) = try await URLSession.shared.data(for: createSessionRequest)
let session = try JSONDecoder().decode(BlueskySession.self, from: sessionData)

print("Response: \(sessionResponse)")
print("JSON: \(session)")

let post = BlueskyRecord(text: "Testing automation")
let createPostRequest = try URLRequest.blueskyCreatePost(session: session, record: post)
let (postData, postResponse) = try await URLSession.shared.data(for: createPostRequest)
let recordCreated = try JSONDecoder().decode(BlueskyRecordCreated.self, from: postData)

print("Response: \(postResponse)")
print("JSON: \(recordCreated)")
