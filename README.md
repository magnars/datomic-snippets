# datomic-snippets.el

Yasnippets for [Datomic](http://www.datomic.com/).

## Installation

I highly recommend installing datomic-snippets through elpa.

It's available on [melpa](http://melpa.milkbox.net/):

    M-x package-install datomic-snippets

You can also install the dependencies on your own, and just dump
datomic-snippets in your path somewhere:

 - <a href="https://github.com/magnars/s.el">s.el</a>
 - <a href="https://github.com/magnars/dash.el">dash.el</a>

## Usage

 - `dsa` Insert a **d**atomic **s**chema **a**ttribute
 - `dsf` Insert a **d**atomic **s**chema **f**unction
 - `dst` List all **d**atomic **s**chema **t**ypes
 - `:db` List additional attribute attributes.

## Setup

Well, you'll have to require it. You'll also need
[yasnippets](https://github.com/capitaomorte/yasnippet) of course.

    (require 'datomic-snippets)

## License

Copyright (C) 2013 Magnar Sveen

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
