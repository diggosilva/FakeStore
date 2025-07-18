//
//  StatefulViewModel.swift
//  FakeStore
//
//  Created by Diggo Silva on 17/07/25.
//

import Combine

protocol StatefulViewModel {
    associatedtype State
    var statePublisher: AnyPublisher<State, Never> { get }
}
