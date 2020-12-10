import flatpickr from "flatpickr";

const initEventFormSwitch = () => {
  if (document.getElementById('customSwitch1')) {

    const switch_form = document.getElementById('customSwitch1');
    const switch_value = document.getElementById('switchvalue');

    switch_form.addEventListener('change', () => {
      if (switch_form.checked) {
        flatpickr(".datepicker", {
          altInput: true,
          altInput: true,
          enableTime: false
        });
        switch_value.value = 'all day'
      }
      else {
        flatpickr(".datepicker", {
          altInput: true,
          enableTime: true,
          time_24hr: true
        });
        switch_value.value = ''
      }
    });
  };
};

export { initEventFormSwitch };
