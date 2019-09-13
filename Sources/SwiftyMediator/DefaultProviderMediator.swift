//
//  DefaultProviderMediator.swift
//  SwiftyMediator
//
//  Created by 王传辉 on 2019/9/6.
//

public protocol DefaultProviderMediatorType: MediatorType {
    associatedtype DefaultProvider: Provider
    var provider: DefaultProvider {get}
}

public extension DefaultProviderMediatorType {
    func request<R : Requestor>(_ requestor: R) -> R.Target where R.Target == DefaultProvider.Target {
        do {
            let result = try internalRequest(requestor)
            return result
        } catch {
            return provider.providTarget()
        }
    }
}

public struct DefaultProviderMediator<DefaultProvider: Provider>: DefaultProviderMediatorType {
    public var provider: DefaultProvider {
        return internalProvider
    }
    let internalProvider: DefaultProvider
    
    public init(_ provider: DefaultProvider) {
        self.internalProvider = provider
    }
    
}
