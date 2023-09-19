// ブラウザが読み込まれて、loadイベントが発火する
window.addEventListener('load', function () {

  const parentCategory = document.getElementById('parent-category')
  const selectWrap = document.getElementById('select-wrap')

  // 選択フォームを繰り返し表示する
  const selectChildElement = (selectForm) => {
    if (document.getElementById(selectForm) !== null) {
      document.getElementById(selectForm).remove()
    }
  }

  // Ajax通信を可能にする
  const XHR = new XMLHttpRequest();
  const estimateXHR = (id) => {
    XHR.open("GET", `/estimate/${id}`, true);
    XHR.responseType = "json";
    XHR.send();
  }

  // 子カテゴリーの値を全て取得する関数
  const getChildCategoryData = () => {
    const parentValue = parentCategory.value
    estimateXHR(parentValue)

  // コントローラーからJSON形式でレスポンスの受信が成功した時に、onloadが発火する
    XHR.onload = () => {
      const items = XHR.response.item;

  // 子カテゴリのXHRのレスポンスを受け取った場合
      if (items && items.length > 0) {
      appendChildSelect(items)
      const childCategory = document.getElementById('child-select')
  // 子カテゴリーのプルダウンの値が変化することによって孫カテゴリーのイベント発火する★
      childCategory.addEventListener('change', () => {
        selectChildElement('grand-child-select-wrap')
        getGrandchildCategoryData(childCategory)
      });
    }
  }
  }

  // 子カテゴリーの値を全て取得する関数
  const appendChildSelect = (items) => {

    const childWrap = document.createElement('div')
    const childSelect = document.createElement('select')

    childWrap.setAttribute('id', 'child-select-wrap')
    childSelect.setAttribute('id', 'child-select')

    // forEach文でitem（子カテゴリーの値）を繰り返す
    items.forEach(item => {
      const childOption = document.createElement('option')
      childOption.innerHTML = item.summary
      childOption.setAttribute('value', item.id)
      childSelect.appendChild(childOption)
    });

    childWrap.appendChild(childSelect)
    selectWrap.appendChild(childWrap)
  }

  // 孫カテゴリーの値を全て取得する関数 
  const getGrandchildCategoryData = (grandchildCategory) => {
    const grandchildValue = grandchildCategory.value
    categoryXHR(grandchildValue)

    XHR.onload = () => {
      const GrandChildItems = XHR.response.item;

      // 孫カテゴリのXHRのレスポンスを受け取った場合
      if (GrandChildItems && GrandChildItems.length > 0) {
      appendGrandChildSelect(GrandChildItems)
    }
  }
}

  // 孫カテゴリーのプルダウンを表示させる関数
  const appendGrandChildSelect = (items) => {

    const childWrap = document.getElementById('child-select-wrap')
    const grandchildWrap = document.createElement('div')
    const grandchildSelect = document.createElement('select')

    grandchildWrap.setAttribute('id', 'grand-child-select-wrap')
    grandchildSelect.setAttribute('id', 'grand-child-select')

    // forEach文でitem（孫カテゴリーの値）を繰り返す
    items.forEach(item => {
      const grandchildOption = document.createElement('option')
      grandchildOption.innerHTML = item.summary
      grandchildOption.setAttribute('value', item.id)
      grandchildSelect.appendChild(grandchildOption)
    });

    grandchildWrap.appendChild(grandchildSelect)
    childWrap.appendChild(grandchildWrap)
  }

  // 親カテゴリーを選択した後の発火するイベント
  parentCategory.addEventListener('change', function () {
    selectChildElement('child-select-wrap')
    getChildCategoryData()
  })
})