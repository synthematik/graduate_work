import { Controller } from "@hotwired/stimulus"
// TODO
export default class extends Controller {
    static targets = ["slide", "indicator"]

    connect() {
        this.currentIndex = 0
        this.showSlide(this.currentIndex)
    }

    next() {
        this.currentIndex = (this.currentIndex + 1) % this.slideTargets.length
        this.showSlide(this.currentIndex)
    }

    prev() {
        this.currentIndex = (this.currentIndex - 1 + this.slideTargets.length) % this.slideTargets.length
        this.showSlide(this.currentIndex)
    }

    goToSlide(event) {
        const index = parseInt(event.currentTarget.dataset.index)
        this.currentIndex = index
        this.showSlide(this.currentIndex)
    }

    showSlide(index) {
        this.slideTargets.forEach((slide, i) => {
            slide.classList.toggle("hidden", i !== index)
        })

        if (this.hasIndicatorTarget) {
            this.indicatorTargets.forEach((indicator, i) => {
                indicator.classList.toggle("bg-opacity-50", i !== index)
            })
        }
    }
}