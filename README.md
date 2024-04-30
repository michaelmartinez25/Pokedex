MichaelDex: IOS101 Capstone Project
===

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

MichaelDex is the Pokedex that accompanies you in the Pokemon games, starting with the original Red and Blue. Unlock information about the first 151 Pokemon, such as types and stat totals (more info to come)! 

This app is an unofficial app and is NOT affiliated, endorsed, or supported by Nintendo, GAME FREAK, or The Pokemon Company in any way. Some images use in this app are copyrighted and belong to Nintendo, GAME FREAK, or The Pokemon Company. They are used in this app in accordance with the laws of Fair Use, for the United States of America, or of the intellectual property code, for France. Pokemon and Pokemon character names are trademarks of Nintendo. No copyright infringement intended. Pokemon &copy; 2002-2024 Pokemon. &copy; 1995-2024 Nintendo/Creatures Inc./GAME FREAK inc.

### App Evaluation

- **Description**: Serves as a companion app for players of Pokemon Red and Pokemon Blue. The app will include information about all 151 Pokemon, including sprites, movesets, locations, and evolution methods.
- **Category**: Entertainment
- **Mobile**: Like the Pokedex is a mobile device in the games, this app will serve as a companion app that can be open while you play. Users can use the camera to take a snapshot of a Pokemon to retrieve its information. Users will also be able to unlock more information by registering Pokemon as captured.
- **Story**: This app provides a fresh experience for Pokemon players, as this app provides an immersive, in-game-like experience. The unlock-as-you-play mode is entirely optional, serving users who want a fresh experience or a traditional experience where all information is displayed. 
- **Market**: Pokemon is one of the most popular and widely-played video games. This app is for users who want an fun, gamified way to keep track of their Pokedex progress. This app will also serve users who want a traditional experience where all the info they need is at their fingertips.
- **Habit**: Users will likely open and use this app as they play Pokemon Red/Blue. This app can help users keep track of the many Pokemon they encounter throughout their journey.
- **Scope**: This app will be technically challenging, as it requires the use of APIs, camera functionality, and be able to identify Pokemon from an image. A stripped-down version of the app may look like a traditional Pokedex app without the unlock-as-you-play mode implemented, which is still very useful.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] User can view information about a single Pokemon.
- [x] User can view a list of Pokemon.

**Optional Nice-to-have Stories**

- [x] User can snap a photo of a Pokemon to view info about them.
- [ ] User can search for specific locations to view what Pokemon inhabit that area.
- [ ] User can create Pokemon parties of six to keep track of their team.
- [ ] User can search for Pokemon.
- [ ] User can switch between "Standard" and "Unlock-As-You-Play" modes.
- [ ] User can mark a Pokemon as "Captured."
    - [ ] When captured, more information will appear in the Unlock-As-You-Play Mode.

### 2. Screen Archetypes

- [ ] Pokemon Info Screen
* User can view information about a single Pokemon.
- [ ] Home Screen
* User can view a list of all Pokemon.
* User can search for a specific Pokemon.
- [ ] Snapshot Screen
* User can take a photo of a Pokemon to view information about them.
- [ ] Team Builder Screen
* User can create a party of up to six Pokemon.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Search
* Snapshot
* Team Builder

**Flow Navigation** (Screen to Screen)

- [ ] Pokemon Info Screen
* => Home
* => Snapshot
* => Team Builder
- [ ] Home Screen
* => Pokemon Info
- [ ] Snapshot Screen
* => Pokemon Info
- [ ] Team Builder
* => Pokemon Info

## Wireframes

![Pokedex Wireframe](https://github.com/michaelmartinez25/Pokedex/assets/112640847/cc8911de-6c14-4765-827d-42be90d41973)

## Video Walkthrough

[Video Demo](https://youtu.be/sihYZrut9C4)

### Models

[Add table of models]

### Networking

- PokeAPI: Used to retrieve Pokemon game data
- Google Generative AI: Used to identify Pokemon from images in Snapshot mode
