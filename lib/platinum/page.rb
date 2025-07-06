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
    @toolbar = nil
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

  def toolbar(&contents) = @toolbar = contents

  def view_template(&contents)
    doctype
    html do
      head do
        render_head
      end
      body class: theme.body do
        render_header
        main class: ["py-4"] do
          Row items: "stretch" do
            render_sidebar
            Column(class: "flex-grow") { contents&.call }
          end
        end
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
    header class: ["fixed", "left-0", "right-0", "top-0", "z-2", "py-3", "px-1", theme.overlay], gap: 4 do
      Platinum::H(3) do
        Row do
          # Home
          Row justify: "start" do
            a(href: "/", class: theme.link, data: {turbo_frame: "_top"}) { Icon theme.home_icon }
          end
          # Small screen: Title & Nav Button
          div class: "block md:hidden flex-grow" do
            Row do
              span(&@title)
              render_navigation_button
            end
          end
          # Large screen: Breadcrumbs & Title
          div class: "hidden md:block flex-grow" do
            Row do
              render_breadcrumbs
              span(&@title)
            end
          end
        end
      end
    end
  end

  private def render_footer
    footer class: ["fixed", "left-0", "right-0", "bottom-0", "z-1", "py-3", "px-1", theme.overlay], gap: 4 do
      Platinum::H(4) do
        div class: "block md:hidden" do
          Row justify: "end" do
            render_filter_popup
            render_toolbar
          end
        end
        div class: "hidden md:block" do
          Row items: "center" do
            render_profile
            Row justify: "end", items: "center" do
              render_filters
              render_toolbar
            end
          end
        end
      end
    end
  end

  private def render_sidebar
    Column justify: "start", class: "hidden md:flex py-16 px-4 min-w-xs w-sm" do
      render_navigation
    end
  end

  private def render_navigation = @navigation&.call

  private def render_navigation_button
    div data: {controller: "drawer"} do
      a href: "#", class: theme.link, data: {action: "drawer#open"} do
        Icon theme.navigation_icon
      end
      sl_drawer label: @page_title, data: {drawer_target: "drawer"} do
        Column justify: "between", class: ["h-full mb-2 p-2 z-1", theme.overlay] do
          render_navigation
          render_profile
        end
      end
    end
  end

  private def render_profile
    Row items: "center", class: theme.panel do
      render_profile_link
      render_sign_out_link
    end
  end

  private def render_breadcrumbs
    Row(justify: "start", gap: 2, wrap: true) do
      @breadcrumbs.each do |breadcrumb|
        Breadcrumb(&breadcrumb)
      end
    end
  end

  private def render_filter_popup
    a href: "#", class: theme.link do
      Icon theme.filters_icon
    end
  end

  private def render_filters
  end

  private def render_toolbar
    Row(justify: "end", class: "overflow-x-auto", &@toolbar)
  end

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

  class Toolbar
    def initialize(&configuration)
      @items = []
      instance_eval(&configuration)
    end
    attr_reader :items

    def add(&item)
      @items << item
    end
  end
end
