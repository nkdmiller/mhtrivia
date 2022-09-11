import { addQuestion } from "addQuestion"

document addEventListener("turbolinks:load", ()=> {
  if (document.querySelector("#fieldsetContainer")) {
    addQuestion()
  }
})
