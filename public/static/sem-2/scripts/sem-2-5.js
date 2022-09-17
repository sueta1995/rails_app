async function copyData() {
    fetch('scripts/text.txt').then((response) => {
        console.log(response);
    })
    .then((data) => {
        alert(data);
    })
}