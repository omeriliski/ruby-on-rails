import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "deleteBtn"]

  async submitForm(e) {
    e.preventDefault()
    const form = e.target
    const formData = new FormData(form)
    const action = form.getAttribute("action")
    const method = form.querySelector('input[name="_method"]')?.value || form.getAttribute("method") || "POST"

    try {
      const response = await fetch(action, {
        method: method.toUpperCase(),
        headers: {
          "X-Requested-With": "XMLHttpRequest",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        },
        body: formData
      })

      if (response.ok) {
        const data = await response.json()
        alert(data.message || "Success!")
        window.location.href = form.dataset.redirectUrl || "/"
      } else {
        const error = await response.json()
        alert("Error: " + (error.error || error.message || "Unknown error"))
      }
    } catch (error) {
      console.error("Error:", error)
      alert("Request failed: " + error.message)
    }
  }

  async deleteItem(e) {
    e.preventDefault()
    if (!confirm("Are you sure you want to delete this item?")) return

    const url = e.target.getAttribute("href")
    try {
      const response = await fetch(url, {
        method: "DELETE",
        headers: {
          "X-Requested-With": "XMLHttpRequest",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        }
      })

      if (response.ok) {
        alert("Deleted successfully!")
        window.location.href = "/" + url.split("/")[1] || "/"
      } else {
        alert("Failed to delete")
      }
    } catch (error) {
      console.error("Error:", error)
      alert("Request failed: " + error.message)
    }
  }
}
