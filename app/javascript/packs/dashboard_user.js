$(document).ready(function () {

    $(".profile").click(function () {
        console.log("click");
        editProfile();
    })
    

    $("#root").on('click', '.btn-update-form', function () {

        var up = $(this).data('type');
       
        if(up =='update'){
        let id = $("#formUser input[name='id']").val();
        let name = $("#formUser input[name='name']").val();
        let run = $("#formUser input[name='run']").val();
        let direction = $("#formUser input[name='direction']").val();
        let phone = $("#formUser input[name='phone']").val();
        let phone2 = parseInt(phone);
       
            
        $.ajax({
            url: '/update_profile',
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: {
                user: {
                    id,
                    name,
                    run,
                    direction,
                    phone: phone2,
                  
                }
            }
        }).done(function (response) {
            alert('Se agregó correctamente');
            console.log(response);
            $("#formUser").remove();
        }).fail(function (error) {
            console.error(error);
        });
    }else{
        $("#formUser").remove();
    }
    });

    //edit profile

    const editProfile = () => {

        console.log("aqui deberia");
        $.ajax({
            url: '/user_profile',
            type: 'GET'
        }).done(function (response) {
            console.log(response);
                
                $("#root").append(`
            <div id="formUser">
            
                <div class="field">
                    <label for="name">Name:</label>
                    <input type="text" name="name" value="${response.name}"/><br />
                </d>
                <div class="field">
                    <label for="run">Run</label>
                    <input type="text" name="run" value="${response.run}"/><br />
                </div>
                <div class="field">
                    <label for="direction">Direction:</label>
                    <input type="text" name="direction" value="${response.direction}"/><br />
                </div>
                <div class="field">
                    <label for="phone">Phone</label>
                    <input type="text" name="phone" value="${response.phone}"/><br />
                </div>
                <div class="field">

                <div class="actions">
                    <input type="submit" value="Update!" class="btn-update-form" data-type="update">
                    <input type="hidden" name="id" value="${response.id}"/>
                    <input type="button" value="cancel" class="btn-update-form" data-type="cancel">
                </div>
            </div>`);

        }).fail(function (error) {
            console.error(error);
        });
    }



});
