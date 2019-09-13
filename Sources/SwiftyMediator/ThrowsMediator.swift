//
//  ThrowsMediator.swift
//  SwiftyMediator
//
//  Created by 王传辉 on 2019/9/13.
//

public enum ThrowsMediator {
    
    public static func request<R: Requestor>(_ requestor: R) throws -> R.Target {
        guard let internalProvider = requestor as? InternalProvider else {
            throw NotProviderError(requestor)
        }
        let any = internalProvider.providAny()
        guard let object = any as? R.Target else {
            throw NotSpecifiedTargetError(requestor, any: any)
        }
        return object
    }
    
}
