function btnev() {
    var data = document.getElementById("input-text").value;
    var elem = document.createElement("p");
    elem.innerHTML = data;
    document.getElementById("text").appendChild(elem);
}