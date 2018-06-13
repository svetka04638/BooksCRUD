function validate() {
    var thisYear = new Date().getFullYear();
    var x = document.getElementById("printYear").value;
    if (isNaN(x)) {
        document.getElementById("validation").innerHTML ="Please enter publishing year in XXXX format!";
        return false;
    }
    else if(x > thisYear){
        document.getElementById("validation").innerHTML = "Oops...! The book cannot be published in future!";
        return false;
    }

    return true;
}

function validate2(){
    var options = document.getElementById("search");
    var selectedValue = options.options[options.selectedIndex].value;
    if(selectedValue == "printYear") {
        if (isNaN(document.getElementById("searchInput").value)) {
            document.getElementById("validation2").innerHTML = "Please enter publishing year in XXXX format!";
            return false;
        }
    }
    if(selectedValue == "readALready"){
        document.getElementById("validation2").innerHTML ="Please select Yes or No!";

    }
    return true;
}

function checkSelect(){

    var options = document.getElementById("search");
    var selectedValue = options.options[options.selectedIndex].value;
    if(selectedValue != "printYear" && selectedValue!= "readAlready"){
        document.getElementById("searchInput").hidden = false;
        document.getElementById("readStatus").hidden = true;
        document.getElementById("yearSearch").hidden = true;
    }

    if(selectedValue == "printYear"){
        document.getElementById("searchInput").hidden = false;
        document.getElementById("readStatus").hidden = true;
        document.getElementById("yearSearch").hidden = false;

    }
    if(selectedValue == "readAlready"){
        document.getElementById("readStatus").hidden = false;
        document.getElementById("yearSearch").hidden = true;
        document.getElementById("searchInput").hidden = true;
    }
}

