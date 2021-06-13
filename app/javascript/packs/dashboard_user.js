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
            alert('Your profile was updated correctly');
            console.log(response);
            $("#formUser").remove();
            $(".user-profile").hide();
        }).fail(function (error) {
            console.error(error);
        });
    }else{
        $("#formUser").remove();
        $(".user-profile").hide();
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
            $('.user-profile').show();
                $(".user-profile .row").append(`
            <div id="formUser" class="row">
                <div class="col-lg-6 col-md-6">
                <div class="input-field>
                    <label for="name" class="form-name">Name:</label>
                        <input type="text" name="name" value="${response.name}"/>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                <div class="input-field>
                    <label for="run" class="form-name">Run:</label>
                        <input type="text" name="run" value="${response.run}"/>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6">
                <div class="input-field>
                    <label for="direction" class="form-name">Direction:</label>
                        <input type="text" name="direction" value="${response.direction}"/>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="input-field>
                    <label for="phone" class="form-name">Phone:</label>
                        <input type="text" name="phone" value="${response.phone}"/>
                    </div>
                </div>

                <div class="col-lg-12 col-md-12 d-flex justify-content-center">
                    <div class="form-inline input-field">
                        <input type="submit" value="Update!" class="btn-update-form btn btn-white waves-effect waves-light" data-type="update">
                        <input type="hidden" name="id" value="${response.id}"/>
                        <input type="button" value="cancel" class="btn-update-form btn btn-dark text-white waves-effect" data-type="cancel">
                    </div>
                </div>
            </div>`); 

        }).fail(function (error) {
            console.error(error);
        });
    }

    $('#root').on('click', '.user-profile button[data-bs-dismiss="modal"]', function() {
        $(".user-profile .row").empty();
        $(".user-profile").hide();
      });


});
