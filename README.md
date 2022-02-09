# Optimization Examples

This project is designed to assess the skills of an incoming associate- or junior-level iOS software engineer.
These examples are purposefully kept simple so that they can be elaborated upon in varying degrees.
The spirit of this project is that a person will be assessed while explaining their thought process to another (more senior) engineer; this is not intended to be a take-home project.

The application itself is already built (using programmatic UIKit).
Programmatic UIKit was chosen over Interface Builder (i.e. XIBs or Storyboards) because the UI is not of focus or intended to be changed in any way for this assessment.

There are four "challenges" in this project:
* Random Strings
* Numbers
* Counter
* Random Emoji

## General Walkthrough

Before starting the assessment, the proctor should first give an overview of the application.
It's important to point out that any files in the `App Files` group are not important, mention that this project uses programmatic UIKit (stressing that UI changes will not be necessary), and points out that the focus throughout the assessment will be on the files located in the `User Interface` group.
The files in the `Main` group are only used for navigating to the other parts of the app (and therefore will not need to be modified).
It will likely be helpful for the candidate to quickly see the app running in the Simulator before diving into an explanation of the first part (Random Strings).

## Random Strings

This is intended to be the first "test" of sorts for this project.
This should test basic problem solving and algorithmic mindset abilities.
Three files are located in the `Random Strings` group: `RandomStringsGenerator.swift`, `RandomStringsTableViewCell.swift`, and `RandomStringsTableViewController.swift`.
Before the candidate has a chance to look at `RandomStringsTableViewCell` or `RandomStringsTableViewController`, have them look at `RandomStringsGenerator`...

### RandomStringsGenerator

`RandomStringsGenerator` is an `enum` for namespacing and because it only contains `static` methods.
Have the candidate walk through an explanation of what the method `createRandomString(maxLength:)` is doing.
In particular, can they explain all or some of the following:

* Can they explain the different range operators that are being used (`...` and `..<`)?
* Why is `compactMap(_:)` being used over simply `map(_:)`?
* Is the last line (`String(characters)`) really necessary?
* Why is `createRandomString(maxLength:)` a `private` method?

Then can they walk through the `generate(count:)` method and explain what it is doing?
Overall, what is `RandomStringsGenerator`'s purpose?

### RandomStringsTableViewController

`RandomStringsTableViewController` is a simple subclass of `UITableViewController`.
Walk the candidate through a brief rundown of what this screen is doing: it's backing data source is essentially an `Array` of 10,000 randomly-generated `String`s and those `String`s are each being displayed in cells (i.e. `RandomStringsTableViewCell`s) on this `UITableView`.
That's pretty much all this screen is doing.

After explaining the simple screen to the candidate, run the application, navigate to the Random Strings screen, and start scrolling.
It should be obvious that the performance is sluggish.
This should be all the information needed for the candidate to start debugging how to fix this performance issue.
The proctor should be mostly hands off for how to fix the performance issue; however, they may want to lead them back to `RandomStringsTableViewController` if the candidate strays too far away (e.g. if the candidate starts trying to solve the problem by modifying `RandomStringsGenerator` for too long).

Spoiler alert: the performance problem is because `randomStrings.sorted()` is being called in `tableView(_:cellForRowAt:)`.
This should be called only one time (instead of for every time a cell is fetched); a good place for this to be moved is right at the initial `randomStrings` initialization, for example.

After the performance issue has been fixed, ask the candidate to then ensure that there are no duplicate `String`s in the list.
A common way to do this is to wrap the `randomStrings` `Array` in a `Set` and then back in an `Array`.
For example, the candidate may end up with something that looks like this:

```swift
private let randomStrings = Array(Set(RandomStringsGenerator.generate(count: stringCount).sorted()))
```

However, insist that the list should be sorted by the end of everything if the candidate didn't catch the above mistake.
The above should look something like this instead:

```swift
private let randomStrings = Array(Set(RandomStringsGenerator.generate(count: stringCount))).sorted()
```

Lastly, ask the candidate to scroll all the way to the bottom of the list.
A crash should occur; ask the candidate to debug this crash.

Spoiler alert (again): the crash occurs because `tableView(_:numberOfRowsInSection:)` is returning a hard-coded `10_000` value, but some elements have been removed from `randomStrings`.
Therefore, an `index out of range` crash occurs.

A simple fix for this is to replace `10_000` with `randomStrings.count`.

## Numbers

