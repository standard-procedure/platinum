# Platinum

UI toolkit built on Phlex::Rails and TailwindCSS for building 

## Installation

```bash
bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG
```

(At some point soon this will be automated)

Install `Phlex::Rails` then change the `Components::Base` class that it generates to extend from `Platinum::Base`.  

Copy the `Platinum::Theme` file to `app/components` and rename it to `Components::Theme`, making it extend `Platinum::Theme`.  This is necessary because Tailwind scans your source code for the class names that are in use and strips out the ones it does not see referenced any where.  

Add a `before_action` to your `ApplicationController`  to load the theme:

```ruby
module Theme
  extend ActiveSupport::Concern

  included do
    before_action :load_theme
  end

  private def load_theme = Components::Theme.load
end
```
You can also override the default theme configuration at this point.  

In the `config/initializers/phlex.rb` file load your Icon mapping file:

```ruby
Rails.application.config.after_initialize do
  Platinum::Icon.icon_map = YAML.load(File.open(Rails.root.join("config", "icons.yml")))
end
```

Copy and install the `platinum_layout.js`, `delayed_close.js`, `drawer.js` and `search_form.js` stimulus controllers into your `app/javascript/controllers` folder.

Add `@stimulus-components/password-visibility` and `@stimulus-components/clipboard` to your javascript bundle or import-map

Update `app/javascript/controllers/index.js` to reference all those components: 

```javascript
import { application } from "./application"

import Clipboard from "@stimulus-components/clipboard"
application.register("clipboard", Clipboard)
import DelayedClose from "./delayed_close"
application.register("delayed-close", DelayedClose)
import Drawer from "./drawer"
application.register("drawer", Drawer)
import PasswordVisibility from "@stimulus-components/password-visibility"
application.register("password-visibility", PasswordVisibility)
import PlatinumLayout from "./platinum_layout"
application.register("platinum-layout", PlatinumLayout)
import SearchForm from "./search_form"
application.register("search-form", SearchForm)
```


## Usage

The two key components are the [Platinum::Page](/lib/platinum/page.rb) and [Platinum::Theme](/lib/platinum/theme.rb).

The page is designed to render correctly on both small (mobile) and large (desktop) screens, switching gracefully between the two.  

The page is divided into several areas:  

- `html_head` - the page HEAD, with a `default_head` provided
- `title_bar` - the central area of the page header
- `sidebar` - the application's primary navigation which appears as a sidebar on large screens and a drop-down menu on small screens
- `breadcrumb` - navigation helpers showing where the user is within the application hierarchy - you can add as many breadcrumbs as needed to a page
- `profile` - a link to the logged in user's profile page
- `sign_out` - a link or button to sign out the current user
- `filter` - links that refine the current view (such as categories) or are used as secondary navigation - you can add as many filters as needed to a page
- `toolbar` - collections of buttons to perform actions to the current page - you can add as many toolbars as needed to a page
- `search` - a search field that allows the user to refine what is displayed on the page
- `pagination` - a pagination control for moving through lists of items
- plus the main page contents

For example, a page that lists many documents may look like this:

```ruby
class DocumentsPage < Components::Base
  # ... 
  def view_template(&)
    Platinum::Page(t(".documents")) do |page|
      page.title_bar { Icon("documents", text: t(".documents")) }
      page.breadcrumb { a(href: admin_documents_path) { Icon("documents", text: (t(".documents") } }
      page.sidebar { Admin::SideMenu(user: @user) }
      page.toolbar { draw_documents_toolbar }
      page.profile { a(href: profile_path) { Icon("user", text: @user.to_s) } }
      page.sign_out { User::SignOutButton(user: @user) }
      document_categories.each do |category|
        page.filter { draw_document_category_link(category) }
      end
      page.search { Form::Search(admin_documents_path, @search) }
      page.pagination { draw_pagination_control } 

      # main contents ...
      draw_documents_list
    end
  end
  # ... 
end
```

And the page for showing an individual document like this:

```ruby
class DocumentPage < Components::Base
  # ... 
  def view_template(&)
    Platinum::Page(@document.to_s) do |page|
      page.title_bar { Icon("document", text: @document.to_s) }
      page.breadcrumb { a(href: admin_documents_path) { Icon("documents", text: (t(".documents") } }
      page.breadcrumb { a(href: admin_document_path(@document)) { Icon("documents", text: (t(".documents") } }
      page.sidebar { Admin::SideMenu(user: @user) }
      page.toolbar { draw_live_toolbar } if !@document.archived?
      page.toolbar { draw_archived_toolbar } if @document.archived?
      page.profile { a(href: profile_path) { Icon("user", text: @user.to_s) } }
      page.sign_out { User::SignOutButton(user: @user) }

      # main contents ...
      draw_document_contents
    end
  end
  # ... 
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rahoulb/platinum. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/rahoulb/platinum/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Platinum project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rahoulb/platinum/blob/master/CODE_OF_CONDUCT.md).
