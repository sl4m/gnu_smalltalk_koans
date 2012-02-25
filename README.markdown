## GNU Smalltalk Koans

Hey there and welcome!

### Supported GNU Smalltalk Versions

GNU Smalltalk versions `3.2.2` or higher should work on Mac OS X and Linux.  I have written these koans on `3.2.2`, Mac OS X 10.6.

Note: I am certain that `3.0.x` does not work and it will complain about not understanding `#asString`.

Support for Windows is on its way (once I figure out how to build it successfully).

### Installing GNU Smalltalk on Mac OS X

The simplest way to install GNU Smalltalk is via homebrew:

`brew install gnu-smalltalk`

This will build GNU Smalltalk `3.2.2` in 32-bits.  If you want the latest, I encourage you to try `HEAD`:

`brew install gnu-smalltalk --HEAD`

You can also install it via MacPorts.

### Installing GNU Smalltalk on Linux

Make sure you have the following tools installed:

* Autoconf 2.65 or later
* Automake 1.11 or later
* Libtool 2.2 or later
* Bison 2.0 or later
* Flex 2.5.x

Grab GNU Smalltalk `3.2.4` source from [ftp://ftp.gnu.org/gnu/smalltalk](ftp://ftp.gnu.org/gnu/smalltalk).

<pre>
autoreconf -vi
./configure
make
sudo make install
</pre>

Test by running `gst` and interact with the REPL.

### Running koans

In the root directory of the project, type:

`script/run`

You will see a message similar to this:

`TestAssert#testTruth has damaged your karma.`

This means you will need to open the `TestAssert.st` file under `src/koans` and solve the test under `testTruth` method (aka message).

All koan files contain a set of tests, each starting with 'test'.  Solve each test one by one, running `script/run` in between.

By default, `script/run` does not reveal the answer.  If you are truly stuck in a koan, type `script/run_and_reveal` to run and reveal the answer.  Use this sparingly!

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

`#speak` is the notation used to describe the message 'speak'.

Words wrapped in `<>` are called pragmas and define class comments, category, imported namespaces, and the shape of indexed instance variables.  More information [here](http://www.gnu.org/software/smalltalk/manual/gst.html#Syntax).

Ok, have at it!

### List of Koans

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

### Future Koans

* TestMetaclass

### Pull Requests and Feedback are Welcome!

Please create a GitHub issue or find me on Twitter (@skim), if you have any suggestions on how to improve existing koans, new koans, or any other comments.

### Future Plans

* Rewrite the runner (make it smarter, faster, stronger)
* Add an answer sheet
* Add color to output
* Add auto runner

There is no set time, but I plan to port these koans over to the following Smalltalk dialects:

* redline
* Amber

### Inspiration and Credits

GNU Smalltalk Koans were inspired by Edgecase's [Ruby Koans](https://github.com/edgecase/ruby_koans) and [Aaron Bedra's](http://twitter.com/#!/abedra) [Clojure Koans](https://github.com/functional-koans/clojure-koans) (now maintained by [Colin Jones](http://twitter.com/#!/trptcolin)).

Thanks to [Matt Yoho](http://twitter.com/#!/mattyoho) at Edgecase for letting me port some of the koans over.

Other thanks:

* [8th Light](http://8thlight.com/)
* [Craig Demyanovich](http://twitter.com/#!/demmer12) (contributor)
* [Chris Rathman](http://squeak.joyful.com/LanguageNotes) for the awesome language notes.
* Jayden for being the first person to run through the koans.
* [Anita Kuno](https://twitter.com/#!/anteaya) (contributor)

### License

![cc-license](http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png)

GNU Smalltalk Koans shares the same license as Ruby Koans and is released under a Creative Commons,
Attribution-NonCommercial-ShareAlike, Version 3.0
([http://creativecommons.org/licenses/by-nc-sa/3.0/](http://creativecommons.org/licenses/by-nc-sa/3.0/)) License.
