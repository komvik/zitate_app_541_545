# Quotes App - README

## Description

The **Quotes App** is a Flutter application that allows users to display quotes, fetch a random quote from an API, and display it on the screen. Additionally, the app provides functionality to save quotes and categories locally, so a quote can be displayed upon restarting the app. Users can also select different categories of quotes and view them based on their selection.

The app uses the following technologies:
- **Flutter**: For the user interface.
- **HTTP**: For fetching data from an API.
- **SharedPreferences**: For saving the last quote and selected category locally.

## Features

1. **Fetch Random Quote**: Clicking a button fetches a random quote from the API and displays it.
2. **Save Quotes**: The last fetched quote is saved in **SharedPreferences**, so it is displayed the next time the app is opened.
3. **Quote Categories**: Users can choose a category (e.g., "Inspirational", "Love") and view quotes from that category.
4. **Delete Quote and Category**: Users can delete the saved quote and the selected category.
5. **Load Quote on App Start**: Upon app launch, the last saved quote is loaded from SharedPreferences and displayed, if available.
