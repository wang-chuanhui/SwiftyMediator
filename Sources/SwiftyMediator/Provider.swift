//
//  Provider.swift
//  SwiftyMediator
//
//  Created by 王传辉 on 2019/9/6.
//

public protocol InternalProvider {
    func providAny() -> Any
}


public protocol Provider: InternalProvider {
    associatedtype Target
    func providTarget() -> Target
}


public extension InternalProvider where Self: Provider {
    func providAny() -> Any {
        return providTarget()
    }
}
