/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import Leanplum
import Shared

struct LPVariables {
    // Variable Used for New Tab Button AB Test
    static var newTabButtonABTest = LPVar.define("newTabButtonABTestProd", with: false)
    // Variable Used for Chron tabs AB Test
    static var chronTabsABTest = LPVar.define("chronTabsABTestProd", with: false)
}
