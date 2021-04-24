#!/bin/sh

#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/. */
#
# Bootstrap the Carthage dependencies. If the Carthage directory
# already exists then nothing is done. This speeds up builds on
# CI services where the Carthage directory can be cached.
#
# Use the --force option to force a rebuild of the dependencies.
# Use the --locale option to fetch and update locales only
#

getLocale()
{
  echo "Getting locale..."
  git clone https://github.com/mozilla-mobile/ios-l10n-scripts.git
  ./ios-l10n-scripts/import-locales-firefox.sh
}

if [ "$1" == "--locale" ]; then
  getLocale
  exit 0
fi

if [ "$1" == "--force" ]; then
    rm -rf firefoxios-l10n
    rm -rf ios-l10n-scripts
    rm -rf Carthage/*
    rm -rf ~/Library/Caches/org.carthage.CarthageKit
fi

# Import locales
if [ -d "/firefoxios-l10n" ] && [ -d "/ios-l10n-scripts" ]; then
    echo "l10n directories found. Not downloading scripts."
else
    echo "l10n directory not found. Downloading repo and scripts."
    getLocale
fi

# Run carthage
#./carthage_command.sh
./carthage.sh build --platform iOS

# Install Node.js dependencies and build user scripts
npm install
npm run build

(cd content-blocker-lib-ios/ContentBlockerGen && swift run)
