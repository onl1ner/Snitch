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

import Foundation

struct SizeFetcher: Fetcher {
    var title: String {
        return NSLocalizedString("title.size", bundle: .module, comment: "")
    }
    
    var icon: Icon? {
        return .init(name: "shippingbox", kind: .system)
    }
    
    private func calculateAppSize() -> Int64 {
        var paths: [String] = [Bundle.main.bundlePath]
        
        let docDirs: [String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let libDirs: [String] = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        
        if let docDir = docDirs.first {
            paths.append(docDir)
        }
        
        if let libDir = libDirs.first {
            paths.append(libDir)
        }
        
        paths.append(NSTemporaryDirectory() as String)

        return paths.reduce(into: 0) { total, path in
            total += self.byteSize(of: path)
        }
    }

    private func byteSize(of directory: String) -> Int64 {
        var size: Int64 = 0
        
        let fm = FileManager.default
        
        if let subdirectories = try? fm.subpathsOfDirectory(atPath: directory) {
            subdirectories.forEach { fileName in
                let path = directory.appending("/" + fileName)
                let file = try? fm.attributesOfItem(atPath: path) as NSDictionary
                
                size += Int64(file?.fileSize() ?? 0)
            }
        }
        
        return size
    }
    
    func fetch() -> String? {
        let bcf = ByteCountFormatter()
        
        bcf.allowedUnits = [.useMB, .useGB]
        bcf.countStyle = .file
        
        return "~\(bcf.string(fromByteCount: self.calculateAppSize()))"
    }
}
