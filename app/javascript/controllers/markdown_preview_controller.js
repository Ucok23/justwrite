import { Controller } from "@hotwired/stimulus"
import { marked } from "marked"

// Connects to data-controller="markdown-preview"
export default class extends Controller {
  static targets = ["source", "preview"]

  connect() {
    this.update()
  }

  update() {
    this.previewTarget.innerHTML = marked(this.sourceTarget.value)
  }
}
