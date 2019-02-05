document.addEventListener('DOMContentLoaded', () => {
  const closeButton = document.getElementById('close');
  if (closeButton) {
    closeButton.addEventListener('click', function(e) {
      e.target.parentElement.classList.add("hidden");
    });
  }
});
