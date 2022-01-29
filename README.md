<div align="center">
<h1>Snitch</h1>

<p>
<strong>Access your app's useful information from Home Screen</strong>
</p>

<img src=https://img.shields.io/badge/platform-iOS-lightgrey />
<img src=https://img.shields.io/github/v/release/onl1ner/Snitch />
<img src=https://img.shields.io/github/license/onl1ner/Snitch />
<img src=https://img.shields.io/badge/Swift-5-orange?logo=Swift&logoColor=white />
</div>

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
    * [Quick start](#quick-start)
    * [Custom fetchers](#custom-fetchers)
* [Contribution](#contribution)
* [License](#license)

## Installation

**Snitch** is available through [Swift Package Manager](https://github.com/apple/swift-package-manager).

- In Xcode select: 

  ```
  File > Swift Packages > Add Package Dependency...
  ```
  
- Then paste this URL: 

  ```
  https://github.com/onl1ner/Snitch.git
  ```

## Usage

<img align="right" src="https://github.com/onl1ner/onl1ner/blob/master/Resources/Snitch/Preview.png?raw=true" width="256"/>

### Quick start

To snitch the information just call function `snitch(options:)`:

```swift
Snitch(options: [.size, .version]).snitch()
```

The `.size` and `.version` options are default, so you can omit them:

```swift
Snitch().snitch()
```

### Custom fetchers

You may also want to create your own option and show it on the Home Screen to do that you have to create your own implementation of `Fetcher` protocol. After doing that you could pass it as an option to the `Snitch` through the `init(options:)` initializer:

```swift
Snitch(options: [.custom(CustomFetcher())]).snitch()
```

### Note

After calling `snitch(options:)` function `Snitch` will add Home Screen quick action menu with the information according to the passed options. You may call this function at any point in your app, but the best place to call it is in `sceneWillResignActive(_:)`, because during the transition to a background state is a good time to update any dynamic quick actions, so the system will execute code inside the function right before user returns to the Home Screen.

## Contribution

If you struggle with something feel free to [open an issue](https://github.com/onl1ner/Snitch/issues/new). Pull requests are also appreciated.

## License

**Snitch** is under the terms and conditions of the MIT license.

```
MIT License

Copyright (c) 2022 Tamerlan Satualdypov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
