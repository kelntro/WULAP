# WULAP Application

[![Flutter](https://img.shields.io/badge/Flutter-2.8-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-2.15-blue.svg)](https://dart.dev/)

WULAP (The Ultimate Paluwagan's Reseller Mobile Recording and Reminder App) is a Flutter Dart application designed to modernize and simplify the traditional Filipino savings practice known as Paluwagan.

## Table of Contents

- [WULAP Application](#wulap-application)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Usage](#usage)
  - [Folder Structure](#folder-structure)
  - [Dependencies](#dependencies)
  - [Contributing](#contributing)
    - [Issues and Bugs](#issues-and-bugs)
    - [Feature Requests](#feature-requests)
    - [Pull Requests](#pull-requests)
    - [Code Guidelines](#code-guidelines)
    - [Code of Conduct](#code-of-conduct)

## Features

- Record-keeping for Paluwagan contributions
- Timely reminders for participants' obligations
- Group management tools
- Secure and user-friendly interface
- Integration with Firebase for real-time data synchronization
- Hive database for local data storage
- Multi-provider state management using ChangeNotifierProvider and Provider
- Notifications and reminders using NotificationHelper

## Getting Started

Follow these instructions to get the project up and running on your local machine.

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Visual Studio Code](https://code.visualstudio.com/download)
- [Firebase Project](https://console.firebase.google.com/)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/wulap_application.git
   ```

2. Navigate to the project folder:

   ```bash
   cd wulap_application
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

## Usage

To effectively utilize the WULAP application, follow these steps:

1. **User Registration:**
   - Begin by registering your account within the app. Provide the required information to create a secure and personalized account.

2. **Create or Join a Paluwagan Group:**
   - Start a new Paluwagan group or join an existing one. Define the group's parameters and invite participants to join the savings circle.

3. **Contribution Recording:**
   - Easily record your Paluwagan contributions using the streamlined interface. Input your payment details, and let the app manage the records for you.

4. **Timely Reminders:**
   - Benefit from automatic reminders for your contribution obligations. Stay informed about upcoming payments, ensuring a smooth and organized Paluwagan experience.

5. **Group Management Tools:**
   - Explore efficient group management tools within the app. Monitor contributions, track participants, and manage the overall progress of the Paluwagan group effortlessly.

6. **Real-Time Data Synchronization:**
   - Experience seamless data synchronization with Firebase. Enjoy real-time updates, making sure all participants are on the same page regarding contributions and group activities.

7. **Local Data Storage:**
   - Utilize the Hive database for secure and efficient local data storage. Your Paluwagan records are stored locally, ensuring quick access and reliability.

8. **Multi-Provider State Management:**
   - Leverage the power of ChangeNotifierProvider and Provider for multi-provider state management. Enjoy a responsive and dynamic user interface.

9. **Notifications and Reminders:**
   - Receive notifications and reminders through the NotificationHelper feature. Stay informed about important events and deadlines related to your Paluwagan group.

## Folder Structure

Explain the organization of your project's folders. For example:

- `/lib`: Contains the Dart source code.
- `/assets`: Store static assets like images and fonts.
- `/test`: Unit and widget tests.

## Dependencies

List the main dependencies used in your project. For example:

- [Firebase](https://pub.dev/packages/firebase)
- [Hive](https://pub.dev/packages/hive)
- [Get](https://pub.dev/packages/get)

## Contributing

We welcome contributions from the community to improve and enhance the WULAP application. If you're interested in contributing, please follow these guidelines:

### Issues and Bugs

If you encounter any issues or bugs while using the application, please check the [existing issues](https://github.com/your-username/wulap_application/issues) to see if the problem has already been reported. If not, feel free to [open a new issue](https://github.com/your-username/wulap_application/issues/new) with a detailed description of the problem, including steps to reproduce it.

### Feature Requests

If you have a feature in mind that you believe would benefit the WULAP application, you can [open a new feature request](https://github.com/your-username/wulap_application/issues/new) on our GitHub repository. Provide as much detail as possible about the proposed feature and why it would be valuable.

### Pull Requests

We encourage you to contribute code improvements or new features through pull requests. To submit a pull request:

1. Fork the repository to your GitHub account.
2. Create a new branch for your changes: `git checkout -b feature-name`.
3. Make your changes and commit them with clear and concise messages.
4. Push your changes to your fork: `git push origin feature-name`.
5. Submit a pull request to the `main` branch of the main repository.

### Code Guidelines

Please adhere to the following guidelines when contributing code:

- Follow the existing coding style and conventions used in the project.
- Write clear and concise commit messages.
- Include comments in the code where necessary to explain complex sections or decisions.

### Code of Conduct

Be respectful and considerate when contributing to the WULAP project. Follow our [Code of Conduct](CODE_OF_CONDUCT.md) to ensure a positive and inclusive environment for everyone.

Thank you for considering contributing to the WULAP application!
