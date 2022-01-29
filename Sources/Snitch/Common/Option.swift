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
 An option that will be shown in the
 Home Screen quick action menu.
 */
public enum Option {
    /**
     Option that will snitch the size of the application.
     
     Size fetcher will calculate the size of the application
     depending on the sizes of the following directories:
     document, libraries and temporary files.
     */
    case size
    
    /**
     Option that will snitch the version of the application.
     
     Version fetcher will fetch the user-visible string for
     the version of the bundle.
     */
    case version
    
    /**
     Option with the custom fetcher.
     
     You may create your own fetcher and pass it
     to the `Snitch.snitch(options:)` function
     so it will be shown along with the other info.
     */
    case custom(Fetcher)
    
    private var fetcher: Fetcher {
        switch self {
            case .size:
                return SizeFetcher()
            case .version:
                return VersionFetcher()
            case .custom(let fetcher):
                return fetcher
        }
    }
    
    public var title: String {
        return fetcher.title
    }
    
    public var icon: UIApplicationShortcutIcon {
        return fetcher.icon.shortcutIcon
    }
    
    public var rawValue: String {
        switch self {
        case .size:
            return "option.size"
        case .version:
            return "option.version"
        case .custom(let fetcher):
            return "option.custom.\(fetcher)"
        }
    }
    
    func fetch() -> String? {
        return fetcher.fetch()
    }
}
