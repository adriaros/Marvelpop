# Marvelpop

This project is an App to search for characters from the Marvel universe and allow the user to save their favorites.

Home                       |        Favourites        |        Character Detail 
:-------------------------:|:-------------------------:|:-------------------------:
<img src="https://user-images.githubusercontent.com/9952638/178121572-eebfc341-4d81-41e8-b629-46cbaea2535a.png" width="240" height="500">  |  <img src="https://user-images.githubusercontent.com/9952638/178121578-d4be877a-5183-4dab-8c9e-9d3f00f96bad.png" width="240" height="500"> | <img src="https://user-images.githubusercontent.com/9952638/178121582-4ffbfa51-9df0-4293-961c-919aa3fa2f20.png" width="240" height="500">

Next I will show you a brief guide on how to run the application and how it is built and why I have used each of the elements that make it up.

## Installation

1. Clone or download the project.
2. Run `pod install` in the project folder (where the Podfile is located).
3. Use `Marvelpop.xcworkspace` to open the project. 

## Usage

### Home

Infinite scrollable list to search for your favorite marvel character. Contains a text field to search by name (The text must match or start with the name of the character being searched for).

Each item in the list can be selected to view details.

### Favourites

A list containing the favorite characters selected by the user.

### Character detail

The detail of the character. It includes the image, the name, the description and the comics where the character appears.

Also, user can select as favorite by touching the "heart" button on the navigation bar.

## Device and modes

- This app is compatible for both iPhone and Ipad
- This app is designed for both light and dark modes

## Architecture

This project has been built using clean architecture. Using this architecture ensures that the application will be scalable, easy to maintain, testable and also follows the SOLID principles.

### SOLID principles

#### Single Responsibility Principle

`A module should have one, and only one, reason to change.`

This means that a module should have only one responsibility, avoiding long functions and unnecessary logic. This provides benefits such as ease of maintenance and scalability, functionalities are clearly separated, allowing different team members to work on the same project without major conflicts, and also provides greater testability, clarity, and readability.

#### The Open-Closed Principle

`A system should be open for extension but closed for modification.`

This means that to add new functions we must extend the classes and not modify their main operation.

Here the "Protocols" come into play, which give visibility to those variables/functions that must be visible and instead do not allow access to internal variables (making them private).

Also, classes are all "Final" by default, so they can't be inherited by others. This means they can't override its methods to change its behavior; they need to use their class the way it was written.

#### The Liskov Substitution Principle

`Derived classes must be substitutable for their base classes.`

This means that any class that inherits from the parent class can be used anywhere the parent class is used.

Also, this principle allows for easy testing, as dependency injection with Mocks that inherit from the parent class is very easy.

#### The Interface Segregation Principle

`Make fine grained interfaces that are client specific.`

