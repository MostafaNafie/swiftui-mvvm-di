//
//  View+errorAlert.swift
//  
//
//  Created by Mostafa Nafie on 01/10/2022.
//

import SwiftUI

public extension View {
    func errorAlert(error: Binding<Error?>, buttonTitle: String = "OK") -> some View {
        let localizedAlertError = LocalizedAlertError(error: error.wrappedValue)
        return alert(isPresented: .constant(localizedAlertError != nil),
                     error: localizedAlertError) { _ in
            Button(buttonTitle) {
                error.wrappedValue = nil
            }
        } message: { error in
            Text(error.recoverySuggestion ?? "")
        }
    }
}

struct LocalizedAlertError: LocalizedError {
    let underlyingError: Error
    
    var errorDescription: String? {
        "\(type(of: underlyingError))"
    }
    var recoverySuggestion: String? {
        underlyingError.localizedDescription
    }

    init?(error: Error?) {
        guard let error = error else { return nil }
        underlyingError = error
    }
}
