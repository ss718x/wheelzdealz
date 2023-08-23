document.addEventListener("DOMContentLoaded", function() {
  const avatarInput = document.getElementById('user_avatar');
  const avatarPreview = document.getElementById('avatarPreview');

  avatarInput.addEventListener('change', function() {
    const file = avatarInput.files[0];
    const reader = new FileReader();

    reader.onloadend = function() {
      avatarPreview.src = reader.result;
      avatarPreview.style.display = 'block'; // Show the image
    }

    if (file) {
      reader.readAsDataURL(file);
    } else {
      avatarPreview.src = "";
      avatarPreview.style.display = 'none'; // Hide the image if no file selected
    }
  });
});
