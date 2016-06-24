<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JobReport.aspx.cs" Inherits="JobReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Css/css_developer.css" rel="stylesheet" />
    <script src="Js/jquery-1.4.1.js"></script>
    <script type="text/javascript">

        function showdiv(sender, eventArgs) {

            var HfForms = (parseInt($("#<%=HfForms.ClientID%>").val()) + 1).toString();
            if (HfForms == "10") {
                $("#<%=btnAddmore.ClientID%>").hide();
            }
            if (HfForms == "2") {
                $("#<%=RadbtnDelete.ClientID%>").show();
            }

            var DivId = 'divForms' + HfForms;
            $("div[id$='" + DivId + "']").show();
            $("input[id$='RadtxtFront" + HfForms + "']").focus();
            $("#<%=HfForms.ClientID%>").val(HfForms)
            eventArgs.set_cancel(true);

        }
        function Hidediv(sender, eventArgs) {
            var HfForms = $("#<%=HfForms.ClientID%>").val();
            if (HfForms == "10") {
                $("#<%=btnAddmore.ClientID%>").show();
            }


            $("#RadtxtFront" + HfForms).val('');
            $("#RadtxtBack" + HfForms).val('');
            var DivId = 'divForms' + HfForms;
            $("div[id$='" + DivId + "']").hide();
            $("#<%=HfForms.ClientID%>").val((parseInt(HfForms) - 1).toString());
            if ($("#<%=HfForms.ClientID%>").val() == "1") {
                $("#<%=RadbtnDelete.ClientID%>").hide();
            }
            $("input[id$='RadtxtFront" + $("#<%=HfForms.ClientID%>").val() + "']").focus();
            eventArgs.set_cancel(true);
        }
        function numeric_only(sender, eventArgs) {
            var k = eventArgs.get_keyCode()
            if (!(k >= 48 && k <= 57)) {
                eventArgs.set_cancel(true);
            }
        }
        function RadChkChanged(sender, eventArgs) {
            window.$ = $telerik.$;
            if (eventArgs.get_checked()) {
                $("#" + sender.get_id()).parent().next('div').children().children().first().removeAttr('readonly')

            }
            else {
                $("#" + sender.get_id()).parent().next('div').children().children().first().attr('readonly', 'readonly').val()
            }
        }
    </script>
    <style type="text/css">
        .rwAlertDialog {
            background-image: url('images/images.png') !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxPanel ID="RadMainAjaxPanel" runat="server">
        <section>

            <div class="clearfix">&nbsp;</div>
            <div class="container">
                <div class="col-lg-3 col-md-2 col-sm-1"></div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="well">
                        <div class="form-group logos">
                            <h1 class="text-center margintop"><small>PRESS REPORT</small></h1>

                        </div>
                        <!--Input type Password to fix the autofill issue of mozilla firefox-->

                        <div class="row">
                            <div class="col-lg-5 col-lg-push-1">
                                <div class="row margin-bottom">
                                    <div class="col-lg-3">
                                        <telerik:RadLabel ID="RadlblJobId" runat="server" Text="JOB #:"></telerik:RadLabel>
                                    </div>
                                    <div class="col-lg-9">
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtJob" runat="server" MaxLength="50"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5 col-lg-push-1">
                                <div class="row margin-bottom">
                                    <div class="col-lg-4">
                                        <telerik:RadLabel ID="RadlblRunSpeed" runat="server" Text="RUN SPEED:"></telerik:RadLabel>
                                    </div>
                                    <div class="col-lg-8">
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtRunSpeed" runat="server" ClientEvents-OnKeyPress="numeric_only" onpaste="return false"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-5 col-lg-push-1">
                                <div class="row margin-bottom">
                                    <div class="col-lg-3 ">
                                        <telerik:RadLabel ID="RadlblDepartment" runat="server" Text="DEPARTMENT:"></telerik:RadLabel>
                                    </div>
                                    <div class="col-lg-9 ">
                                        <telerik:RadDropDownList RenderMode="Lightweight" ID="RadddlDepartment" CssClass="calwidth" runat="server"
                                            DefaultMessage="Select Department" OnSelectedIndexChanged="RadddlDepartment_SelectedIndexChanged" AutoPostBack="true">
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RQDepartment" runat="server" CssClass="input-lg " Display="Dynamic"
                                            ControlToValidate="RadddlDepartment" ErrorMessage="Required" ForeColor="Red" ValidationGroup="MorJob"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5 col-lg-push-1">
                                <div class="row margin-bottom">
                                    <div class="col-lg-4 ">
                                        <telerik:RadLabel ID="RadlblRunDate" runat="server" Text="RUN DATE:"></telerik:RadLabel>
                                    </div>
                                    <div class="col-lg-8 ">
                                        <telerik:RadDatePicker RenderMode="Lightweight" ID="RadtxtRunDate" CssClass="calwidth" ShowPopupOnFocus="true" runat="server">
                                        </telerik:RadDatePicker>
                                        <%--<asp:RequiredFieldValidator ID="RfRadtxtRunDate" runat="server" CssClass="input-lg " Display="Dynamic"
                                        ControlToValidate="RadtxtRunDate" ErrorMessage="Required" ForeColor="Red" ValidationGroup="MorJob"></asp:RequiredFieldValidator> --%>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-5 col-lg-push-1">
                                <div class="row margin-bottom">
                                    <div class="col-lg-3 ">
                                        <telerik:RadLabel ID="RadlblMachine" runat="server" Text="MACHINE:"></telerik:RadLabel>
                                    </div>
                                    <div class="col-lg-9 ">
                                        <telerik:RadDropDownList RenderMode="Lightweight" ID="RadddlMachine" runat="server" CssClass="calwidth"
                                            DefaultMessage="Select Machine">
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RQMachine" runat="server" CssClass="input-lg " Display="Dynamic"
                                            ControlToValidate="RadddlMachine" ErrorMessage="Required" ForeColor="Red" ValidationGroup="MorJob"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5 col-lg-push-1">
                                <div class="row margin-bottom">
                                    <div class="col-lg-4 ">
                                        <telerik:RadLabel ID="RadlblStartTime" runat="server" Text="START TIME:"></telerik:RadLabel>
                                    </div>
                                    <div class="col-lg-8 ">
                                        <telerik:RadDateTimePicker RenderMode="Lightweight" ID="calStartTime" CssClass="calwidth" ShowPopupOnFocus="true" runat="server">
                                        </telerik:RadDateTimePicker>
                                        <asp:RequiredFieldValidator ID="RQStartTime" runat="server" Display="Dynamic"
                                            ControlToValidate="calStartTime" ErrorMessage="Required" ForeColor="Red" ValidationGroup="MorJob"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-5 col-lg-push-1">
                                <div class="row margin-bottom">
                                    <div class="col-lg-3 ">
                                        <telerik:RadLabel ID="RadlblPreessOperator" runat="server" Text="OPERATOR:"></telerik:RadLabel>
                                    </div>
                                    <div class="col-lg-9 ">
                                        <telerik:RadDropDownList RenderMode="Lightweight" ID="RadddlPressOperator" runat="server" CssClass="calwidth"
                                            DefaultMessage="Select Operator">
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RQPressOperator" runat="server" CssClass="input-lg " Display="Dynamic"
                                            ControlToValidate="RadddlPressOperator" ErrorMessage="Required" ForeColor="Red" ValidationGroup="MorJob"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5 col-lg-push-1">
                                <div class="row margin-bottom">
                                    <div class="col-lg-4 ">
                                        <telerik:RadLabel ID="lblEndTime" runat="server" Text="END TIME:"></telerik:RadLabel>
                                    </div>
                                    <div class="col-lg-8 ">
                                        <telerik:RadDateTimePicker RenderMode="Lightweight" ID="CalEndtime" CssClass="calwidth" ShowPopupOnFocus="true" runat="server">
                                        </telerik:RadDateTimePicker>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-group logos col-lg-12">
                            <h1 class="text-left margintop"><small>PLEASE LIST ALL COMMENTS/ PROBLEMS BELOW:</small></h1>

                        </div>
                        <%--<div class="row logos">
                        <div class="col-lg-12 text-left">
                            <label>
                                <b>PLEASE LIST ALL COMMENTS/ PROBLEMS BELOW:</b>
                            </label>
                        </div>
                    </div>--%>

                        <div class="margin-bottom"></div>

                        <div class="form-group row">
                            <div class="col-sm-4">
                                <telerik:RadCheckBox ID="RadChkNoProblem"  runat="server" Text="No Problem With This Job:" AutoPostBack="true" CausesValidation="False" OnClick="RadChkNoProblem_Click"></telerik:RadCheckBox>
                                <%-- <telerik:RadLabel ID="lblNoProblem" runat="server" AssociatedControlID="ChkNoProblem" Text="No Problem With This Job:" CssClass="form-control-label"></telerik:RadLabel>--%>
                            </div>
                            <div class="col-sm-8">
                                <telerik:RadTextBox ID="RadtxtNoProblem" runat="server" CssClass="commentsTextBox" MaxLength="1000" ReadOnly="true"></telerik:RadTextBox>

                            </div>
                        </div>
                        <div class="clearfix">
                            &nbsp
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-4">

                                <telerik:RadCheckBox  ID="RadChkProblemWithPlates" AutoPostBack="true" CausesValidation="False" runat="server" Text="Problem With Plates, Remarks, Layout, Prooofs, Blankets Used:" CssClass="text-left" OnClick="RadChkProblemWithPlates_Click"></telerik:RadCheckBox>
                                <%--<telerik:RadLabel ID="RadProblemWithPlates" runat="server" AssociatedControlID="ChkProblemWithPlates" Text="Problem With Plates,Remarks,Layout,Prooofs,Blankets Used:"
                                CssClass="form-control-label">
                            </telerik:RadLabel>--%>
                            </div>
                            <div class="col-sm-8">
                                <telerik:RadTextBox  RenderMode="Lightweight" ID="RadtxtProblemWithPlates" runat="server" CssClass="commentsTextBox" MaxLength="1000" ReadOnly="true"></telerik:RadTextBox>
                            </div>


                        </div>
                        <div class="clearfix">
                            &nbsp
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <telerik:RadCheckBox  ID="RadChkProblemWithPaper" AutoPostBack="true" CausesValidation="False" runat="server" CssClass="pull-left text-left" Text="Problem With Paper or Run,Extra Paper Pulled,Short,Sticking,Offsetting,etc:" OnClick="RadChkProblemWithPaper_Click"></telerik:RadCheckBox>
                                <%--<telerik:RadLabel ID="RadlblProblemWithPaper" runat="server" AssociatedControlID="RadChkProblemWithPaper" Text="Problem With Paper or Run,Extra Paper Pulled,Short,Sticking,Offsetting,etc:"  CssClass="form-control-label">
                                </telerik:RadLabel></span>--%>
                            </div>
                            <div class="col-sm-8">
                                <telerik:RadTextBox  RenderMode="Lightweight" ID="RadtxtProblemWithPaper" runat="server" CssClass="commentsTextBox" MaxLength="1000" ReadOnly="true"></telerik:RadTextBox>
                            </div>
                        </div>


                        <div class="margin-bottom"></div>


                        <div class="form-group row">
                            <div class="col-sm-4">
                                <telerik:RadCheckBox ID="RadChkProblemWithInk" runat="server" AutoPostBack="true" CausesValidation="False" Text="Problem With Ink or Coating:" OnClick="RadChkProblemWithInk_Click"></telerik:RadCheckBox>
                                <%-- <telerik:RadLabel ID="RadlblProblemWithInk" runat="server" Text="problem With Ink or Coating:" CssClass="label">
                                </telerik:RadLabel>--%>
                            </div>
                            <div class="col-sm-8">
                                <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtProblemWithInk" runat="server" CssClass="commentsTextBox" MaxLength="1000" ReadOnly="true"></telerik:RadTextBox>
                            </div>
                        </div>


                        <div class="margin-bottom"></div>
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <telerik:RadCheckBox ID="RadChkProblemWithPress" AutoPostBack="true" CausesValidation="False" runat="server" Text="Problem With Press:" OnClick="RadChkProblemWithPress_Click"></telerik:RadCheckBox>
                                <%--<telerik:RadLabel ID="RadlblProblemWithPress" runat="server" Text="Problem With Press:" CssClass="label">
                                </telerik:RadLabel>--%>
                            </div>
                            <div class="col-sm-8">
                                <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtProblemWithPress" runat="server" CssClass="commentsTextBox" MaxLength="1000" ReadOnly="true"></telerik:RadTextBox>
                            </div>
                        </div>

                        <div class="margin-bottom"></div>
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <telerik:RadCheckBox ID="RadChkMaintenancePerformed" AutoPostBack="true" CausesValidation="False" runat="server" Text="Maintenance Performed:" OnClick="RadChkMaintenancePerformed_Click"></telerik:RadCheckBox>
                                <%--  <telerik:RadLabel ID="RadlblMaintenancePerformed" runat="server" Text="Maintenance Performed:" CssClass="label">
                                </telerik:RadLabel>--%>
                            </div>
                            <div class="col-sm-8">
                                <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtMaintenancePerformed" runat="server" CssClass="commentsTextBox" MaxLength="1000" ReadOnly="true"></telerik:RadTextBox>
                            </div>
                        </div>


                        <div class="margin-bottom"></div>

                        <div class="form-group logos col-lg-12">
                            <h1 class="text-left margintop"><small>Forms</small></h1>

                        </div>

                        <asp:HiddenField ID="HfForms" runat="server" Value="1" />

                        
                        <div id="divForms1" runat="server">
                          
                            <div class="form-inline margin-bottom">
                                  <h3>Form 1</h3>
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblFront1" runat="server" Text="Front:"></telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtFront1" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblBack1" runat="server" Text="Back:">
                                    </telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtBack1" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>
                            
                        <div id="divForms2" runat="server" style="display: none">
                            <h3>Form 2</h3>
                            <div class="form-inline margin-bottom">
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblFront2" runat="server" Text="Front:"></telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtFront2" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblBack2" runat="server" Text="Back:">
                                    </telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtBack2" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>

                            </div>
                        </div>
                        <div id="divForms3" runat="server" style="display: none">
                            <h3>Form 3</h3>
                            <div class="form-inline margin-bottom">
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblFront3" runat="server" Text="Front:"></telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtFront3" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblBack3" runat="server" Text="Back:">
                                    </telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtBack3" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>

                            </div>
                        </div>
                        <div id="divForms4" runat="server" style="display: none">
                            <h3>Form 4</h3>
                            <div class="form-inline margin-bottom">
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblFront4" runat="server" Text="Front:"></telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtFront4" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblBack4" runat="server" Text="Back:">
                                    </telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtBack4" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>

                            </div>
                        </div>
                        <div id="divForms5" runat="server" style="display: none">
                            <h3>Form 5</h3>
                            <div class="form-inline margin-bottom">
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblFront5" runat="server" Text="Front:"></telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtFront5" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblBack5" runat="server" Text="Back:">
                                    </telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtBack5" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>

                            </div>
                        </div>
                        <div id="divForms6" runat="server" style="display: none">
                            <h3>Form 6</h3>
                            <div class="form-inline margin-bottom">
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblFront6" runat="server" Text="Front:"></telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtFront6" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblBack6" runat="server" Text="Back:">
                                    </telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtBack6" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>

                            </div>
                        </div>
                        <div id="divForms7" runat="server" style="display: none">
                            <h3>Form 7</h3>
                            <div class="form-inline margin-bottom">
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblFront7" runat="server" Text="Front:"></telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtFront7" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblBack7" runat="server" Text="Back:">
                                    </telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtBack7" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>

                            </div>
                        </div>
                        <div id="divForms8" runat="server" style="display: none">
                            <h3>Form 8</h3>
                            <div class="form-inline margin-bottom">
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblFront8" runat="server" Text="Front:"></telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtFront8" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblBack8" runat="server" Text="Back:">
                                    </telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtBack8" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>

                            </div>
                        </div>
                        <div id="divForms9" runat="server" style="display: none">
                            <h3>Form 9</h3>
                            <div class="form-inline margin-bottom">
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblFront9" runat="server" Text="Front:"></telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtFront9" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblBack9" runat="server" Text="Back:">
                                    </telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtBack9" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>

                            </div>
                        </div>
                        <div id="divForms10" runat="server" style="display: none">
                            <h3>Form 10</h3>
                            <div class="form-inline margin-bottom">
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblFront10" runat="server" Text="Front:"></telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtFront10" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>
                                <div class="form-group">
                                    <telerik:RadLabel ID="RadlblBack10" runat="server" Text="Back:">
                                    </telerik:RadLabel>
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtBack10" runat="server" CssClass="form-control" ClientEvents-OnKeyPress="numeric_only" onpaste="return false" MaxLength="4"></telerik:RadTextBox>
                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <%--<asp:Button ID="btnAddmore" runat="server" Text="Add More" OnClientClick="return showdiv()" AutoPostBack="false" UseSubmitBehavior="false" CausesValidation="false" />--%>
                            <telerik:RadButton ID="btnAddmore" runat="server" Text="Add More" OnClientClicking="showdiv" AutoPostBack="false" UseSubmitBehavior="false" CausesValidation="false">
                                <Icon PrimaryIconCssClass="rbAdd"></Icon>
                            </telerik:RadButton>
                            <telerik:RadButton ID="RadbtnDelete" runat="server" Text="Delete" OnClientClicking="Hidediv" AutoPostBack="false" UseSubmitBehavior="false" CausesValidation="false" Style="display: none">
                                <Icon PrimaryIconCssClass="rbRemove"></Icon>
                            </telerik:RadButton>
                            <%--<asp:Button ID="RadbtnDelete" runat="server" Text="Delete" OnClientClick="return Hidediv()" AutoPostBack="false" UseSubmitBehavior="false" CausesValidation="false" Style="display: none" />--%>
                        </div>


                        <div class="form-group">
                            <center> <telerik:RadButton ID="btnSave" ValidationGroup="MorJob" Height="50"  OnClick="btnSave_Click" Primary="true" Text="Save" runat="server" class="btn btn-success btn-block btn-lg"  Width="100"  >
                            <Icon PrimaryIconCssClass="rbOk"/>
                                 </telerik:RadButton></center>

                        </div>
                        <div class="form-group">
                            <telerik:RadWindowManager RenderMode="Lightweight" Title="View Chart" Skin="Web20" runat="server" ID="RadWindowManager1" CssClass="rwAlertDialog">
                            </telerik:RadWindowManager>
                            <telerik:RadNotification ID="RadNotification1" runat="server" VisibleOnPageLoad="False" Width="300px" Height="130px" EnableRoundedCorners="true" AutoCloseDelay="8500" EnableShadow="True" Position="Center" TitleIcon="none">
                            </telerik:RadNotification>
                        </div>

                    </div>
                </div>


            </div>
        </section>
    </telerik:RadAjaxPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>

