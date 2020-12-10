import flatpickr from "flatpickr";
import "flatpickr/dist/themes/dark.css";

const initFlatpickr = () => {
  const eventForm = document.getElementById('new-event-form');
  const switch_form = document.getElementById('customSwitch1');

  if (eventForm) {
    flatpickr(".datepicker", {
      altInput: true,
      altFormat: "j F, Y H:i",
      enableTime: true,
      time_24hr: true,
    });
  };
};

export {initFlatpickr};

