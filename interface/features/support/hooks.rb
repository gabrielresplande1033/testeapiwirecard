Before do
    # page.current_window.resize_to(1366, 768)
    page.driver.browser.manage.window.maximize

    
    @loginPage = LoginPage.new
    @sideBarPage = SideBarView.new
end