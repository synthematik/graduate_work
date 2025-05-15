import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "preview"]

    connect() {
        this.inputTarget.addEventListener("change", (e) => this.previewPhotos(e))
    }

    previewPhotos(event) {
        this.previewTarget.innerHTML = ''
        Array.from(event.target.files).forEach(file => {
            if (!file.type.startsWith('image/')) return

            const reader = new FileReader()
            reader.onload = (e) => {
                const wrapper = document.createElement('div')
                wrapper.className = 'relative group'
                wrapper.innerHTML = `
          <img src="${e.target.result}" class="w-full h-24 object-cover rounded shadow">
          <button class="absolute top-1 right-1 bg-red-500 text-white rounded-full w-6 h-6 flex items-center justify-center"
                  data-action="click->photo#remove"
                  data-photo-id="${file.name}">×</button>
        `
                this.previewTarget.appendChild(wrapper)
            }
            reader.readAsDataURL(file)
        })
    }

    async remove(event) {
        event.preventDefault()
        if (!confirm("Удалить изображение?")) return

        const photoId = event.target.dataset.photoId
        const photoElement = event.target.closest('.group')

        // Для новых фото (ещё не сохранённых)
        if (isNaN(photoId)) {
            photoElement.remove()
            return
        }

        try {
            const response = await fetch(`/photos/${photoId}`, {
                method: 'DELETE',
                headers: {
                    'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
                }
            })

            if (response.ok) {
                photoElement.remove()
                this.updateFileInput(photoId)
            } else {
                alert('Ошибка удаления')
            }
        } catch (error) {
            console.error('Error:', error)
        }
    }

    updateFileInput(photoId) {
        const dt = new DataTransfer()
        Array.from(this.inputTarget.files)
            .filter(f => f.name !== photoId)
            .forEach(f => dt.items.add(f))
        this.inputTarget.files = dt.files
    }
}