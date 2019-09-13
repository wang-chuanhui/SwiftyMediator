//
//  SwiftyMediator.swift
//  SwiftyMediator
//
//  Created by 王传辉 on 2019/9/6.
//

public enum Mediator {
    public static func `throws`<R: Requestor>(_ requestor: R) throws -> R.Target {
        return try ThrowsMediator.request(requestor)
    }
    public static func fatal<R: Requestor>(_ requestor: R) -> R.Target {
        return FatalMediator.request(requestor)
    }
    public static func defaultProvider<R: Requestor, P: Provider>(_ requestor: R, _ provider: P) -> R.Target where R.Target == P.Target {
        return DefaultProviderMediator(provider).request(requestor)
    }
}


