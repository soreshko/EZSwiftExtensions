//
//  BlockSwipe.swift
//
//
//  Created by Cem Olcay on 12/08/15.
//
//

#if os(iOS) || os(tvOS)

import UIKit

#if swift(>=4.2)
public typealias SwipeGestureRecognizerDirection = UISwipeGestureRecognizer.Direction
#else
public typealias SwipeGestureRecognizerDirection = UISwipeGestureRecognizerDirection
#endif

///Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
open class BlockSwipe: UISwipeGestureRecognizer {
    private var swipeAction: ((UISwipeGestureRecognizer) -> Void)?

    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }

    public convenience init (
        direction: SwipeGestureRecognizerDirection,
        fingerCount: Int = 1,
        action: ((UISwipeGestureRecognizer) -> Void)?) {
            self.init()
            self.direction = direction

            #if os(iOS)

            numberOfTouchesRequired = fingerCount

            #endif

            swipeAction = action
            addTarget(self, action: #selector(BlockSwipe.didSwipe(_:)))
    }

    @objc open func didSwipe (_ swipe: UISwipeGestureRecognizer) {
        swipeAction? (swipe)
    }
}

#endif
