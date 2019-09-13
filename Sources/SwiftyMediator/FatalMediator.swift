//
//  FatalErrorMediator.swift
//  SwiftyMediator
//
//  Created by 王传辉 on 2019/9/13.
//

public enum FatalMediator {
    public static func request<R: Requestor>(_ requestor: R) -> R.Target {
        do {
            let target = try Mediator.throws(requestor)
            return target
        } catch {
            fatalError("\(error)")
        }
    }
}
