let identifiantValue = document.getElementById("identifiant").value;

const req = new XMLHttpRequest();
req.open("POST", "traitement_inscription.php", true);
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