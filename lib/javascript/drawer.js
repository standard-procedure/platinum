import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["contents"]
  static values = {
    open: { type: Boolean, default: false },
    position: { type: String, default: "right" },
    backdrop: { type: String, default: "" },
    contents: { type: String, default: "" }
  }

  contentsTargetConnected() {
    this.createDrawer()
    this.setupEventListeners()
  }

  contentsTargetDisconnected() {
    this.teardownEventListeners()
  }

  createDrawer() {
      const positionClasses = {
        right: 'right-0 top-0 h-full w-auto min-w-1/2 px-4 py-1 translate-x-full',
        left: 'left-0 top-0 h-full w-auto min-w-1/2 px-4 py-1 -translate-x-full',
        bottom: 'bottom-0 left-0 w-full h-auto py-4 px-2 translate-y-full',
        top: 'top-0 left-0 w-full h-auto py-4 px-1 -translate-y-full'
      }

      this.backdrop = document.createElement('div')
      this.backdrop.className = this.backdropValue

      this.drawer = document.createElement('aside')
      this.drawer.className = `${this.contentsValue} ${positionClasses[this.positionValue]}`

      const content = document.createElement('div')
      content.className = 'h-full overflow-y-auto platinum-drawer-contents'
      this.contentsTarget.className = ''
      content.appendChild(this.contentsTarget)

      this.drawer.appendChild(content)
      document.body.appendChild(this.backdrop)
      document.body.appendChild(this.drawer)
  }

  open() {
    this.openValue = true
    document.body.style.overflow = "hidden"
    this.backdrop.classList.remove("pointer-events-none", "opacity-0")
    this.drawer.classList.remove('translate-x-full', '-translate-x-full', 'translate-y-full', '-translate-y-full')
    this.drawer.setAttribute('aria-hidden', 'false')
  }

  close() {
    this.openValue = false;
    document.body.style.overflow = ''

    this.backdrop.classList.add('pointer-events-none', 'opacity-0')

    const position = this.positionValue
    if (position === 'right') this.drawer.classList.add('translate-x-full')
    if (position === 'left') this.drawer.classList.add('-translate-x-full')
    if (position === 'bottom') this.drawer.classList.add('translate-y-full')
    if (position === 'top') this.drawer.classList.add('-translate-y-full')

    this.drawer.setAttribute('aria-hidden', 'true');
  }

  setupEventListeners() {
    if (this.backdrop && this.drawer) {
      this.backdropListener = this.backdrop.addEventListener('click', () => this.close());

      this.keydownListener = document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && this.openValue) {
          this.close()
        }
      })
    }
  }

  teardownEventListeners() {
    if (this.backdropListener && this.backdrop) {
      this.backdrop.removeEventListener(this.backdropListener)
      this.backdropListener = null
    }
    if (this.keydownListener) {
      document.removeEventListener(this.keydownListener)
      this.keydownListener = null
    }
  }

}