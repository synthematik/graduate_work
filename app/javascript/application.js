import "@hotwired/turbo-rails"
import "./controllers"
import * as ActiveStorage from "@rails/activestorage"

ActiveStorage.start()

import "trix"
import "@rails/actiontext"
import "trix/dist/trix.css"