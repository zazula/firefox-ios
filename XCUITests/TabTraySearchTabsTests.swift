import XCTest

let firstURL = "mozilla.org"
let secondURL = "mozilla.org/en-US/book"
let fullFirstURL = "https://www.mozilla.org/en-US/"

class TabTraySearchTabsTests: BaseTestCase {
    /* Disble test suite since in theory it does not make sense with Chron tabs implementation
    func testSearchTabs() {
        // Open two tabs and go to tab tray
        navigator.openURL(path(forTestPage: "test-mozilla-org.html"))
        waitForTabsButton()
        navigator.openNewURL(urlString: secondURL)
        waitForTabsButton()
        navigator.goto(TabTray)

        // Search no matches
        waitForExistence(app.textFields["Search Tabs"])
        XCTAssertTrue(app.textFields["Search Tabs"].exists)
        searchTabs(tabTitleOrUrl: "foo")

        // Search by title one match
        XCTAssertEqual(app.collectionViews.cells.count, 0)
        app.buttons["close medium"].tap()
        searchTabs(tabTitleOrUrl: "Internet")
        XCTAssertEqual(app.collectionViews.cells.count, 1)

        // Search by url two matches
        app.buttons["close medium"].tap()
        searchTabs(tabTitleOrUrl: "mozilla")
        XCTAssertEqual(app.collectionViews.cells.count, 2)
    }

    private func searchTabs(tabTitleOrUrl: String) {
        waitForExistence(app.textFields["Search Tabs"])
        app.textFields["Search Tabs"].tap()
        app.textFields["Search Tabs"].typeText(tabTitleOrUrl)
    }

    func testSearchTabsPrivateMode() {
        navigator.performAction(Action.TogglePrivateMode)
        navigator.goto(NewTabScreen)
        // Open two tabs to check that the search works
        navigator.openNewURL(urlString: path(forTestPage: "test-mozilla-org.html"))
        waitUntilPageLoad()
        navigator.openNewURL(urlString: path(forTestPage: "test-example.html"))
        waitForTabsButton()
        navigator.goto(TabTray)
        searchTabs(tabTitleOrUrl: "internet")
        XCTAssertEqual(app.collectionViews.cells.count, 1)
    }
    // Test disabled because the DragAndDrop is off for master and 14.x
    /*func testDragAndDropTabToSearchTabField() {
        navigator.openURL(firstURL)
        navigator.goto(TabTray)
        waitForExistence(app.textFields["Search Tabs"])
        app.collectionViews.cells["Internet for people, not profit — Mozilla"].press(forDuration: 2, thenDragTo: app.textFields["Search Tabs"])
        waitForValueContains(app.textFields["Search Tabs"], value: "mozilla.org")
        let searchValue = app.textFields["Search Tabs"].value
        XCTAssertEqual(searchValue as! String, fullFirstURL)
    }*/

    func testSearchFieldClearedAfterVisingWebsite() {
        navigator.openURL(path(forTestPage: "test-mozilla-org.html"))
        waitForTabsButton()
        navigator.goto(TabTray)
        searchTabs(tabTitleOrUrl: "mozilla")
        app.collectionViews.cells["Internet for people, not profit — Mozilla"].tap()
        navigator.nowAt(BrowserTab)
        waitForTabsButton()
        navigator.goto(TabTray)
        let searchValue = app.textFields["Search Tabs"].value
        XCTAssertEqual(searchValue as! String, "Search Tabs")
    }*/
}
