function search() {
 /* document.getElementById("search-room").classList.toggle("show");*/
    var x;
        x = document.getElementById("searchRoom").value;
        if (x === "kathmandu"||"bhaktapur"||"pokhara"||"butwal") {
            window.open("rooms");
        }
    }
