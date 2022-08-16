//
//  Injected.swift
//  Router
//
//  Created by dave on 17/07/22.
//

import Foundation

@propertyWrapper
public struct Injected<T> {

    private let keyPath: KeyPath<DependencyInjection, T>
    
    public var wrappedValue: T {
        DependencyInjection.assembly[keyPath: keyPath]
    }
    
    init(_ keyPath: KeyPath<DependencyInjection, T>) {
        self.keyPath = keyPath
    }
}
