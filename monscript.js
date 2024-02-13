let button = document.getElementById("verifier");

function verifMail () {
    let identifiantValue = document.getElementById("identifiant").value;
    var req = new XMLHttpRequest();
    req.open("POST", "traitement_ajax.php", true);
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    req.onreadystatechange = () => {
        if (req.readyState === XMLHttpRequest.DONE) {
            const status = req.status;
            if (status === 0 || (status >= 200 && status < 400)) {
                console.log(req.responseText);
            }
        }
    };


    req.send("identifiant=" + identifiantValue);
}

button.addEventListener("click", verifMail);

