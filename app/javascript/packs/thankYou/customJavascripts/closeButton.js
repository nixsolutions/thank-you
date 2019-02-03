document.addEventListener('DOMContentLoaded', () => {
  const closeButton = document.getElementsByClassName('close')[0];
  if (closeButton) {
    closeButton.addEventListener('click', function(e) {
      e.target.parentElement.classList.add("hidden");
    });
  }
});