The second task for the candidate is more open ended and narrows in on data structure knowledge and refactoring capabilities.
Inside of the `Numbers` group there are three files: `NumbersCollectionViewController.swift`, `NumbersCollectionViewCell.swift`, and `NumbersCollectionViewHeader.swift`.
The candidate should not need to modify the cell or the header for this exercise, but it may be useful to quickly discuss the two classes so that they aren't a mystery.
The `UICollectionViewCell` and `UICollectionReusableView` subclasses are very similar: they both contain a single `UILabel` each and `configure(with:)` methods that set the `UILabel`'s `text` property.

The actual work to be done all happens in `NumbersCollectionViewController`.
This is a straightforward `UICollectionViewController` subclass.
To start with it will be beneficial for the proctor to discuss the basics of this screen with the candidate.
It consists of a `UICollectionView` with four sections that each contain ten cells listing out the numbers 1-10 as written out in a different language (English, Spanish, French, and Japanese).
The four sections are backed by one `Array` each that contain `String`s for the ten numbers: `english`, `spanish`, `french`, and `japanese`.
Each section has a header that contains a label with the name of the language.

There are four `UICollectionViewDataSource` methods implemented:

* `numberOfSections(in:)`
* `collectionView(_:numberOfItemsInSection:)`
* `collectionView(_:cellForItemAt:)`
* `collectionView(_:viewForSupplementaryElementOfKind:at:)`

There is nothing _wrong_ with how `NumbersCollectionViewController` performs and there are no known bugs: the code is technically working as intended.
However, looking at the implementation of the above methods, it is clear that the data source methods are very closely tied to the individual `Array`s on the `UICollectionViewController` subclass.
The goal here is to have the candidate refactor `NumbersCollectionViewController` by implementing a better data structure for the data source that is more flexible and scalable.
Some issues that may be worth pointing out to the candidate to get their ideas flowing about where some problems lie:

* Right now there are four languages in four sections: how much code would have to change to add four more sections?
* How flexible would this implementation be if the language data was being retrieved from an external data source (e.g. a network API) where the number of sections and/or items isn't known at compile time?
* How easy would it be to reorder the sections (e.g. moving `Spanish` to the end to make the list alphabetical)? As in, how much code would have to change for that to happen?
* How simple would it be to hide/show entire sections?

There is no single _correct_ solution to this refactor or a single _best_ data structure to use.
The important part here is that the candidate can improve upon the current implementation in a meaningful way and **explain** their reasoning clearly, including benefits and trade offs.

One example of an improvement would be to create an `enum` to represent the different sections:

```swift
enum Section: Int, CaseIterable {
  case english, spanish, french, japanese
}
```

The benefit of implementing an `enum` to describe the sections of the `UICollectionView` are allowing for using a `switch` statement when trying to iterate over every possible section (without the possibility of missing one on accident), adding conveniences like computed properties (e.g. `var sectionTitle: String`), and more.
In addition, combining the four `Array`s into a single data structure is another strongly-recommended approach.
This could go hand-in-hand with the above `enum` approach.
This can be done by either using a custom type (e.g. `struct`), a `Dictionary` (e.g. `[Section: [String]]` or `[Int: [String]]`), a multidimensional `Array` (i.e. `[[String]]`), or even another kind of structure that the candidate may create.
To reiterate: the goal here is for the candidate to be able to discuss their choice reasoning, advantages, disadvantages, et cetera; there is no single answer to this part of the assessment.

It is recommended for the proctor to discuss some alternative solutions with the candidate after this section has been completed to gather more insight about the candidate's thoughts.
For example, if the candidate decided to choose a `Dictionary` to restructure the data: how was it dealing with `Optional`s after the fact?
What other data structure could have been chosen to avoid dealing with `Optional`s?
Were the trade offs worth it?
And so on.
The idea is to get the candidate talking to explain their ideas and elaborate on their development process.

## Counter

The `Counter` group in `User Interface` consists of three files: `Counter.swift`, `CounterView.swift`, and `CounterViewController.swift`.
`CounterViewController` is initialized with a `Counter` object to keep track of the `currentCount` to be displayed on the screen (and manipulated via `-` and `+` buttons).
The actual UI elements (i.e. the `UILabel` and `UIButton`s) all live with `CounterView`; therefore the controller hooks up its button actions via a closure method named `CounterView.setupButtonActions(_:)`.
The `Counter` object that is currently being used to initialize `CounterViewController` is being created on `MainViewController` and passed in via reference.
In `CounterViewController`'s deinitializers `counter.reset()` is being called, and therefore the expectation is that every time a new `CounterViewController` is being presented the `Counter`'s `currentCount` should equal `0`.

