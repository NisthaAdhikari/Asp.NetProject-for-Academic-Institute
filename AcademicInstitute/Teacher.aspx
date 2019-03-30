<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="AcademicInstitute.Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="page-header">
		<h2>Teacher Details</h2>
					
		<div class="right-wrapper pull-right">
			<ol class="breadcrumbs">
				<li>
				    <a href="#">
				    <i class="fa fa-home"></i>
					</a>
				</li>
			    <li><span>Teacher Details <br/> </span></li>
			</ol>
					
		    <a></a>
		</div>
	</header>

    <section class="panel">
        <div class="panel-body tab-content">
            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Teacher List</i>
                <div class="right-wrapper pull-right">
                     <!-- Modal -->
                </div>
            </header>
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="STAFF_ID" DataSourceID="SqlDataSourceStaffID" CssClass="form-horizontal">
               
                <InsertItemTemplate>
                    <asp:Label runat="server" class="col-sm-4 control-label">TEACHER_ID:</asp:Label>
                     <div class="col-sm-8">
                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceStaffID" DataTextField="TEACHERNAME" DataValueField="STAFF_ID" SelectedValue='<%# Bind("STAFF_ID") %>'>
                    </asp:DropDownList>
                    <br /></div>
                    <div style="float:right">
                        <br />
                    <asp:LinkButton ID="InsertButton" class="btn btn-primary" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" class="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </div>
                        </InsertItemTemplate>
                <ItemTemplate>
                    
                   <asp:LinkButton ID="NewButton" class="btn btn-primary" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceStaffID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STAFF&quot; WHERE &quot;STAFF_ID&quot; = :STAFF_ID" InsertCommand="INSERT INTO TEACHER(TEACHER_ID) VALUES (:STAFF_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT staff_id, staff_id || '-' || first_name || ' ' || last_name AS TeacherName FROM STAFF" UpdateCommand="UPDATE &quot;STAFF&quot; SET &quot;FIRST_NAME&quot; = :FIRST_NAME, &quot;LAST_NAME&quot; = :LAST_NAME, &quot;CONTACT_NO&quot; = :CONTACT_NO, &quot;EMAIL&quot; = :EMAIL, &quot;DOB&quot; = :DOB WHERE &quot;STAFF_ID&quot; = :STAFF_ID">
                <DeleteParameters>
                    <asp:Parameter Name="STAFF_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="STAFF_ID" Type="String" />
                   
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FIRST_NAME" Type="String" />
                    <asp:Parameter Name="LAST_NAME" Type="String" />
                    <asp:Parameter Name="CONTACT_NO" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="DOB" Type="String" />
                    <asp:Parameter Name="STAFF_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STAFF_ID" DataSourceID="SqlDataSource1" BorderColor="Silver" BorderStyle="None" BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of all Teachers" Width="950px" EmptyDataText="No data available" PageIndex="1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" />
                    <asp:BoundField DataField="STAFF_ID" HeaderText="Staff Id" ReadOnly="True" SortExpression="STAFF_ID" />
                    <asp:BoundField DataField="FIRST_NAME" HeaderText="First Name" SortExpression="FIRST_NAME" />
                    <asp:BoundField DataField="LAST_NAME" HeaderText="Last Name" SortExpression="LAST_NAME" />
                    <asp:BoundField DataField="CONTACT_NO" HeaderText="Contact Number" SortExpression="CONTACT_NO" />
                    <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
                    <asp:BoundField DataField="DOB" HeaderText="Date of Birth" SortExpression="DOB" />
                </Columns>
            </asp:GridView>
            <br />


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_ID, STAFF.FIRST_NAME, STAFF.LAST_NAME, STAFF.CONTACT_NO, STAFF.EMAIL, STAFF.DOB FROM STAFF, TEACHER WHERE STAFF.STAFF_ID = TEACHER.TEACHER_ID" UpdateCommand="UPDATE STAFF SET FIRST_NAME = :FIRST_NAME, LAST_NAME = :LAST_NAME, CONTACT_NO = :CONTACT_NO, EMAIL = :EMAIL, DOB = :DOB WHERE (STAFF_ID = :STAFF_ID)" DeleteCommand="DELETE
FROM
    TEACHER
WHERE
    TEACHER_id = :staff_id
" InsertCommand="INSERT INTO STAFF(FIRST_NAME, LAST_NAME, CONTACT_NO, EMAIL, DOB) VALUES (:FIRST_NAME, :LAST_NAME, :CONTACT_NO, :EMAIL, :DOB)"
                
                >
                <DeleteParameters>
                    <asp:Parameter Name="staff_id" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FIRST_NAME" />
                    <asp:Parameter Name="LAST_NAME" />
                    <asp:Parameter Name="CONTACT_NO" />
                    <asp:Parameter Name="EMAIL" />
                    <asp:Parameter Name="DOB" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FIRST_NAME" />
                    <asp:Parameter Name="LAST_NAME" />
                    <asp:Parameter Name="CONTACT_NO" />
                    <asp:Parameter Name="EMAIL" />
                    <asp:Parameter Name="DOB" />
                    <asp:Parameter Name="STAFF_ID" />
                </UpdateParameters>
            </asp:SqlDataSource>


        </div>

    </section>
    
    <section class="panel">
        <div class="panel-body tab-content">
            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Module Leader List</i>
                <div class="right-wrapper pull-right">
                     <!-- Modal -->
                </div>
            </header>
            <br />

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="STAFF_ID" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" BorderColor="Silver" BorderStyle="None" BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of all Module Leaders" Width="950px" EmptyDataText="No data available" PageIndex="1">
                <Columns>
                    <asp:BoundField DataField="STAFF_ID" HeaderText="Module Leader Id" ReadOnly="True" SortExpression="STAFF_ID" />
                    <asp:BoundField DataField="STAFF.FIRST_NAME||''||STAFF.LAST_NAME" HeaderText="Module Leader Name" SortExpression="STAFF.FIRST_NAME||''||STAFF.LAST_NAME" />
                </Columns>
            </asp:GridView>


            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_ID, STAFF.FIRST_NAME || ' ' || STAFF.LAST_NAME FROM STAFF, MODULE_LEADER WHERE STAFF.STAFF_ID = MODULE_LEADER.MODULE_LEADER_ID"></asp:SqlDataSource>
        </div>
    </section>

    
    <section class="panel">
        <div class="panel-body tab-content">
            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Lecturer List</i>
                <div class="right-wrapper pull-right">
                     <!-- Modal -->
                </div>
            </header>
            <br />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="STAFF_ID" DataSourceID="SqlDataSource3" BorderColor="Silver" BorderStyle="None" BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of all Lecturers" Width="950px" EmptyDataText="No data available" PageIndex="1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="STAFF_ID" HeaderText="Lecturer Id" ReadOnly="True" SortExpression="STAFF_ID" />
                    <asp:BoundField DataField="NAME" HeaderText="Lecturer Name" SortExpression="NAME" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_ID, STAFF.FIRST_NAME || ' ' || STAFF.LAST_NAME AS name FROM STAFF, LECTURER WHERE STAFF.STAFF_ID = LECTURER.LECTURER_ID"></asp:SqlDataSource>

        </div>
    </section>

    <section class="panel">
        <div class="panel-body tab-content">
            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Tutor List</i>
                <div class="right-wrapper pull-right">
                     <!-- Modal -->
                </div>
            </header>
            <br />
            <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STAFF_ID" DataSourceID="SqlDataSource4" BorderColor="Silver" BorderStyle="None" BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of all Tutor" Width="950px" EmptyDataText="No data available" PageIndex="1">
                <Columns>
                    <asp:BoundField DataField="STAFF_ID" HeaderText="Tutor Id" ReadOnly="True" SortExpression="STAFF_ID" />
                    <asp:BoundField DataField="NAME" HeaderText="Tutor Name" SortExpression="NAME" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_ID, STAFF.FIRST_NAME || ' ' || STAFF.LAST_NAME AS name FROM STAFF, TUTOR WHERE STAFF.STAFF_ID = TUTOR.TUTOR_ID"></asp:SqlDataSource>
        </div>
    </section>

</asp:Content>
