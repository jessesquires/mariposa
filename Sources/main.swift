#!/usr/bin/swift
//
//  GitHub
//  https://github.com/jessesquires/mariposa
//
//  Copyright © 2025 Jesse Squires
//  https://www.jessesquires.com
//

import Foundation

let createSessionRequest = try URLRequest.blueskyCreateSession(
    email: "",
    password: ""
)

print("Sending request...")

let (data, response) = try await URLSession.shared.data(for: createSessionRequest)

let blueskySession = try JSONDecoder().decode(BlueskySession.self, from: data)

print("Response: \(response)")
print("JSON: \(blueskySession)")
