$(document).ready(function () {
    BindGrid();

    $('input').change(function (e) {
        var sReqFields = new Array("firstname", "lastname", "email", "phone");
        $(sReqFields).each(function (i) {
            //debugger;
            $("input[name='" + sReqFields[i] + "']").removeClass("error");
            if ($("input[name='" + sReqFields[i] + "']").val() == "") { $("input[name='" + sReqFields[i] + "']").addClass("error"); }
        });
    });

    $('#btnSubmit').click(function (e) {
        //debugger;
        var SaionTestID = $("#SaionTestID").val();
        var firstname = $("#firstname").val();
        var lastname = $("#lastname").val();
        var email = $("#email").val();
        var phone = $("#phone").val();

        var sReqFields = new Array("firstname", "lastname", "email", "phone");

        //$('error').hide();

        $(sReqFields).each(function (i) {
            //debugger;
            $("input[name='" + sReqFields[i] + "']").removeClass("error");
            if ($("input[name='" + sReqFields[i] + "']").val() == "") { $("input[name='" + sReqFields[i] + "']").addClass("error"); }
        });

        //All the fields are Mandatory
        if (firstname === "" || lastname === "" || email === "" || phone === "") {
            alert('All the fields are Mandatory..!');
            return false;
        }

        //Validate Email 
        if (!isValidEmail(email)) {
            alert('Please check email address');
            return false;
        }

        $.ajax({
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            url: 'SaionTestApp.aspx/Update',
            data: "{'SaionTestID':'" + SaionTestID + "', 'firstname':'" + firstname + "', 'lastname':'" + lastname + "','email':'" + email + "','phone':'" + phone + "'}",
            async: false,
            success: function (response) {
                $('#SaionTestID').val('');
                $('#firstname').val('');
                $('#lastname').val('');
                $('#email').val('');
                $('#phone').val('');

                BindGrid();

                alert("Data Saved Sucessfully in Database");
            },
            error: function () {
                console.log('there is some error');
            }
        });

        return false;
    });

    //All input fields are mandatory
    $(function () {
        $("input[name='firstname']").prop('required', true);
        $("input[name='lastname']").prop('required', true);
        $("input[name='email']").prop('required', true);
        $("input[name='phone']").prop('required', true);
    });

    //Phone number should be in the number format
    $("#phone").keypress(function (e) {
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            $("#errmsg").html("Number Only").show().fadeOut("slow");
            return false;
        }
    });

    function isValidEmail(emailText) {
        var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
        return pattern.test(emailText);
    };
});


function BindGrid() {
    //debugger;
    var t = $('#example').DataTable();
    //t.removeData();
    t.rows().remove().draw();

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "SaionTestApp.aspx/Get",
        data: "{}",
        dataType: "json",

        success: function (data) {
            //debugger;
            for (var i = 0; i < data.d.length; i++) {
                //debugger;
                t.row.add([
                            '<a class="table-edit" onclick="showRecord(' + data.d[i].SaionTestID + ');">' + data.d[i].FirstName + '</a>',
                            data.d[i].LastName,
                            data.d[i].Email,
                            data.d[i].Phone,
                            '<button type="button" onclick="deleteRecord(' + data.d[i].SaionTestID + ');">Delete</button>'
                ]).draw(false);
            }
        },
        error: function (result) {
            debugger;
            alert("Error");
        }
    });
};

function deleteRecord(id) {
    //debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "SaionTestApp.aspx/Delete",
        data: "{'SaionTestID':'" + id + "'}",
        dataType: "json",
        success: function (data) {
            alert("Sucessfully Deleted");
            //showGrid();
            BindGrid();
        },
        error: function (result) {
            debugger;
            alert("Error");
        }
    });
};

function showRecord(SaionTestID) {
    //debugger;

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "SaionTestApp.aspx/GetByID",
        data: "{'SaionTestID':'" + SaionTestID + "'}",
        dataType: "json",

        success: function (data) {
            //debugger;
            $('#SaionTestID').val(data.d[0].SaionTestID);
            $('#firstname').val(data.d[0].FirstName);
            $('#lastname').val(data.d[0].LastName);
            $('#email').val(data.d[0].Email);
            $('#phone').val(data.d[0].Phone);
        },
        error: function (result) {
            debugger;
            alert("Error");
        }
    });
};