//
//  View+isHidden.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import SwiftUI

public extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
