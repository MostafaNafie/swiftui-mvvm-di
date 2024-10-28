//
//  Entry.swift
//
//
//  Created by Nafie on 20/10/2024.
//

import SwiftUI

public class Entry {
    public var rootView: CharacterCoordinatorView

    @MainActor
    public init() {
        rootView = CharacterCoordinatorView(
            coordinator: Container.shared.characterCoordinator() as! CharacterCoordinator
        )
    }
}
