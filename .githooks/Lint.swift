#!/usr/bin/env swift

import Foundation

// Get the binary path of the SwiftLint plugin
func swiftLintBinaryPath() throws -> String {
    // Get Project Name
    let currentDirectoryPath = FileManager.default.currentDirectoryPath
    let projectName = currentDirectoryPath.components(separatedBy: "/").last ?? "Unknown Project"

    // Get Project Directory in DerivedData
    let derivedDataPath = "\(NSHomeDirectory())/Library/Developer/Xcode/DerivedData"
    var projectDir = ""
    // Get all directories inside DerivedData
    let directories = try FileManager.default.contentsOfDirectory(atPath: derivedDataPath)
    for directory in directories {
        if directory.hasPrefix(projectName) {
            // Construct the full path to the build directory
            projectDir = "\(derivedDataPath)/\(directory)"
            break
        }
    }

    // Get SwiftLint Binary Path
    let swiftPackageDir = "\(projectDir)/SourcePackages/artifacts"
    let swiftLintDir = "\(swiftPackageDir)/swiftlintplugins/SwiftLintBinary/SwiftLintBinary.artifactbundle"
    let swiftLintBinaries = try FileManager.default.contentsOfDirectory(atPath: swiftLintDir)
    if let firstBinary = swiftLintBinaries.first(where: { $0.hasPrefix("swiftlint") }) {
        return "\(swiftLintDir)/\(firstBinary)/bin/swiftlint"
    }
    print("❌ swiftlint binary not found.")
    exit(1)
}

let swiftLintPath = try swiftLintBinaryPath()

// Function to run a shell command and capture its output
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

// Get list of staged Swift files
let changedFilesStaged = runShellCommand("git diff --staged --diff-filter=d --name-only -- '*.swift'")
let lintableFiles = changedFilesStaged.split(separator: "\n").map(String.init)

if lintableFiles.isEmpty {
    print("✅ No files to lint.")
    exit(0)
}

print("⚙️ Running swiftlint on staged Swift files...")
var exitCode = 0

// Lint each file
for file in lintableFiles {
    let lintResult = runShellCommand("\(swiftLintPath) lint --quiet \(file) | grep \"error\"")

    if !lintResult.isEmpty {
        print("🚨 Linting Errors")
        lintResult.split(separator: "\n").forEach { line in
            print("❌", line)
        }
        exitCode = 1
    }
}

if exitCode == 0 {
    print("✅ swiftlint completed successfully.")
}
exit(Int32(exitCode))
