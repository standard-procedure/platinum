# frozen_string_literal: true

class Platinum::Page < Platinum::Slotted
  include Phlex::Rails::Helpers::CSRFMetaTags
  include Phlex::Rails::Helpers::CSPMetaTag
  include Phlex::Rails::Helpers::StylesheetLinkTag
  include Phlex::Rails::Helpers::JavascriptIncludeTag
  include Phlex::Rails::Helpers::Flash
  include Phlex::Rails::Helpers::T
  register_element :sl_drawer

  def initialize page_title, theme: nil
    Platinum::Theme.current = theme || Platinum::Theme.new
    @html_head = nil
    @page_title = page_title
    @title = nil
    @breadcrumbs = []
    @navigation = nil
    @profile_link = nil
    @sign_out_link = nil
    @filters = []
    @search = nil
    @toolbars = Set.new
    self.class.current = self
  end

  def html_head(&contents) = @html_head = contents

  def title(&contents) = @title = contents

  def breadcrumb(&contents) = @breadcrumbs << contents

  def navigation(&contents) = @navigation = contents

  def profile_link(&contents) = @profile_link = contents

  def sign_out_link(&contents) = @sign_out_link = contents

  def filter(&contents) = @filters << contents

  def search(&contents) = @search = contents

  def toolbar(&contents) = @toolbars << contents

  def view_template(&)
    doctype
    html do
      head do
        render_head
      end
      body class: theme.body do
        render_header
        render_main(&)
        render_footer
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
    @html_head.nil? ? default_head : @html_head.call
    stylesheet_link_tag :app, "data-turbo-track": "reload"
    javascript_include_tag "application", "data-turbo-track": "reload", type: "module"
  end

  private def render_header
    header class: ["fixed left-0 right-0 top-0 z-2 py-1 px-1", theme.overlay], gap: 4 do
      H 3 do
        Column class: "block md:hidden flex-grow" do
          render_small_header
        end
        Column class: "hidden md:block flex-grow" do
          render_large_header
        end
      end
    end
  end

  private def render_main(&contents)
    main class: ["py-4"] do
      Row items: "stretch", class: "py-16" do
        Column justify: "start", class: "hidden md:flex px-4 min-w-xs w-sm" do
          render_large_sidebar
        end
        Column(class: "flex-grow") do
          contents&.call
        end
      end
    end
  end

  private def render_footer
    footer class: ["fixed", "left-0", "right-0", "bottom-0", "z-1", "py-1", "px-1", theme.overlay], gap: 4 do
      H 4 do
        Row items: "center", gap: 4 do
          render_small_footer
          render_large_footer
        end
      end
    end
  end

  # Small screens

  private def render_small_header
    Row do
      Row justify: "start" do
        render_home_breadcrumb
        span(&@title)
      end
      render_small_sidebar
    end
  end

  private def render_small_sidebar
    div data: {controller: "drawer"} do
      a href: "#", class: theme.link, data: {action: "drawer#open"} do
        Icon theme.navigation_icon
      end
      sl_drawer label: @page_title, data: {drawer_target: "drawer"} do
        Column justify: "between", class: ["h-full mb-2 p-2 z-1", theme.overlay] do
          Column justify: "start" do
            render_breadcrumbs
            render_navigation
          end
          Column justify: "end" do
            render_profile
          end
        end
      end
    end
  end

  private def render_small_footer
    render_small_filters
    render_small_toolbars
  end

  private def render_small_filters
    if @filters.any?
      Expander icon: theme.filters_icon, class: "inline md:hidden" do
        Column(gap: 4, items: "stretch") { render_popup_items(@filters) }
      end
    end
  end

  private def render_small_toolbars
    if @toolbars.any?
      Expander icon: theme.toolbars_icon, class: "inline md:hidden" do
        Column(gap: 4, items: "stretch") { render_popup_items(@toolbars) }
      end
    end
  end

  # Large screens

  private def render_large_header
    Row do
      Row justify: "start" do
        render_home_breadcrumb
        render_breadcrumbs
      end
      span(&@title)
    end
    Row do
      render_large_filters
      render_search
    end
  end

  private def render_large_sidebar
    Column justify: "between", class: ["h-full mb-2 p-2 z-1", theme.overlay] do
      Column justify: "start" do
        render_navigation
      end
      Column justify: "end" do
        render_profile
      end
    end
  end

  private def render_large_footer = render_large_toolbars

  private def render_large_filters
    Row(class: "hidden md:flex") { render_popup_items(@filters) } if @filters.any?
  end

  private def render_large_toolbars
    Row(class: "hidden md:flex") { render_popup_items(@toolbars) } if @toolbars.any?
  end

  # Common to small and large screens

  private def render_home_breadcrumb = Breadcrumb { a(href: "/", class: theme.link, data: {turbo_frame: "_top"}) { Icon theme.home_icon } }

  private def render_navigation = @navigation&.call

  private def render_profile css_class = nil
    Row items: "center", class: [theme.panel, css_class] do
      render_profile_link
      render_sign_out_link
    end
  end

  private def render_breadcrumbs
    Row(justify: "start", gap: 1, wrap: true) do
      @breadcrumbs.each do |breadcrumb|
        Breadcrumb(&breadcrumb)
      end
    end
  end

  private def render_search
    Row(&@search) if @search.present?
  end

  private def render_popup_items(items) = items.each { |item| render_popup_item(&item) }

  private def render_popup_item(&) = Scroll { Row(justify: "start", &) }

  private def render_profile_link = @profile_link&.call

  private def render_sign_out_link = @sign_out_link&.call

  private def default_head
    # link rel: "manifest", href: pwa_manifest_path(format: :json)
    link rel: "icon", href: "/icon.png", type: "image/png"
    link rel: "icon", href: "/icon.svg", type: "image/svg+xml"
    link rel: "apple-touch-icon", href: "/icon.png"
    link rel: "stylesheet", href: "https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
  end

  class << self
    attr_accessor :current
  end
end
