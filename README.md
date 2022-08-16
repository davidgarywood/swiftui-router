# swiftui-router

This represents a view of a Router concept for SwiftUI, with view models.

This is created by David Gary Wood. You can contact David on twitter, at [https://twitter.com/davidgarywood](https://twitter.com/davidgarywood)

A detailed blog post about this pattern, is available here: [https://davidgarywood.com/writing/swiftui-router-pattern](https://davidgarywood.com/writing/swiftui-router-pattern)

# Design Pattern Overview

## Requirements
* Simple to implement
* Easy to create objects
* Explainable to junior SwiftUI developers.
* Good code locality (not split into 100's of sub components)
* Modular screen code, modular flow and navigation. It should be easy to move a screen to a different router, or move a flow to a different parent.
* Easy dependency injection. A router gives each ViewModel it's dependencies, we do not require SwiftUI's EnvironmentObject etc.

## Pattern

We start with a Router. It has responsibility for holding the application's dependencies, and creating screens and their view models. Each Router has a corresponding view.

The first Router is instantiated in our window group with it's view like so:

```
AppRouterView()
```

We create views that we call *Screens*. A screen is a SwiftUI View that represents the whole screen. A screen has a protocol for it's own router, that any router implements in order to provide a screen with other views, or to change navigation or flow.

Routers can also observe ObservableObjects, and use their state changes to change flow.

# Object responsibilities

## Router

Represents a collection of screens

* Creating Screens / Views
* Creation of Navigation Views / Tab Views
* Handing Sheet presentations
* Managing view selection states
* Creation of child routers, to navigate to or contain other collections of screens.

## Screen
* A SwiftUI view, with the simple responsibility of representing a single screen. 
* If the view becomes large, content should be split into sub-views, these should be simple views without view models or state, that the screen gives state to from it's view model.
* Send user input to the view model to change state
* Talks to it's Router to change the view (e.g. with a navigation link)
* Receives views from it's Router

## ViewModel
* Provides state to each screen
* Communicates to dependencies such as network managers, data managers, user defaults, etc etc.

## Example notes

The example shows a login screen, which then opens up to a tab screen. We have routers for each area of flow in the app.

In the example there is an @Injectable PropertyWrapper which allows dependencies and global state to be imported via KeyPath to wherever they are needed. Dependencies are held in a static var in DependencyInjection.assembly, which effective gives us a singleton that can respond to whether we are in View Preview mode, or a real app. 

The ViewModel has to play "pass the parcel" with any global state. This decoupling is on purpose. It gives us flexibility to connect view models to different things, and to avoid tightly coupled code in our views.

# Installing the Xcode templates

This repo has some Xcode templates packaged with it. To symlink these into your Xcode templates folder, run the `symlink-templates.sh` script in the root of of the repo.
