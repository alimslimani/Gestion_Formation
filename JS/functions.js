var value;

function ligneTableau(id){
    id.toggleClass('selected');    
        value=id.find('td:first').html();
}

function showPresence(){
    $.ajax
    (
        {
            type:"GET",
            url:"../PHP/scripts.php",
            data:"idForm=" + value,
            success: function(data){
                $('#divPresence').empty();
                $('#divPresence').append(data);
            },
            error: function(){
                    alert("Error when try to show tickets");
            }
        }
    )
}

function inscrireAgent(){
    $.ajax
    (
        {
            type:"GET",
            url:"../PHP/scripts2.php",
            data:"codeAg=" + value,
            success: function(data){
                $('#divPresence').empty();
                alert("OK")
            },
            error: function(){
                    alert("Error when try to show tickets");
            }
        }
    )
}
