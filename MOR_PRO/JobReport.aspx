<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSingleMenu.master" AutoEventWireup="true" CodeFile="JobReport.aspx.cs" Inherits="JobReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="styles/RadtextBox.css" rel="stylesheet" />
    <link href="Css/bootstrap.css" rel="stylesheet" />
    <link href="Css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="Js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   

    <div class="container-fluid">
            <div class="col-lg-12">
                <center><h2>Press Report</h2></center>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 pull-left">

                            <telerik:RadLabel ID="lblJobId" runat="server" Text="JOB#:"></telerik:RadLabel>

                            <telerik:RadTextBox RenderMode="Lightweight" ID="txtJob" runat="server"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RQJob" runat="server" Display="Dynamic"
                                ControlToValidate="txtJob" ErrorMessage="This is Required Field"></asp:RequiredFieldValidator>

                        </div>

                        <div class="col-lg-6 pull-right">

                            <telerik:RadLabel ID="lblStartTime" runat="server" Text="START TIME:"></telerik:RadLabel>

                            <telerik:RadDatePicker RenderMode="Lightweight" ID="CalStartDate" runat="server" Width="127px">
                            </telerik:RadDatePicker>
                            <telerik:RadTimePicker RenderMode="Lightweight" ID="CalStartTime" runat="server"
                                Width="120px">
                            </telerik:RadTimePicker>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-6 pull-left">

                            <telerik:RadLabel ID="lblPreessOperator" runat="server" Text="PESS OPERATOR:"></telerik:RadLabel>

                            <telerik:RadDropDownList RenderMode="Lightweight" ID="ddlPressOperator" runat="server" Skin="Sunset"
                                DefaultMessage="Select OPERATOR">
                            </telerik:RadDropDownList>
                        </div>

                        <div class="col-lg-6 pull-right">
                             <telerik:RadLabel ID="lblEndTime" runat="server" Text="END TIME:"></telerik:RadLabel>
                            <telerik:RadDateTimePicker RenderMode="Lightweight" ID="CalEndtime" ShowPopupOnFocus="true"  runat="server" >
                            </telerik:RadDateTimePicker>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    <div class="container-fluid">
  <div class="row">
   
  </div>
</div>
       


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>

