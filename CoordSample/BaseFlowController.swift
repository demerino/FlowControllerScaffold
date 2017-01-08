//
//  BaseFlowController.swift
//  CoordSample
//
//  Created by David Merino on 12/31/16.
//  Copyright © 2016 David Merino. All rights reserved.
//

import UIKit

extension Array {
    mutating func removeObject<T>(obj: T) where T : Equatable {
        self = self.filter({$0 as? T != obj})
    }
}

class BaseFlowController: NSObject {
    var navigationController:UINavigationController!
    var childFlows:Array = [Any]()
    
    public init(navigationController:UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
}
