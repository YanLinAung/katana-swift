//
//  Saga.swift
//  Katana
//
//  Created by Luca Querella on 29/08/16.
//  Copyright © 2016 Bending Spoons. All rights reserved.
//

import Foundation

public func sagaMiddleware<R: Reducer>(reducer _: R.Type) -> StoreMiddleware<R> {
  return { store in
    return { next in
      return { action in
        
        if let action = action as? AnyActionWithSideEffect {
          type(of: action).anySideEffect(action: action, getState: store.getState, dispatch: store.dispatch)
        }

        next(action)
      }
    }
  }
}