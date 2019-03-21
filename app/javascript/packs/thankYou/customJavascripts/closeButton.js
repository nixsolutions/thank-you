document.addEventListener('DOMContentLoaded', () => {
  const closeButtons = document.getElementsByClassName('close');

  Array.from(closeButtons).forEach((element) => {
    element.addEventListener('click', (e) => {
      e.target.parentElement.classList.add("hidden");
    });
  });
});
