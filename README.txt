# Disneyland Explorer

## Current Overview - Application is In-Progress
**Disneyland Explorer** is an iOS app built using SwiftUI. It provides a Disneyland-themed user interface with a sign-up, sign-in flow, and a home page experience.
The app also features a landing page for new users, guiding them to create an account or log in.

## Project Structure
The project consists of several SwiftUI views:

- **ContentView**: The entry point of the app, controlling navigation between the landing page, sign-in, and home page based on app state.
- **LandingView**: The initial screen shown to first-time users, with a prompt to sign up or sign in.
- **SignUpPageView**: A sign-up form where new users input personal details to create an account.
- **SignInView**: A log-in form for returning users.
- **HomePageView**: The main home page that users are taken to after authentication.

## Features

### ContentView
- `@State var isFirstLaunch`: Determines if the app is being opened for the first time, showing the landing page.
- `@State var isLoggedIn`: Tracks if the user is logged in and navigates accordingly.

### LandingView
- Displays a welcome message ("Disney Explorer") with a **Get Started** button, leading to the sign-up page.
- Styled with a gradient background and modern design, the page provides a navigation link to other screens.

### SignUpPageView
- A registration form where new users enter their first name, last name, email, password, and date of birth.
- Basic validation ensures required fields are filled before proceeding.
- Navigates to **HomePageView** after successful sign-up.

### SignInView
- A log-in form where users input their email and password.
- The **Sign In** button redirects to the home page on successful login.

### HomePageView
- Displays the text **Home Page View** as a placeholder. This screen will contain future home page content.

## How to Run the App
To run the app locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/disneyland-explorer.git
