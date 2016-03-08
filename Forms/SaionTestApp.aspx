<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaionTestApp.aspx.cs" Inherits="Excersise_2.Forms.SaionTestApp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>--%>
    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <link rel="stylesheet" href="../Assets/Css/StyleSheet.css" />

    <%-- DataTable --%>
    <script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />

    <%--
    Not in Use    
    <script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
    <script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>--%>
    <script src="SaionTestApp.js"></script>
</head>
<body>
    <form id="myform">
        <div class="Layout">
            <div class="Header">
                Saion Test App
            </div>

            <div>
                <div class="LeftContent">
                </div>

                <div class="RightContent">

                    <div class="EntryForm">

                        <div>
                            <fieldset>
                                <legend>New/Edit User </legend>
                                <div class="control-group" style="display: none;">
                                    <label style="margin-right: 2%;" for="firstname">SaionTestID : <span style="color: red;">*</span></label>
                                    <input type="text" name="SaionTestID" id="SaionTestID" style="width: 65%;" />
                                </div>
                                <div class="control-group">
                                    <label style="margin-right: 2%;" for="firstname">First Name : <span style="color: red;">*</span></label>
                                    <input type="text" name="firstname" id="firstname" style="width: 65%;" />
                                </div>
                                <div class="control-group">
                                    <label style="margin-right: 2.1%;" for="lastname">Last Name : <span style="color: red;">*</span></label>
                                    <input type="text" name="lastname" id="lastname" style="width: 65%;" />
                                </div>

                                <div class="control-group">
                                    <label style="margin-right: 5.4%;" for="email">Email : <span style="color: red;">*</span></label>
                                    <input type="text" name="email" id="email" style="width: 65%;" />
                                </div>

                                <div class="control-group">
                                    <label style="margin-right: 5%;" for="phone">phone : <span style="color: red;">*</span></label>
                                    <input type="text" name="phone" id="phone" style="width: 65%;" />
                                </div>

                                <div>
                                    <div align="center">
                                        <button type="submit" class="custom" id="btnCancel">Cancel </button>
                                        <button type="submit" class="custom" id="btnSubmit">Submit </button>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <!-- Show Grid Here -->
                        <br />
                        <!-- Method 1 -->

                        <br />
                        <!-- Method 2 -->
                        <table id="example" class="display" cellspacing="1" width="100%" border="1">
                            <thead style="border: solid thin;">
                                <tr>
                                    <th>First name</th>
                                    <th>Last name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <%--<tfoot>
                                <tr>
                                    <th>Column 1</th>
                                    <th>Column 2</th>
                                    <th>Column 3</th>
                                    <th>Column 4</th>
                                    <th>Column 5</th>
                                </tr>
                            </tfoot>--%>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
