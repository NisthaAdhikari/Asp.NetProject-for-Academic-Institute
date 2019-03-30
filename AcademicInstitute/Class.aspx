<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Class.aspx.cs" Inherits="AcademicInstitute.Class" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="page-header">
		<h2>Class Details</h2>
					
		<div class="right-wrapper pull-right">
			<ol class="breadcrumbs">
				<li>
				    <a href="#">
				    <i class="fa fa-home"></i>
					</a>
				</li>
			    <li><span>Class Details <br/> </span></li>
			</ol>
					
		    <a></a>
		</div>
	</header>


    <section class="panel">
        <div class="panel-body tab-content">



            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Class List</i>
                <div class="right-wrapper pull-right">
                     <!-- Modal -->
                </div>
            </header>

            <asp:SqlDataSource ID="SqlDataSourceClass" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" DeleteCommand="DELETE FROM &quot;CLASS&quot; WHERE &quot;ROOM_ID&quot; = :ROOM_ID" InsertCommand="INSERT INTO &quot;CLASS&quot; (&quot;ROOM_ID&quot;, &quot;ROOM_NAME&quot;) VALUES (:ROOM_ID, :ROOM_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT &quot;ROOM_ID&quot;, &quot;ROOM_NAME&quot; FROM &quot;CLASS&quot;" UpdateCommand="UPDATE &quot;CLASS&quot; SET &quot;ROOM_NAME&quot; = :ROOM_NAME WHERE &quot;ROOM_ID&quot; = :ROOM_ID">
                <DeleteParameters>
                    <asp:Parameter Name="ROOM_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ROOM_ID" Type="String" />
                    <asp:Parameter Name="ROOM_NAME" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ROOM_NAME" Type="String" />
                    <asp:Parameter Name="ROOM_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ROOM_ID" CssClass="form-horizontal" DataSourceID="SqlDataSourceClass">
               
                <InsertItemTemplate>
                    
                    <asp:Label runat="server" class="col-sm-4 control-label">ROOM_ID:</asp:Label>
                    <div class="col-sm-8">
                    <asp:TextBox ID="ROOM_IDTextBox" class="form-control" runat="server" Text='<%# Bind("ROOM_ID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="* Room Id is required" style="color:red" ControlToValidate="ROOM_IDTextBox"></asp:RequiredFieldValidator>
                        <br /></div>
                    <asp:Label runat="server" class="col-sm-4 control-label">ROOM_NAME:</asp:Label>
                    <div class="col-sm-8">
                    <asp:TextBox ID="ROOM_NAMETextBox" class="form-control" runat="server" Text='<%# Bind("ROOM_NAME") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="* Room name is required" style="color:red" ControlToValidate="ROOM_NAMETextBox"></asp:RequiredFieldValidator>
                        <br /></div>
                    <div style="float:right">
                    <asp:LinkButton ID="InsertButton" runat="server" class="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" class="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </div>
                        </InsertItemTemplate>
                <ItemTemplate>
                    
                    
                    
                    &nbsp;<asp:LinkButton ID="NewButton" class="btn btn-primary" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>

            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ROOM_ID" 
                DataSourceID="SqlDataSourceClass" EmptyDataText="No data available" ShowHeaderWhenEmpty="True" BorderColor="Silver" BorderStyle="None"
                BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of all Class" Width="950px" PageIndex="1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary">
<ControlStyle CssClass="btn btn-primary"></ControlStyle>
                    </asp:CommandField>
                    <asp:BoundField DataField="ROOM_ID" HeaderText="Room Id" ReadOnly="True" SortExpression="ROOM_ID" />
                    <asp:BoundField DataField="ROOM_NAME" HeaderText="Room Name" SortExpression="ROOM_NAME" />
                </Columns>
            </asp:GridView>




        </div>
    </section>

    <div class="panel-body tab-content">

            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Class Details</i>
                
            </header>
            <br />

        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            BorderColor="Silver" BorderStyle="None" BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of all Students" Width="950px" EmptyDataText="No data available" PageIndex="1" >
            <Columns>
                <asp:BoundField DataField="COURSE_CODE" HeaderText="COURSE_CODE" SortExpression="COURSE_CODE" />
                <asp:BoundField DataField="COURSE_NAME" HeaderText="COURSE_NAME" SortExpression="COURSE_NAME" />
                <asp:BoundField DataField="CLASS_TYPE" HeaderText="CLASS_TYPE" SortExpression="CLASS_TYPE" />
                <asp:BoundField DataField="TIME" HeaderText="TIME" SortExpression="TIME" />
                <asp:BoundField DataField="DAY" HeaderText="DAY" SortExpression="DAY" />
                <asp:BoundField DataField="ROOM_NAME" HeaderText="ROOM_NAME" SortExpression="ROOM_NAME" />
                <asp:BoundField DataField="TEACHER_ID" HeaderText="TEACHER_ID" SortExpression="TEACHER_ID" />
                <asp:BoundField DataField="FIRST_NAME" HeaderText="FIRST_NAME" SortExpression="FIRST_NAME" />
            </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.COURSE_CODE, COURSE.COURSE_NAME, c.CLASS_TYPE, c.&quot;TIME&quot;, c.DAY, CLASS.ROOM_NAME, c.TEACHER_ID, s.FIRST_NAME FROM STAFF s, COURSE_CLASS c, CLASS, COURSE WHERE s.STAFF_ID = c.TEACHER_ID AND c.ROOM_ID = CLASS.ROOM_ID AND c.COURSE_CODE = COURSE.COURSE_CODE"></asp:SqlDataSource>

        </div>

</asp:Content>
