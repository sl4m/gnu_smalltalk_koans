## GNU Smalltalk Koans

Hey there and welcome!

### Supported GNU Smalltalk Versions

GNU Smalltalk versions `3.2.2` or higher should work on Mac OS X and Linux.  I have written these koans on `3.2.2`, Mac OS X 10.6.

Note: I am certain that `3.0.x` does not work and it will complain about not understanding `#asString`.

### Installing GNU Smalltalk on Mac OS X

The simplest way to install GNU Smalltalk is via homebrew:

`brew install gnu-smalltalk`

This will build GNU Smalltalk `3.2.2` in 32-bits.  If you want the latest, I encourage you to try `HEAD`:

`brew install gnu-smalltalk --HEAD`

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

* vim
* emacs

### Things You Should Know Before Starting

`| variable1 variable2 |` is to declare variable1 and variable2 separate by a space.  At least one space must be used to separate variables.  Commas are not used.

`:=` is an assignment operator

`"this is a comment"`

`'this is a string'`

`#speak` is the notation used to describe the message 'speak'.

Words wrapped in `<>` are called pragmas and define class comments, category, imported namespaces, and the shape of indexed instance variables.  More information [here](http://www.gnu.org/software/smalltalk/manual/gst.html#Syntax).

In depth information [here](http://squeak.joyful.com/LanguageNotes).

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

Please create a GitHub issue or find me on Twitter ([@skim](https://twitter.com/skim), if you have any suggestions on how to improve existing koans, new koans, or any other comments.

### Inspiration and Credits

GNU Smalltalk Koans were inspired by [Ruby Koans](https://github.com/edgecase/ruby_koans) and [Clojure Koans](https://github.com/functional-koans/clojure-koans).

Thanks to [Matt Yoho](https://twitter.com/#!/mattyoho) at Edgecase for letting me port some of the koans over.

#### Contributors

* [Craig Demyanovich](https://twitter.com/demmer12)
* [Anita Kuno](https://twitter.com/anteaya)
* [@german](https://github.com/german)

#### Other thanks:

* [8th Light](https://8thlight.com/)
* [Chris Rathman](http://squeak.joyful.com/LanguageNotes) for the awesome language notes.
* [@jayden](https://github.com/jayden) for being the first person to run through the koans.

### License

![cc-license](https://licensebuttons.net/l/by-nc-sa/3.0/88x31.png)

GNU Smalltalk Koans shares the same license as Ruby Koans and is released under a Creative Commons,
Attribution-NonCommercial-ShareAlike, Version 3.0
([https://creativecommons.org/licenses/by-nc-sa/3.0/](https://creativecommons.org/licenses/by-nc-sa/3.0/)) License.
