<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Excersise_2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />

    <script>

        
        $(document).ready(function () {
            var t = $('#example').DataTable();
            var counter = 1;
            

            $('#addRow').on('click', function () {
                AddRow();
                //counter++;
                return false;
            });


            function AddRow() {
                t.row.add([
                      counter + '.1',
                      counter + '.2',
                      counter + '.3',
                      counter + '.4',
                      counter + '.5'
                ]).draw(false);
                counter++;
            }
            AddRow();

            // Automatically add a first row of data
            //$('#addRow').click();
        });

    </script>
</head>
<body>
    <form id="form1">
        <div>
            <button id="addRow">Add new row</button>
            <table id="example" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Column 1</th>
                        <th>Column 2</th>
                        <th>Column 3</th>
                        <th>Column 4</th>
                        <th>Column 5</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Column 1</th>
                        <th>Column 2</th>
                        <th>Column 3</th>
                        <th>Column 4</th>
                        <th>Column 5</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </form>
</body>
</html>
