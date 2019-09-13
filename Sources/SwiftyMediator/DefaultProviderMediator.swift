//
//  DefaultProviderMediator.swift
//  SwiftyMediator
//
//  Created by 王传辉 on 2019/9/6.
//

public struct DefaultProviderMediator<DefaultProvider: Provider> {
    let provider: DefaultProvider
    
    public init(_ provider: DefaultProvider) {
        self.provider = provider
    }
    
    func request<R : Requestor>(_ requestor: R) -> R.Target where R.Target == DefaultProvider.Target {
        do {
            let result = try Mediator.throws(requestor)
            return result
        } catch {
            return provider.providTarget()
        }
    }
}
