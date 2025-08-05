# Expense Tracker iOS App

An iOS app that tracks expenses and earnings by reading transaction messages and providing manual categorization options.

## Features

- Automatic transaction parsing from notification messages
- Manual transaction categorization with popup interface
- Transaction list with spending overview
- Support for both spending and earning transactions
- Category-based organization

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.0+

## How to Build and Run

### Method 1: Using Xcode (Recommended)

1. **Install Xcode** from the Mac App Store if you haven't already

2. **Open the project** in Xcode:
   ```bash
   open ExpenseTracker.xcodeproj
   ```

3. **Select a target device**:
   - Choose "iPhone 15" or any iOS simulator from the device dropdown
   - Or connect a physical iPhone and select it

4. **Build and run**:
   - Press `Cmd + R` or click the "Play" button
   - The app will build and launch on your selected device/simulator

### Method 2: Using Command Line

1. **Build the project**:
   ```bash
   xcodebuild -project ExpenseTracker.xcodeproj -scheme ExpenseTracker -destination 'platform=iOS Simulator,name=iPhone 15' build
   ```

2. **Run on simulator**:
   ```bash
   xcrun simctl boot "iPhone 15"
   xcodebuild -project ExpenseTracker.xcodeproj -scheme ExpenseTracker -destination 'platform=iOS Simulator,name=iPhone 15' run
   ```

### Method 3: Install on Physical Device

1. **Connect your iPhone** to your Mac via USB
2. **Trust the computer** on your iPhone when prompted
3. **Select your device** in Xcode's device dropdown
4. **Add Apple Developer Account** (if not already added):
   - Go to Xcode → Preferences → Accounts
   - Add your Apple ID
5. **Set Development Team**:
   - Select your project in Xcode
   - Go to "Signing & Capabilities"
   - Select your development team
6. **Build and run** with `Cmd + R`

## App Permissions

The app requires notification permissions to read transaction messages. When you first run the app, it will request permission to access notifications.

## Usage

1. **Grant Permissions**: Allow notification access when prompted
2. **View Transactions**: The main screen shows all your transactions
3. **Categorize**: Tap on any transaction to manually categorize it
4. **Add Manual Entries**: Use the interface to add transactions manually

## Project Structure

```
ExpenseTracker/
├── ExpenseTrackerApp.swift      # Main app entry point
├── Models/
│   ├── Transaction.swift        # Transaction data model
│   └── Category.swift          # Category data model
├── Views/
│   ├── TransactionListView.swift    # Main transaction list
│   └── TransactionDetailView.swift  # Transaction editing
├── Services/
│   ├── MessageParser.swift     # Message parsing logic
│   └── MessageListener.swift   # Notification handling
└── Info.plist                 # App configuration
```

## Troubleshooting

### Build Errors
- Make sure you have the latest Xcode version
- Clean build folder: `Product → Clean Build Folder`
- Reset simulator: `Device → Erase All Content and Settings`

### Permission Issues
- Check notification permissions in Settings → ExpenseTracker
- Restart the app after granting permissions

### Device Installation Issues
- Ensure your Apple ID is added to Xcode
- Check that your device is trusted and unlocked
- Verify your development team is selected in project settings

## Next Steps

- Add Core Data for persistent storage
- Implement more sophisticated message parsing patterns
- Add spending analytics and charts
- Support for multiple currencies
- Export functionality for transaction data
