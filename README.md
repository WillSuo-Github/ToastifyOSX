# ToastifyOSX - A macOS Toast Library

![macOS 14.0](https://img.shields.io/badge/macOS-14.0-brightgreen.svg)

ToastifyOSX is a lightweight and customizable library for displaying toast notifications on macOS. It provides a simple API to show various types of toasts with ease.

## Features
![Toast](https://github.com/WillSuo-Github/ToastifyOSX/assets/15070906/a98fe472-65c6-440d-8493-c4cc1a3515ca)

- **Four Toast Types**: ToastifyOSX supports four types of toasts: Success, Warning, Error, and Tips.
- **Simple API**: Intuitive and straightforward API for displaying toasts with minimal code.

## Installation

Use Swift Package Manager to intall ToastifyOSX.

## Usage & Configuration

```
Toast.show(message: "Hello World", config: .init(level: .error, duration: 10), on: window)
```

## Credits
   
1. It relies on the [SnapKit](https://github.com/SnapKit/SnapKit) library for integration.

## License

This workflow is open-source and available under the [MIT License](https://rem.mit-license.org).


## Support and Issues

If you encounter any issues or have questions, please [open an issue](https://github.com/WillSuo-Github/ToastifyOSX/issues) on this GitHub repository, and we'll be happy to assist you.
