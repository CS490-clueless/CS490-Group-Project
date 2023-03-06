Original App Design Project - README Template
===

# Closet App

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Your wardrobe in an app.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:**
    - Fashion
- **Mobile:**
    - iOS (Apple)
- **Story (Features):**
    - 
- **Market:**
    - The everyday person who cares about what they wear.
- **Habit:**
    - Everyday app.
- **Scope:**
    - Worldwide

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can login
* User can add an article of clothing to their account
* User can create an outfit combination
* User can view the articles of clothing in the app through the My Closet tab
* User can remove articles of clothing from their account
* User can view their clothes in categories
* User can view details of their clothing
* User can create a new account
* User can logout

**Optional Nice-to-have Stories**

* User can favorite/save their outfits
* User can randomize outfit combinations
* User can view other people's wardrobe, if they choose to make it public
* User can search for clothes online
* User can make a wishlist
* User can like other people's wardrobes

### 2. Screen Archetypes

* Login Screen
   * User can log in to their account
* Sign Up Screen
    * User can create a new account
* Outfits Screen
   * User can create an outfit consisting of an accessory, a top, a bottom, and shoes
* Details Screen
    * User can see details of the clothing including the price, the store, the date added, and mood
    * User can remove the clothing item
* Post Screen
    * User can upload an article of clothing
    * User includes a photo
* My Closet Screen
    * User can see all their clothing items by category

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Make an Outfit
* My Closet
* (Potentially) Saved Outfits

**Flow Navigation** (Screen to Screen)

* Login Screen
   * => Make an Outfit
* Register Screen
    * => Make an Outfit
* Make an Outfit
    * => Clothing Details
    * => My Closet
    * => Add New Clothing
* My Closet
   * => Clothing Details
   * => Make an Outfit
   * => Add New Clothing
* Add New Clothing
    * => Post Details

## Wireframes
![](https://i.imgur.com/Wryjwro.png)

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
