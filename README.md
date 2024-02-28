# HomeTasckPipedrive Application 🏡📲
## Key Features:
- List screen displaying people obtained from Pipedrive API.
- Detail screen for each person accessible from the list screen.
- Proper handling empty data such as receiving contacts with no names, missing phone numbers or missing emails, images, etc.
- Offline support: storing received data in CoreData.
- Unit tests: check for successful receipt of API data.
- Asynchronous programming using async/await for better performance and responsiveness.
  
## Requirements
- **iOS Platform:** iOS 17.2
- **Swift Version:** Swift 5.9
- **Xcode Version:** Xcode 15.0
- **Dependency Manager:** Swift Package Manager (SPM)


## Installation
**Instal project:** 
1. Clone the repository: https://github.com/Anastasiia741/HometaskPipedriveApp.git
2. Navigate to the project folder: cd HometaskPipedrive
3. Open the project in Xcode: open HometaskPipedrive.xcodeproj
4. Press `Cmd + R` to run the application.

**Replace token:**
1. Open the project in XCode or in the HometaskPipedrive folder
2. Find the `ApiConstants` file
3. In the `apiKey` constant, replace the API token with yours.
4. A new token will apply in the `ApiRequest` file

## MVP Architecture

This project adopts the Model-View-Presenter (MVP) architecture to application logic.

