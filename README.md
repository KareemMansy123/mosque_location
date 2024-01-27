# Mosque Locator App

The Mosque Locator App is a Flutter application that helps users find and explore the nearest mosques within a 3000 km radius. It utilizes a free API to fetch a list of nearby mosques and displays them in a user-friendly manner. This app also integrates with Mapbox, a free map service, to provide users with a visual representation of mosque locations on a map.

## Features

- List View: Displays a list of the nearest mosques with essential information.
- Map View: Visualizes mosque locations on a map using Mapbox.
- Mosque Details: Provides detailed information about a selected mosque.
- Navigation: Allows users to navigate to the selected mosque's location using Google Maps.

## How to Use

1. Install the Flutter framework on your development environment.

2. Clone this repository to your local machine.

3. Add your Mapbox API access token to the `.env` file in the project root directory.


4. Run the app on your preferred Flutter development platform (iOS/Android).

5. The app will automatically fetch the nearest mosques and display them in a list.

6. Click on a mosque item to view its location on the map.

7. Tap on the mosque's map marker to see more details and navigate to it using Google Maps.

## Requirements

- Flutter: You need to have Flutter installed on your system to run this app.

## Dependencies

- Flutter Packages:
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv): Used to manage environment variables.
- [geolocator](https://pub.dev/packages/geolocator): Provides location services for fetching device coordinates.
- [mapbox_gl](https://pub.dev/packages/mapbox_gl): Integrates Mapbox maps into the app.
- [url_launcher](https://pub.dev/packages/url_launcher): Launches URLs in external apps (e.g., Google Maps).

## Credits

- [Mapbox](https://www.mapbox.com/): The map service used in this app.
- [Free Mosque API](https://example.com/mosque-api): The API source for mosque data.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Note:** Replace `your_access_token_here` in the `.env` file with your actual Mapbox API access token.

Happy mosque exploring!

