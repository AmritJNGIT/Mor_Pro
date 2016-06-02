<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Job.aspx.cs" Inherits="Job" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        button.RadCheckBox {
            font-weight: bold;
        }

        .commentsTextBox {
            width: 325% !important;
            border-radius: 6px !important;
        }

        .RadDateTimePicker .riTextBox {
            padding-right: 0em !important;
        }

        .margin-bottom {
            margin-bottom: 20px;
        }

        .calwidth .RadInput .riTextBox {
            width: 105% !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtJob" runat="server" CssClass="input-lg calwidth"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-lg-push-1">
                            <div class="row margin-bottom">
                                <div class="col-lg-4">
                                    <telerik:RadLabel ID="RadlblRunSpeed" runat="server" Text="RUN SPEED:"></telerik:RadLabel>
                                </div>
                                <div class="col-lg-8">
                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtRunSpeed" runat="server" CssClass="input-lg calwidth"></telerik:RadTextBox>
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
                                        DefaultMessage="Select Operator">
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
                                    <telerik:RadLabel ID="lblPreessOperator" runat="server" Text="OPERATOR:"></telerik:RadLabel>
                                </div>
                                <div class="col-lg-9 ">
                                    <telerik:RadDropDownList RenderMode="Lightweight" ID="ddlPressOperator" runat="server" CssClass="calwidth"
                                        DefaultMessage="Select Operator">
                                    </telerik:RadDropDownList>
                                    <asp:RequiredFieldValidator ID="RQPressOperator" runat="server" CssClass="input-lg " Display="Dynamic"
                                        ControlToValidate="ddlPressOperator" ErrorMessage="Required" ForeColor="Red" ValidationGroup="MorJob"></asp:RequiredFieldValidator>
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
                            <telerik:RadCheckBox ID="ChkNoProblem" runat="server" Text="No Problem With This Job:" AutoPostBack="False" CausesValidation="False"></telerik:RadCheckBox>
                            <%-- <telerik:RadLabel ID="lblNoProblem" runat="server" AssociatedControlID="ChkNoProblem" Text="No Problem With This Job:" CssClass="form-control-label"></telerik:RadLabel>--%>
                        </div>
                        <div class="col-sm-8">
                            <telerik:RadTextBox ID="RadtxtNoProblem" runat="server" CssClass="commentsTextBox"></telerik:RadTextBox>

                        </div>
                    </div>
                    <div class="clearfix">
                        &nbsp
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">

                            <telerik:RadCheckBox ID="ChkProblemWithPlates" AutoPostBack="False" CausesValidation="False" runat="server" Text="Problem With Plates, Remarks, Layout, Prooofs, Blankets Used:" CssClass="text-left"></telerik:RadCheckBox>
                            <%--<telerik:RadLabel ID="RadProblemWithPlates" runat="server" AssociatedControlID="ChkProblemWithPlates" Text="Problem With Plates,Remarks,Layout,Prooofs,Blankets Used:"
                                CssClass="form-control-label">
                            </telerik:RadLabel>--%>
                        </div>
                        <div class="col-sm-8">
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtProblemWithPlates" runat="server" CssClass="commentsTextBox"></telerik:RadTextBox>
                        </div>


                    </div>
                    <div class="clearfix">
                        &nbsp
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <telerik:RadCheckBox ID="RadChkProblemWithPaper" AutoPostBack="False" CausesValidation="False" runat="server" CssClass="pull-left text-left" Text="Problem With Paper or Run,Extra Paper Pulled,Short,Sticking,Offsetting,etc:"></telerik:RadCheckBox>
                            <%--<telerik:RadLabel ID="RadlblProblemWithPaper" runat="server" AssociatedControlID="RadChkProblemWithPaper" Text="Problem With Paper or Run,Extra Paper Pulled,Short,Sticking,Offsetting,etc:"  CssClass="form-control-label">
                                </telerik:RadLabel></span>--%>
                        </div>
                        <div class="col-sm-8">
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtProblemWithPaper" runat="server" CssClass="commentsTextBox"></telerik:RadTextBox>
                        </div>
                    </div>


                    <div class="margin-bottom"></div>


                    <div class="form-group row">
                        <div class="col-sm-4">
                            <telerik:RadCheckBox ID="RadChkProblemWithInk" runat="server" AutoPostBack="False" CausesValidation="False" Text="problem With Ink or Coating:"></telerik:RadCheckBox>
                            <%-- <telerik:RadLabel ID="RadlblProblemWithInk" runat="server" Text="problem With Ink or Coating:" CssClass="label">
                                </telerik:RadLabel>--%>
                        </div>
                        <div class="col-sm-8">
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtProblemWithInk" runat="server" CssClass="commentsTextBox"></telerik:RadTextBox>
                        </div>
                    </div>


                    <div class="margin-bottom"></div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <telerik:RadCheckBox ID="RadChkProblemWithPress" AutoPostBack="False" CausesValidation="False" runat="server" Text="Problem With Press:"></telerik:RadCheckBox>
                            <%--<telerik:RadLabel ID="RadlblProblemWithPress" runat="server" Text="Problem With Press:" CssClass="label">
                                </telerik:RadLabel>--%>
                        </div>
                        <div class="col-sm-8">
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtProblemWithPress" runat="server" CssClass="commentsTextBox"></telerik:RadTextBox>
                        </div>
                    </div>

                    <div class="margin-bottom"></div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <telerik:RadCheckBox ID="RadChkMaintenancePerformed" AutoPostBack="False" CausesValidation="False" runat="server" Text="Maintenance Performed:"></telerik:RadCheckBox>
                            <%--  <telerik:RadLabel ID="RadlblMaintenancePerformed" runat="server" Text="Maintenance Performed:" CssClass="label">
                                </telerik:RadLabel>--%>
                        </div>
                        <div class="col-sm-8">
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtMaintenancePerformed" runat="server" CssClass="commentsTextBox"></telerik:RadTextBox>
                        </div>
                    </div>


                    <div class="margin-bottom"></div>

                    <div class="form-group logos col-lg-12">
                        <h1 class="text-left margintop"><small>Forms</small></h1>

                    </div>
                    <div class="form-group">
                        <div class="col-lg-12">
                            <telerik:RadLabel ID="RadlblFront" runat="server" Text="Front:" CssClass="label">
                            </telerik:RadLabel>
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtFront" runat="server" CssClass="input-lg "></telerik:RadTextBox>
                            <br />
                            <br />
                            <telerik:RadLabel ID="RadlblBack" runat="server" Text="Back:" CssClass="label">
                            </telerik:RadLabel>
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadtxtBack" runat="server" CssClass="input-lg "></telerik:RadTextBox>
                            <telerik:RadButton ID="btnAddmore" runat="server" Text="Add More" AutoPostBack="False" CausesValidation="False"></telerik:RadButton>

                        </div>
                    </div>

                    <br />



                    <div class="form-group">
                        <center> <telerik:RadButton ID="btnSave" Text="Save" runat="server" class="btn btn-primary btn-block " ValidationGroup="MorJob"></telerik:RadButton></center>

                    </div>


                </div>
            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>

