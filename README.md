# osx-plist.el

Apple plist file parser

[![MELPA Stable](https://stable.melpa.org/packages/osx-plist-badge.svg)](https://stable.melpa.org/#/osx-plist)
[![MELPA](https://melpa.org/packages/osx-plist-badge.svg)](https://melpa.org/#/osx-plist)
[![CircleCI](https://img.shields.io/circleci/project/github/gonewest818/osx-plist.svg)](https://circleci.com/gh/gonewest818/osx-plist)
[![codecov](https://codecov.io/gh/gonewest818/osx-plist/branch/master/graph/badge.svg)](https://codecov.io/gh/gonewest818/osx-plist)

Copyright (C) 2005  Edward O'Connor <ted@oconnor.cx>

Copyright (C) 2020  Neil Okamoto <neil.okamoto+melpa@gmail.com>.

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
  - Project forked
  - Complete support for plist types:  integer, real, date, and base64 data
  - CircleCI pipeline including lint, test cases, and coverage analysis 
  - Breaking change: drop environment.plist example code
- v1.0.0 (2005)
  - Published by Edward O'Connor 2005 [EmacsWiki](https://www.emacswiki.org/emacs/MacOSXPlist)

## License

This file is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2, or (at your option) any
later version.

This file is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with GNU Emacs; see the file COPYING. If not, write to the Free
Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
02111-1307, USA.
