# How to Install Expense Tracker App on Your iPhone

## Prerequisites

1. **Mac computer** with macOS (required)
2. **Xcode** installed from Mac App Store (free)
3. **iPhone** with iOS 17.0 or later
4. **USB cable** to connect iPhone to Mac
5. **Apple ID** (free Apple account)

## Step-by-Step Installation Guide

### Step 1: Prepare Your Mac

1. **Install Xcode** (if not already installed):
   - Open Mac App Store
   - Search for "Xcode"
   - Click "Get" or "Install" (it's free but large ~15GB)
   - Wait for installation to complete

2. **Add your Apple ID to Xcode**:
   - Open Xcode
   - Go to `Xcode → Settings → Accounts`
   - Click the `+` button
   - Select "Apple ID"
   - Sign in with your Apple ID

### Step 2: Prepare Your iPhone

1. **Connect iPhone to Mac**:
   - Use USB cable to connect iPhone to Mac
   - Unlock your iPhone

2. **Trust the computer**:
   - On iPhone, you'll see "Trust This Computer?" popup
   - Tap "Trust"
   - Enter your iPhone passcode if prompted

3. **Enable Developer Mode** (iOS 16+):
   - On iPhone: Settings → Privacy & Security → Developer Mode
   - Toggle "Developer Mode" ON
   - Restart iPhone when prompted
   - After restart, confirm enabling Developer Mode

### Step 3: Open Project in Xcode

1. **Navigate to project folder** on your Mac
2. **Double-click** `ExpenseTracker.xcodeproj` to open in Xcode
3. **Wait** for Xcode to load the project

### Step 4: Configure Project for Your Device

1. **Select your iPhone**:
   - In Xcode toolbar, click the device dropdown (next to the play button)
   - Select your iPhone from the list (it should appear under "iOS Device")

2. **Set up signing**:
   - In Xcode, click on "ExpenseTracker" project in left sidebar
   - Select "ExpenseTracker" target
   - Go to "Signing & Capabilities" tab
   - Check "Automatically manage signing"
   - Select your Apple ID team from dropdown
   - Xcode will automatically create a provisioning profile

### Step 5: Build and Install

1. **Build and run**:
   - Press `Cmd + R` or click the ▶️ play button
   - Xcode will build the app and install it on your iPhone
   - This may take a few minutes the first time

2. **If you see "Developer App" warning on iPhone**:
   - Go to iPhone Settings → General → VPN & Device Management
   - Find your Apple ID under "Developer App"
   - Tap on it and tap "Trust [Your Apple ID]"
   - Confirm by tapping "Trust"

### Step 6: Test the App

1. **Launch the app** on your iPhone
2. **Grant permissions** when prompted:
   - Allow notifications (for message reading feature)
3. **Test features**:
   - View sample transactions
   - Tap on transactions to edit categories
   - Test the categorization popup

## Troubleshooting Common Issues

### "Could not launch" or "Failed to install"
- **Solution**: Clean build folder in Xcode (`Product → Clean Build Folder`)
- Disconnect and reconnect iPhone
- Restart Xcode

### "Untrusted Developer" on iPhone
- **Solution**: Go to iPhone Settings → General → VPN & Device Management
- Trust your Apple ID under Developer App section

### "No provisioning profiles found"
- **Solution**: Make sure you're signed in to Xcode with your Apple ID
- Check "Automatically manage signing" in project settings
- Try changing the Bundle Identifier to something unique (e.g., add your initials)

### iPhone not appearing in Xcode
- **Solution**: 
  - Make sure iPhone is unlocked and trusted
  - Try different USB cable
  - Restart both iPhone and Mac
  - Check iPhone is in Developer Mode (Settings → Privacy & Security → Developer Mode)

### "This app cannot be installed because its integrity could not be verified"
- **Solution**: 
  - Delete the app from iPhone if it exists
  - In Xcode: Product → Clean Build Folder
  - Build and install again

## Alternative: TestFlight Distribution

If direct installation doesn't work, you can use TestFlight:

1. **Archive the app**:
   - In Xcode: Product → Archive
   - Wait for archive to complete

2. **Upload to App Store Connect**:
   - Click "Distribute App"
   - Select "App Store Connect"
   - Follow the upload process

3. **Add to TestFlight**:
   - Go to App Store Connect website
   - Add the build to TestFlight
   - Invite yourself as a tester

4. **Install via TestFlight**:
   - Install TestFlight app on iPhone
   - Accept the invitation
   - Install the app through TestFlight

## Testing the Message Reading Feature

Since iOS restricts direct SMS access, the app uses notifications:

1. **Grant notification permissions** when prompted
2. **Test with sample data** (already included in the app)
3. **For real message testing**:
   - Forward bank SMS to email
   - Copy transaction text and paste into a note
   - Use iOS Shortcuts to process messages (advanced setup)

## Next Steps After Installation

1. **Test all features** thoroughly
2. **Check notification permissions** in iPhone Settings
3. **Provide feedback** on any issues or improvements needed
4. **Consider adding Core Data** for persistent storage
5. **Explore iOS Shortcuts integration** for better message access

## Support

If you encounter issues:
1. Check the main README.md for additional troubleshooting
2. Ensure all system requirements are met
3. Try the alternative TestFlight method if direct installation fails
4. Make sure your iPhone iOS version is 17.0 or later
