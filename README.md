# osx-plist.el

Apple plist file parser

Copyright (C) 2005  Edward O'Connor <ted@oconnor.cx>

This fork is maintained by Neil Okamoto
<neil.okamoto+melpa@gmail.com>.

## Description

This is a simple parser for Mac OS X plist files.  The main entry
points are `osx-plist-parse-file` and `osx-plist-parse-buffer`.

Historically this package included code to update Emacs' environment
by parsing your `~/.MacOSX/environment.plist` file.  However macOS
10.8 and newer dropped support for setting your environment that way.
Therefore the code has been removed from this package.  If you still
need this capability please consider switching to purcell's
`exec-path-from-shell` package which is available on MELPA, or use the
original version of this package.

## Documentation

* [Apple Developer Documentation](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/AboutInformationPropertyListFiles.html)
* [Apple Plist v1.0 DTD](https://www.apple.com/DTDs/PropertyList-1.0.dtd)

## Changelog:

- v2.0.0 (2020)
  - Complete support for plist types:  integer, real, date, and base64 data
  - Breaking change: drop environment.plist support
- v1.0.0 (2005)
  - Published by Edward O'Connor 2005 [EmacsWiki](https://www.emacswiki.org/emacs/MacOSXPlist)
