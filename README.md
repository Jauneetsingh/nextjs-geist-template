# Expense Tracker iOS App

An iOS app that tracks expenses and earnings by reading transaction messages and providing manual categorization options.

## Features

- Automatic transaction parsing from notification messages
- Manual transaction categorization with popup interface
- Transaction list with spending overview
- Support for both spending and earning transactions
- Category-based organization
- Sample data for testing

## Requirements

- **macOS** (required for iOS development)
- **Xcode 15.0+** from Mac App Store
- **iOS 17.0+** target device or simulator
- **Swift 5.0+**

## ⚠️ Important Note

This is a **native iOS app** that requires **macOS and Xcode** to build and run. It cannot be built on Linux or Windows systems.

## How to Build and Run

### Quick Start (Recommended)

1. **Transfer to macOS**: If you're not on macOS, transfer all project files to a Mac computer

2. **Run the build script**:
   ```bash
   ./build.sh
   ```

3. **Open in Xcode**:
   ```bash
   open ExpenseTracker.xcodeproj
   ```

4. **Run the app**: Press `Cmd + R` in Xcode

### Manual Build Steps

#### Method 1: Using Xcode (Easiest)

1. **Install Xcode** from the Mac App Store (free)

2. **Open the project**:
   ```bash
   open ExpenseTracker.xcodeproj
   ```

3. **Select target**:
   - Choose "iPhone 15" simulator from device dropdown
   - Or connect your iPhone and select it

4. **Build and run**:
   - Press `Cmd + R` or click the ▶️ button
   - App will build and launch automatically

#### Method 2: Command Line Build

```bash
# Build for simulator
xcodebuild -project ExpenseTracker.xcodeproj \
           -scheme ExpenseTracker \
           -destination 'platform=iOS Simulator,name=iPhone 15' \
           build

# Run simulator
xcrun simctl boot "iPhone 15"
```

#### Method 3: Install on Physical iPhone

1. **Connect iPhone** via USB cable
2. **Trust computer** when prompted on iPhone
3. **Add Apple ID** in Xcode → Settings → Accounts
4. **Select your device** in Xcode device dropdown
5. **Set development team** in project settings
6. **Build and run** with `Cmd + R`

## App Features & Usage

### Sample Data
The app includes sample transactions for testing:
- Coffee and sandwich ($25.50 - Food)
- Monthly salary ($1200.00 - Salary) 
- Bus fare ($15.75 - Transport)

### Core Functionality
1. **View Transactions**: Main screen shows all transactions with amounts and categories
2. **Edit Transactions**: Tap any transaction to edit description and category
3. **Automatic Parsing**: Processes notification messages for transaction data
4. **Manual Categories**: Food, Transport, Shopping, Salary, Others

## Project Structure

```
ExpenseTracker/
├── ExpenseTrackerApp.swift           # SwiftUI app entry point
├── Models/
│   ├── Transaction.swift            # Transaction data model
│   └── Category.swift              # Category data model  
├── Views/
│   ├── TransactionListView.swift   # Main transaction list (NavigationStack)
│   └── TransactionDetailView.swift # Transaction editing modal
├── Services/
│   ├── MessageParser.swift         # Regex-based message parsing
│   └── MessageListener.swift       # Notification handling
└── Info.plist                     # App permissions & config
```

## Troubleshooting

### "Build is failing" Issues

**Common Solutions:**
1. **Clean build**: `Product → Clean Build Folder` in Xcode
2. **Restart Xcode**: Quit and reopen Xcode completely  
3. **Reset simulator**: `Device → Erase All Content and Settings`
4. **Update Xcode**: Ensure you have the latest version
5. **Check file paths**: Ensure all Swift files are in `ExpenseTracker/` folder

**Specific Error Fixes:**
- **"Cannot find 'Transaction' in scope"**: Files not properly added to Xcode project
- **"presentationMode deprecated"**: Fixed in current code (uses `@Environment(\.dismiss)`)
- **"NavigationView deprecated"**: Fixed in current code (uses `NavigationStack`)

### Permission Issues
- Grant notification permissions when prompted
- Check Settings → ExpenseTracker → Notifications
- Restart app after granting permissions

### Device Installation Issues  
- Add Apple ID in Xcode → Settings → Accounts
- Select development team in project "Signing & Capabilities"
- Ensure device is unlocked and trusted

### System Requirements
- **macOS only** - Cannot build on Linux/Windows
- **Xcode required** - Free from Mac App Store
- **iOS 17.0+** - For target device/simulator

## Development Notes

- Uses modern SwiftUI with `NavigationStack` and `@Environment(\.dismiss)`
- Includes sample data for immediate testing
- Message parsing supports Rs./INR currency formats
- Notification-based message reading (iOS security compliant)
- Ready for Core Data integration for persistence

## Next Steps

- Add Core Data for persistent storage
- Implement more sophisticated message parsing patterns  
- Add spending analytics and charts
- Support for multiple currencies
- Export functionality for transaction data
- Integration with iOS Shortcuts for better message access