This means that clients should not have more methods than they actually use. This makes the code more maintainable, composable and has fewer dependencies (which you don't need). 

#### The Dependency Inversion Principle

`Depend on abstractions, not on concretions.`

This means that our classes should depend on interfaces or abstract classes instead of concrete classes and functions. This means that we do not directly depend on the class itself, for example, if it is a third-party framework and it changes, the operation of our application is not affected.

### Project structure

The project is organized using a structure of different layers

#### Main

This layer contains the main components responsible for building the project.

#### Core

This layer contains all those common components in the application.

> Utilities
>> Basic functions used in the app

> Factory `Pattern used to create objects without specifying their concrete classes.`
>> Dependency Injection
>>> It is responsible for creating and providing all the dependencies of the application. 

>> View Controllers
>>> It is responsible for creating and providing the view controllers and injecting the necessary dependencies.

> Extensions
>> Extensions used in the app

> Coordinator `Pattern that provides an encapsulation of the navigation logic.`
>> It is responsible for the navigation of the app.

#### Data

This layer will have all the code related to the external dependency and its implementation. It is responsible for providing data to the application by requesting it either to an API or to a database.

> Datasource
>> It contains both the interfaces and the implementations. It is responsible for requesting the data from both APIs and databases and decoding the entities.

> Repository `Pattern that provides a data abstraction`
>> It contains the implementation of the repositories that are responsible for transforming the entities that come from the data sources to domain models with which the application works. This means that if the data source changes, the application does not experience any changes.


#### Domain

This layer describes the operation of our application.

> Model
>> It contains the models that the app uses to manage the data.

> UseCases
>> It contains the use cases used in the app.

> Repository
>> It contains the repository interfaces.


#### Presentation

This layer has all the code related to views and the app's interaction with the outside world.

> Common
>> The common components used in the app

> TabBar
>> The TabBar controller with its configuration

> Home
>> VIPER module in charge of displaying the list of characters.

> Favourites
>> VIPER module in charge of displaying the list of characters.

Character Detail
>> VIPER module in charge of displaying the character details.

#### Resources

It contains all the necessary resources for the app such as images, texts...

> Design system
>> It contains the design system used in the app (labels, shapes, textfields...)

> Localization
>> The localized texts

> Assets
>> The app images


### Once we know the structure of the project and the principles on which it is built...

I have tried to create the whole project without the use of external Libraries, since in my opinion it will always be better to use native components than to use third-party frameworks, since in the end it takes time to learn the framework itself and they can include errors in the project that you can't fix.

#### Network / Api
I usually use Alamofire but in this case I used URLSession as it is enough for this project.

#### Database

Normally, for data persistence I use Realm, since it allows you to work comfortably with the different models, it is quite simple and in terms of migrations / speed / data processing it is a better option. That said, the application will only save favorites (which normally won't be 2M of data) and we won't need a large infrastructure for it, so the use of Core Data is enough and we also avoid having to add a third-party library.


### Why VIPER?

Possibly the "hottest" topic of all. One of the biggest reasons is that it seems like a good way to separate the responsibilities of each part of this pattern and follows the principles of SOLID.

> **View**: It is responsible for the interaction of the view and its configuration. Give orders to the Presenter.

> **Interactor**: It is in charge of the business logic. This is the one that interacts with the data sources (repositories) and uses the models for the task it has to do.

> **Presenter**: Contains the logic for rendering data provided by the Interactor and interacts with the View to display it. It also interacts with the Router to perform navigation.

> **Entities**: It usually has Entities used by the interactor that only refer to the use cases of its own module

> **Router**: It has two functions. The first is to create the VIPER module and the second is to take care of the navigation, so it will interact with the Coordinator.

In the end, both MVC, MVP, MVVM... have their pros and cons. It is true that depending on the application to be developed, it is possible that VIPER adds "extra" classes and with an MVP, for example, it would be enough. But in the end, instead of the Interactor, we will need use cases and instead of a router that creates the module, we will need a constructor (for example) that takes care of it, so what we "gain" on the one hand, we "lose". " for the other.

#### Why Repository pattern?

I have used this pattern as it provides a very high level of abstraction. The biggest advantage is that using interfaces for the repositories makes the data layer agnostic to the application layer, meaning that if the database or the API changes, the application works exactly the same and you don't have to change ANYTHING. It's like changing the engine of a car. The wheels should not be affected.

In addition, it makes the code more testable, since it allows us to inject fake data as a dependency using its interface.

## Testing

This application mostly uses Unit Tests.

### Unit Tests with XCTest

#### What is tested?

The whole project is tested with Unit Tests, from views to repositories.

> Core
>> Factory
>>> Test that the Factory in charge of creating the view controllers creates them correctly.

>> Coordinator
>>> Test that the app navigation works correctly

> Data
>> Repository
>>> Test that all repositories connect correctly to their data provider and transform the data to that known by the domain

>> DataSource
>>> Test that the network or database requests work correctly

> Domain
>> UseCases
>>> Test the use cases work correctly

> Presentation
>> VIPER modules
>>> Test the VIPER architecture by building a test scenario that simulates the expected response to verify that the behavior is the expected.

> Resources
>> Design system
>>> Test the design system components are configurated correctly

### SnapshotTesting

The app uses SnapshotTesting to test the main views

- Home
- Favourites
- Character detail

#### Why Snapshot Testing?

SnapshotTesting is a great way to test views without running manual tests or slower, more complex and laborious UI tests.

This ensures that if there is any change in the interface it will be captured as it will compare the original image (or as it was before) to the current one.

Furthermore, you can test the interfaces for different devices in a few seconds. 

> Warning!
>> The original snapshots were taken with an iPhone 13. Therefore, in order to run the tests correctly, they must be run on an iPhone 13, otherwise errors will pop up warning that the snapshot tests could not be run

### Mocks

The project uses Mocks, Fakes and Spies to test anything. A library like "Sourcery" could have been used to generate those mocks but in the end, being a small project, it's not that necessary, and doing it manually was enough.
