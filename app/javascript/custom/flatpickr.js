require("flatpickr/dist/flatpickr.css");
import flatpickr from "flatpickr";
import { Japanese } from "flatpickr/dist/l10n/ja.js";
flatpickr.localize(Japanese);
document.addEventListener("turbolinks:load", () => {
  flatpickr("[data-behavior='flatpickr']", {
    altInput: true,
		altFormat: "n/j H:i 開始",
		dateFormat: "Y-m-d H:i",
		minDate: "today",
		maxDate: new Date().fp_incr(8),
		position: "below center",
		enableTime: true
  });
});
