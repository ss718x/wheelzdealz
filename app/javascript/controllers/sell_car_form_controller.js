// app/javascript/controllers/sell_car_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"];

  submit(event) {
    event.preventDefault();
    if (!this.userLoggedIn()) {
      this.showLoginPrompt();
    } else {
      this.formTarget.submit();
    }
  }

  userLoggedIn() {
    const userLoggedInMetaTag = document.querySelector("meta[name='user-logged-in']");
    return userLoggedInMetaTag && userLoggedInMetaTag.content === "true";
  }

  showLoginPrompt() {
    const choice = alert("Please log in or sign up to sell your car.");
  }
}
