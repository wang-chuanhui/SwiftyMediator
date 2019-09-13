//
//  SwiftyMediator.swift
//  SwiftyMediator
//
//  Created by 王传辉 on 2019/9/6.
//

public protocol MediatorType {
    
    func request<R: Requestor>(_ requestor: R) throws -> R.Target
    
}

public extension MediatorType {
    func request<R: Requestor>(_ requestor: R) throws -> R.Target {
        return try internalRequest(requestor)
    }
}

extension MediatorType {
    func internalRequest<R: Requestor>(_ requestor: R) throws -> R.Target {
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

public enum Mediator: MediatorType {
    
    public static func request<R: Requestor>(_ requestor: R) throws -> R.Target {
        return try StructMediator().request(requestor)
    }
    
    private struct StructMediator: MediatorType {
        
    }
    
}


