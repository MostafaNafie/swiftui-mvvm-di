#!/usr/bin/env swift

import Foundation

// Run a shell command and capture the output
@discardableResult
func runShellCommand(_ command: String) -> String {
    let process = Process()
    process.launchPath = "/bin/bash"
    process.arguments = ["-c", command]

    let pipe = Pipe()
    process.standardOutput = pipe
    process.launch()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    process.waitUntilExit()

    return String(data: data, encoding: .utf8) ?? ""
}

// Find all Swift files that are staged for commit
let output = runShellCommand("git diff --staged --name-only --diff-filter=d | grep -E '\\.swift$'")
guard !output.isEmpty else {
    print("✅ No files to format.")
    exit(0)  // Exit if there are no Swift files to format
}

print("⚙️ Running swift-format on staged Swift files...")
let files = output.split(separator: "\n").map(String.init)
for file in files {
    // Run swift-format on each file
    runShellCommand("swift format --in-place \(file)")
    // Re-add the formatted file to the staging area
    runShellCommand("git add \(file)")
}

print("✅ swift-format completed successfully.")
exit(0)
