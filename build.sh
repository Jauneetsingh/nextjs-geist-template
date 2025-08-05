#!/bin/bash

# Build script for ExpenseTracker iOS App
# This script should be run on macOS with Xcode installed

echo "Building ExpenseTracker iOS App..."

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Error: This app requires macOS with Xcode to build."
    echo "Please transfer these files to a Mac and run this script there."
    exit 1
fi

# Check if Xcode is installed
if ! command -v xcodebuild &> /dev/null; then
    echo "Error: Xcode is not installed or xcodebuild is not in PATH."
    echo "Please install Xcode from the Mac App Store."
    exit 1
fi

# Build for iOS Simulator
echo "Building for iOS Simulator..."
xcodebuild -project ExpenseTracker.xcodeproj \
           -scheme ExpenseTracker \
           -destination 'platform=iOS Simulator,name=iPhone 15' \
           clean build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo "To run the app:"
    echo "1. Open ExpenseTracker.xcodeproj in Xcode"
    echo "2. Select iPhone 15 simulator or your connected device"
    echo "3. Press Cmd+R to run"
else
    echo "❌ Build failed. Please check the errors above."
    exit 1
fi
