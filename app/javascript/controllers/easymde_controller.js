import { Controller } from "@hotwired/stimulus"
import "easymde"
import { marked } from "marked"

// Connects to data-controller="easymde"
export default class extends Controller {
  static targets = ["editor"]

  connect() {
    this.editor = new EasyMDE({
      element: this.editorTarget,
      spellChecker: false,
      sideBySideFullscreen: false,
      previewRender: (plainText) => {
        return marked(plainText)
      },
      toolbar: [
        "bold", "italic", "heading", "|",
        "quote", "unordered-list", "ordered-list", "|",
        "link", "image", "|",
        "preview", "side-by-side", "fullscreen", "|",
        "guide"
      ],
      uploadImage: true,
      imageUploadFunction: (file, onSuccess, onError) => {
        const formData = new FormData()
        formData.append("file", file)

        const csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")

        fetch("/uploads", {
          method: "POST",
          body: formData,
          headers: {
            "X-CSRF-Token": csrfToken
          }
        })
          .then(response => response.json())
          .then(result => {
            onSuccess(result.url)
          })
          .catch(error => {
            onError(error)
          })
      }
    })
  }

  disconnect() {
    this.editor.toTextArea()
    this.editor = null
  }
}
