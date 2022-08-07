Shopping

Table of Contents
-----

- [Setup](#Setup)
- [Project Architecture](#project-architecture)
- [Project Structure](#project-structure)
- [Unit Test](#unit-test)
- [Features](#features)
- [Things to Do](#things-to-do)
- [Dependency Management](#dependency-management)
- [List of Frameworks](#list-of-frameworks)


## Setup
- Run` pod install` on terminal. (If your cocoapods repository is not up to date please run `pod repo update` first.)
- The open ShoppingApp.xcworkspace and run.

## Project Architecture

The app's architecture is MVVM + Repository Pattern. Let's see in a simple usage,
    
    View
        -> ViewModel
            -> Repository 
                    -> Service (RemoteService)
                        -> BaseService
                        
- **ViewModel**: Receives user actions from View and handles it. ViewModel holds the View's state. Interacts with repositories. 
- **Repository**: Gets data from RemoteService and converts it to UIModel then sends it to the ViewModel. It could also get data from local storage as well. In that case, related LocalServices (i.e. ProductSearchLocalService) must be added into this class. 
- **RemoteService**: Gets data from remote and propagates it back to it's requester.


## Project Structure

| Folder        | Description                                                     |
|-------------------------|-------------------------------------------------------|
|**AppDelegateServices**|  Services that are dependent on AppDelegate will be defined here.|
|**DependencyInjections**| Dependency registrations will be defined here.|
|**Application**| Application specific classes will be defined here.|
|**Core**| Utility code that are not specific to this App will be defined here |

Structure of **Application** folder: 

| Folder        | Description                                                     |
|-------------------------|-------------------------------------------------------|
|**Network**| Anything related with remote connection and endpoints will be defined here.|
|**Modules**| Includes user faced part of the app. Mostly views.|
|**Data**| Includes all data integration classes. Also UIModels and back-end response models will be defined here.|

## Unit Test
You can find unit tests under ShoppingAppTests. Current test coverage is %53.9.

## Features
Basic functionalities are explained here.

| Feature             | Description                                          | View |
|-------------------------|-------------------------------------------------------|---------------------|
|**Product Search**| Lists all the results of products returned after searching with a keyword. |ProductSearchView|

## Things to do
- Better error handling and mapping to show users more friendly errors. 

## Dependency Management

Cocoapods is the dependency manager for this project.


## List of Frameworks
| Dependency             | Description                                          |
|-------------------------|-------------------------------------------------------|
|**Resolver**| Dependency Injection / Service Locator framework|
