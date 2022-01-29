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
 Snitch is a handy library to access useful information
 about your application from the Home Screen.
 
 To snitch the information just call `snitch` function
 of this structure and it will add Home Screen quick action menu
 with the information according to the passed options.
 */
public struct Snitch {
    public let options: [Option]
    
    /**
     An array with the `UIApplicationShortcutItem` instances.
     
     This array contains shortcut items prepared to be displayed on the Home Screen.
     Use this variable if you already have shortcut items in your app.
     */
    public var shortcutItems: [UIApplicationShortcutItem] {
        return options.compactMap { option in
            guard let data = option.fetch() else { return nil }
            
            let title: String = "\(option.title): \(data)"
            let icon: UIApplicationShortcutIcon? = option.icon
            
            return .init(
                type: option.rawValue,
                localizedTitle: title,
                localizedSubtitle: nil,
                icon: icon
            )
        }
    }
    
    /**
     Function to tell the `Snitch` to snitch the data according to the passed options.
     
     You may call this function at any point in your app,
     but the best place to call it is in `sceneWillResignActive(_:)`,
     because during the transition to a background state is a good time
     to update any dynamic quick actions, so the system will execute
     code inside the function right before user returns to the Home Screen.
     */
    public func snitch() {
        UIApplication.shared.shortcutItems = self.shortcutItems
    }
    
    /**
     Creates an instance of the `Snitch` structure.
     
     - Parameters:
        - options: Options that you want to show in Quick Action Menu.
     */
    public init(options: [Option] = [.size, .version]) {
        self.options = options
    }
}