Give a brief rundown of `CounterViewController` to the candidate, pointing out the expected `reset()` upon `deinit` being called.
Then have the candidate navigate to the Counter screen, change the value of the current count by using the `-` and `+` buttons, and then navigate back to the Main screen.
Following that have them navigate back to the Counter screen; notice that the displayed count is being retained from the previous interaction.

Have the candidate take over from here to figure out why this unexpected behavior is happening.
It is expected that the candidate use techniques such as `print` statements, breakpoints, and perhaps even the Memory Graph Debugger.
It is important that the candidate not "mask" the symptoms with this challenge and instead figure out the actual problem: there's a strong reference cycle at play.

In `CounterViewController.viewDidLoad()` the button actions are being setup:

```swift
counterView.setupButtonActions { action in
    switch action {
    case .minusButtonTapped:
        self.updateCount(by: -1)
    case .plusButtonTapped:
        self.updateCount(by: +1)
    }
}
```

This is where the strong reference cycle is being created: the closure is causing `CounterView` to create a strong reference to `CounterViewController` while `CounterViewController` already has a strong reference to `CounterView` (since the controller is what manages the lifetime of the view).
A simple solution here is to implement `[weak self]` or `[unowned self]` in this closure (the latter is safe in this case since the view will never outlive the controller and `UIActionHandler` performs synchronously).
If the candidate starts trying to solve this problem by moving the creation of `Counter`, moving the call to `counter.reset()` into a different lifecycle method, et cetera, then it may be best to guide them into the correct direction before making those changes and/or place the restriction that they need to solve this particular problem by not changing the state/flow structure before solving the issue first.

_After_ solving the strong reference cycle it would be a good idea to discuss with the candidate some of the following:
* Where would be some other places the `Counter` object could be created?
* If the `MainViewController` needed to continue owning the `Counter` object, what would be a more appropriate place to call `counter.reset()`? (e.g. `viewDidDisappear(animated:)`)
* What is the difference between `weak` and `unowned`?
* Explain why developers are forced to write `self` in some circumstances and why seeing the word `self` should trigger a red flag to pay attention (i.e. look out for potential strong reference cycles)

## Random Emoji

The `Random Emoji` group consists of four files: `RandomEmojiDelegate.swift`, `RandomEmojiGenerator.swift`, `RandomEmojiView.swift`, and lastly `RandomEmojiViewController.swift`.
This screen displays a random emoji (selected from an `Array` of 100 emoji) and a button that when tapped displays a different random emoji.

To make this happen, `RandomEmojiViewController` conforms to `RandomEmojiDelegate` and also owns a `RandomEmojiGenerator`.
When the "Generate Random Emoji" button is tapped, the `RandomEmojiGenerator`'s `generateRandomEmoji()` method is called.
That method calls its `delegate`'s `displayEmoji(_:)` method (which is defined on `RandomEmojiViewController`), which then update's the label on on the screen with a new random emoji.

Everything here seems to be in working order: no functionality is broken.
However, the proctor should direct the candidate to navigate to the Random Emoji screen and then back to the Main screen a few times.
Then open the Memory Graph Debugger.
There should be multiple instances of `RandomEmojiGenerator`, `RandomEmojiView`, and `RandomEmojiViewController` in memory still (the expectation would be that there should be either only one of each or none, depending on if the Simulator is currently displaying the Random Emoji screen or Main screen).

From here it should be obvious that there's a strange reference cycle.
Have the candidate start debugging what the issue could be.

If the candidate gets stuck and cannot figure out the issue, have the candidate inspect the type signature of a different, built-in delegate such as `UITableView`'s `delegate` property:

```swift
weak var delegate: UITableViewDelegate? { get set }
```

Doing so should give a big clue as to a proper solution to the problem here: `UITableView.delegate` is a `weak` property.
The problem here, similar to the problem with Counter, is that through the `delegate` property `RandomEmojiViewController` has created a strong reference cycle with `RandomEmojiGenerator`.
To break this, the `delegate` property can be made `weak` (i.e. `var delegate: RandomEmojiDelegate?`).
In doing this a build error will appear; something like `'weak' must not be applied to non-class-bound 'RandomEmojiDelegate'`.
Explain why this is a problem (i.e. that value types cannot be weak and why) and how to add `AnyObject` to the protocol definition to fix the issue.
