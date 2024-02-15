let image = document.getElementsByClassName("video");
for ( let i = 0; i < image.length; i++){
    image[i].addEventListener("click", afficheDetail);
    image[i].myParam = image[i].id;
}
function afficheDetail(e){
    let id = e.currentTarget.myParam;
    let elem = document.getElementById(id);
    if(elem.nextSibling.style.display == "block"){
        elem.nextSibling.style.display = "none";
    }
    else{
        elem.nextSibling.style.display = "block";
    }
}