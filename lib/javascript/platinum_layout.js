import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar", "mobileSidebar", "breadcrumbs", "mobileBreadcrumbs", "filters", "mobileFilters", "search", "mobileSearch", "toolbars", "mobileToolbars"]

  connect() {
    this.showingMobile = false
    this.moveContent()
    this.setupResizeObserver()
  }

  disconnect() {
    this.teardownResizeObserver()
  }

  isMobile() {
    return window.matchMedia('(max-width: 767px)').matches
  }

  sizeHasChanged() {
    return this.showingMobile != this.isMobile()
  }

  moveContent() {
    if (this.sizeHasChanged()) {
      this.showingMobile = this.isMobile()
      if (this.showingMobile) {
        this.moveContentToMobile()
      } else {
        this.moveContentToDesktop()
      }
    }
  }

  moveContentToMobile() {
    this.moveElements(this.sidebarTarget, this.mobileSidebarTarget)
    this.moveElements(this.breadcrumbsTarget, this.mobileBreadcrumbsTarget)
    this.moveElements(this.filtersTarget, this.mobileFiltersTarget)
    this.moveElements(this.searchTarget, this.mobileSearchTarget)
    this.moveElements(this.toolbarsTarget, this.mobileToolbarsTarget)
  }

  moveContentToDesktop() {
    this.moveElements(this.mobileSidebarTarget, this.sidebarTarget)
    this.moveElements(this.mobileBreadcrumbsTarget, this.breadcrumbsTarget)
    this.moveElements(this.mobileFiltersTarget, this.filtersTarget)
    this.moveElements(this.mobileSearchTarget, this.searchTarget)
    this.moveElements(this.mobileToolbarsTarget, this.toolbarsTarget)
  }

  moveElements(source, target) {
    if (source && target && source.children.length > 0) {
      while (source.firstChild) {
        target.appendChild(source.firstChild);
      }
    }
  }

  setupResizeObserver() {
    const mediaQuery = window.matchMedia('(max-width: 767px)')

    mediaQuery.addEventListener('change', (e) => {
      this.teardownResizeObserver()
      this.resizeTimeout = setTimeout(() => {
        this.moveContent()
      }, 100)
    })
  }

  teardownResizeObserver() {
    if (this.resizeTimeout) {
      clearTimeout(this.resizeTimeout)
      this.resizeTimeout = null
    }
  }


}