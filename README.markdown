## GNU Smalltalk Koans

Hey there and welcome!

### Supported GNU Smalltalk Versions

Currently, only GNU Smalltalk version `3.2.2` on Mac OS X is supported right now.  It should work on Linux and support for Windows is on its way.  Until I can get `3.2.3` or `3.2.4` installed on Mac OS X, no support for these versions are available at this time, although you're more than welcome to try it out and report back.

The simplest way to install GNU Smalltalk on your Mac OS X is via brew:

`brew install gnu-smalltalk`

You can also install it via MacPorts.

### Running koans

In the root directory, type:

`script/run`

You will see a message similar to this:

`TestAssert#testTruth needs your attention.`

This means you will need to open `TestAssert.st` under `src/koans` and solve the test, `testTruth`.

All koan files contain a set of tests, each starting with 'test'.  Solve each test one by one, running `script/run` in between.

### Editors with Smalltalk support

* [redcar](https://github.com/redcar/redcar)
* vim
* emacs
* Textmate

### Things You Should Know Before Starting

`| variable1 variable2 |` is to declare variable1 and variable2 separate by a space.  At least one space must be used to separate variables.  Commas are not used.

`:=` is an assignment operator

`"this is a comment"`

`'this is a string'`

`#speak` is the notation used to describe the method (message) 'speak'.

Words wrapped in `<>` are called pragmas and define class comments, category, imported namespaces, and the shape of indexed instance variables.  More information [here](http://www.gnu.org/software/smalltalk/manual/gst.html#Syntax).

Ok, have at it!

### Koans supported right now

* TestAssert
* TestBasic
* TestNil
* TestObject
* TestMessage
* TestNumber
* TestString
* TestCharacter
* TestSymbol
* TestArray
* TestOrderedCollection
* TestSortedCollection
* TestBag
* TestAssociation
* TestDictionary
* TestSet
* TestBlock
* TestCollectionsRevisited
* TestIteration
* TestBoolean
* TestException
* TestRegex
* TestClass

### Koans that still need to be written

* TestClassHierarchy
* TestMetaclass

### Pull Requests and Feedback are Welcome!

Please create a GitHub issue or find me on Twitter (@skim), if you have any suggestions on how to improve existing koans, new koans, or any other comments.

### Future Plans

* Rewrite the runner (make it smarter, faster, stronger)
* Give user option to hide answers
* Add an answer sheet

There is no set time, but I plan to port these koans over to the following Smalltalk dialects:

* Pharo/Squeak
* redline?
* Jtalk?

### Inspiration and Credits

GNU Smalltalk Koans were inspired by Edgecase's Ruby Koans and [Aaron Bedra's](http://twitter.com/#!/abedra) Clojure Koans (now maintained by [Colin Jones](http://twitter.com/#!/trptcolin)).

Thanks to [Matt Yoho](http://twitter.com/#!/mattyoho) at Edgecase for letting me port some of the koans over.

Other thanks:

* [8th Light](http://8thlight.com/)
* [Craig Demyanovich](http://twitter.com/#!/demmer12) (contributor)
* [Chris Rathman](http://squeak.joyful.com/LanguageNotes) for the awesome language notes.
* Jayden for being the first person to run through the koans.
