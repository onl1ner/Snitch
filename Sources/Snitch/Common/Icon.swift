//
//  MIT License
//
//  Copyright (c) 2022 Tamerlan Satualdypov
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

/**
 An icon that associated with the option
 passed to the `Snitch`.
 */
public struct Icon {
    /**
     Kind that is used to determine
     the catalog of the image to show.
     */
    public enum Kind: String {
        case system
        case custom
    }
    
    public let name: String
    public let kind: Kind
    
    /**
     An `UIApplicationShortcutIcon` instance depending
     on the passed `kind` and `name`.
     */
    public var shortcutIcon: UIApplicationShortcutIcon {
        switch kind {
            case .system:
                return .init(systemImageName: name)
            case .custom:
                return .init(templateImageName: name)
        }
    }
    
    /**
     Creates an icon with provided name and kind.
     
     - Parameters:
         - name: Name of the image that will be used as an icon.
         - kind: Kind of the image that associated with its catalog.
     */
    public init(name: String, kind: Kind) {
        self.name = name
        self.kind = kind
    }
}
