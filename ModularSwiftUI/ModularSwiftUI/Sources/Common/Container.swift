//
//  Container.swift
//
//
//  Created by Nafie on 20/10/2024.
//

@_exported import Factory

public extension Container {
    // Promise that the protocol defined here will be fulfilled later. (Check autoRegister function)
    var httpClient: Factory<HTTPClient?> { promised().singleton }
}
