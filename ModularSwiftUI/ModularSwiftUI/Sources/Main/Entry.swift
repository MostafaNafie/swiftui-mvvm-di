//
//  Entry.swift
//
//
//  Created by Nafie on 20/10/2024.
//

import SwiftUI
import CharacterList
import Swinject

public class Entry {
    public static let shared = Entry()

    private var coordinator = Container.shared.characterCoordinator() as! CharacterCoordinator
    public lazy var rootView: some View = CharacterCoordinatorView(coordinator: coordinator)

    private init() {
        coordinator.start()
    }
}
