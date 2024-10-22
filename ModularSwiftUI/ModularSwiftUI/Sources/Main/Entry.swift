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

    private lazy var coordinator = Container.shared.resolve(CharacterCoordinating.self)! as! CharacterCoordinator
    public lazy var rootView: some View = CharacterCoordinatorView(coordinator: coordinator)

    private init() {
        Container.registerMainDependencies()
        coordinator.start()
    }
}
