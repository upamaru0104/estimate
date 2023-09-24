// ブラウザが読み込まれて、loadイベントが発火する
window.addEventListener('load', function () {
  const plusBtn = document.getElementById('add-category-button').addEventListener('click', () => {
    const elements = document.getElementById("select-wrap");
    const copied = document.getElementById('parent-category').cloneNode(true);
    elements.appendChild(copied);
  });
})