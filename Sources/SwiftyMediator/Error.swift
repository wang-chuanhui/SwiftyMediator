//
//  Error.swift
//  SwiftyMediator
//
//  Created by 王传辉 on 2019/9/6.
//


public struct NotProviderError: Error {
    
    let requestor: Any
    
    init<R: Requestor>(_ requestor: R) {
        self.requestor = requestor
    }
    
}

extension NotProviderError: CustomStringConvertible {
    public var description: String {
        return "\(requestor)不是Provider类型"
    }
}

public struct NotSpecifiedTargetError: Error {
    
    let requestor: Any
    let any: Any
    let type: Any.Type
    
    init<R: Requestor>(_ requestor: R, any: Any) {
        self.requestor = requestor
        self.any = any
        self.type = R.Target.self
    }
    
}

extension NotSpecifiedTargetError: CustomStringConvertible {
    public var description: String {
        return "\(requestor)提供的对象(\(Swift.type(of: any)):\(any))不是\(self.type)类型"
    }
}
