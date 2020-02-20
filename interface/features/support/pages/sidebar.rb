class SideBarView
    include Capybara::DSL

    def logo
        find('.navbar-inner')
    end
end