# frozen_string_literal: true

class Platinum::Page < Platinum::Slotted
  include Phlex::Rails::Helpers::CSRFMetaTags
  include Phlex::Rails::Helpers::CSPMetaTag
  include Phlex::Rails::Helpers::StylesheetLinkTag
  include Phlex::Rails::Helpers::JavascriptIncludeTag
  include Phlex::Rails::Helpers::T
  include Phlex::Rails::Helpers::ClassNames

  def initialize page_title, home_url: "/"
    @page_title = page_title
    @html_head = nil
    @title_bar = nil
    @home_url = home_url

    @sidebar = nil
    @breadcrumbs = []
    @profile = nil
    @sign_out = nil

    @toolbars = []
    @filters = []
    @search = nil
    @pagination = nil

    Platinum::Page.current = self
  end

  def html_head(&contents) = @html_head = contents

  def title_bar(&contents) = @title_bar = contents

  def sidebar(&contents) = @sidebar = contents

  def breadcrumb(&contents)
    @breadcrumbs << contents if vanishing
  end

  def profile(&contents) = @profile = contents

  def sign_out(&contents) = @sign_out = contents

  def filter(&contents)
    @filters << contents if vanishing
  end

  def toolbar(&contents)
    @toolbars << contents if vanishing
  end

  def search(&contents) = @search = contents

  def pagination(&contents) = @pagination = contents

  def view_template(&)
    doctype
    html do
      head { render_head }
      body class: theme.body, data: {controller: "platinum-layout"} do
        render_sidebar
        main(class: theme.main) do
          Flash()
          yield
        end
        header class: theme.header do
          render_mobile_header
          render_desktop_header
        end
        footer class: theme.footer do
          render_mobile_footer
          render_desktop_footer
        end
      end
    end
  end

  private def render_head
    title { @page_title }
    csrf_meta_tags
    csp_meta_tag
    meta name: "viewport", content: "width=device-width,initial-scale=1,user-scalable=no"
    meta name: "apple-mobile-web-app-capable", content: "yes"
    meta name: "mobile-web-app-capable", content: "yes"
    meta name: "view-transition", content: "same-origin"
    meta name: "turbo-refresh-method", content: "morph"
    meta name: "turbo-refresh-scroll", content: "preserve"
    stylesheet_link_tag :app, "data-turbo-track": "reload"
    javascript_include_tag "application", "data-turbo-track": "reload", type: "module"
    @html_head.nil? ? default_head : @html_head.call
  end

  private def render_sidebar
    aside class: theme.sidebar_container, data: {platinum_layout_target: "sidebar"} do
      Platinum::Column(justify: "start", class: "flex-1") { @sidebar&.call }
      Platinum::Column(justify: "end", class: "shrink-0") do
        Platinum::Row(justify: "between", items: "end", gap: 4, class: theme.sidebar_separator) do
          figure(&@profile)
          figure(&@sign_out)
        end
      end
    end
  end

  private def render_mobile_header
    nav class: theme.mobile_nav do
      a(href: @home_url, class: theme.link) { Icon(theme.home_icon) }
      h1(class: %w[flex-1 text-center]) { render_title_bar }
      Platinum::DrawerButton(position: "right") do |drawer|
        drawer.icon { Icon(theme.navigation_icon) }
        div(data: {platinum_layout_target: "mobileBreadcrumbs"})
        div(data: {platinum_layout_target: "mobileSidebar"})
      end
    end
  end

  private def render_mobile_footer
    nav class: theme.mobile_nav do
      Platinum::Row(justify: "start", direction: :scrolling_row, class: "flex-1") do
        render_pagination
        render_mobile_search_button
      end
      Platinum::Row(justify: "end", direction: :scrolling_row, class: "shrink-0") do
        render_mobile_filters_button
        render_mobile_toolbars_button
      end
    end
  end

  private def render_desktop_header
    nav class: theme.desktop_nav do
      div class: %w[flex flex-row gap-2 justify-between items-start] do
        div class: %w[flex flex-row justify-start items-start flex-1] do
          a(href: @home_url, class: %w[shrink-0] + theme.link) do
            Icon(theme.home_icon)
          end
          span(class: %w[shrink-0], data: {platinum_layout_target: "breadcrumbs"}) { render_breadcrumbs }
          span(class: %w[flex-1]) { render_title_bar }
        end
        div class: %w[shrink-0], data: {platinum_layout_target: "search"} do
          render_search
        end
      end
    end
  end

  private def render_desktop_footer
    nav class: %w[flex flex-row gap-2 justify-between items-end] do
      render_pagination
      div class: %w[flex flex-row justify-end items-end grow-1] do
        span(data: {platinum_layout_target: "filters"}) { render_filters }
        span(data: {platinum_layout_target: "toolbars"}) { render_toolbars }
      end
    end
  end

  private def render_breadcrumbs
    div class: %w[flex flex-row justify-start items-start gap-1 flex-wrap] do
      @breadcrumbs.each do |breadcrumb|
        span { Platinum::Breadcrumb(&breadcrumb) }
      end
    end
  end

  private def render_mobile_toolbars_button
    Platinum::DrawerButton(position: "bottom", hidden: @toolbars.empty?) do |drawer|
      drawer.icon { Icon(theme.toolbar_icon) }
      Platinum::Column() do
        div(data: {platinum_layout_target: "mobileToolbars"})
      end
    end
  end

  private def render_mobile_filters_button
    Platinum::DrawerButton(position: "bottom", hidden: @filters.empty?) do |drawer|
      drawer.icon { Icon(theme.filter_icon) }
      div(data: {platinum_layout_target: "mobileFilters"})
    end
  end

  private def render_mobile_search_button
    Platinum::DrawerButton(position: "bottom", hidden: @search.nil?) do |drawer|
      drawer.icon { Icon(theme.search_icon) }

      div(data: {platinum_layout_target: "mobileSearch"})
    end
  end

  private def render_filters
    @filters.each do |filter|
      figure(class: theme.filter_container, &filter)
    end
  end

  private def render_search = span(class: theme.search_container, &@search)

  private def render_pagination = span(class: theme.pagination_container, &@pagination)

  private def render_toolbars
    @toolbars.each do |toolbar|
      figure(class: theme.toolbar_container, &toolbar)
    end
  end

  private def render_title_bar
    @title_bar.nil? ? @page_title.to_s : @title_bar.call
  end

  private def default_head
    # link rel: "manifest", href: pwa_manifest_path(format: :json)
    link rel: "icon", href: "/icon.png", type: "image/png"
    link rel: "icon", href: "/icon.svg", type: "image/svg+xml"
    link rel: "apple-touch-icon", href: "/icon.png"
    link rel: "stylesheet", href: "https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css"
  end

  class << self
    def current = Thread.current[:platinum_page]

    def current=(value)
      Thread.current[:platinum_page] = value
    end
  end
end
