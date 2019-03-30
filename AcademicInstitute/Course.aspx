<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="AcademicInstitute.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="page-header">
		<h2>Course Details</h2>
					
		<div class="right-wrapper pull-right">
			<ol class="breadcrumbs">
				<li>
				    <a href="#">
				    <i class="fa fa-home"></i>
					</a>
				</li>
			    <li><span>Course Details <br/> </span></li>
			</ol>	
		    <a></a>
		</div>
	</header>

    <section class="panel">
        <div class="panel-body tab-content">
            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Course List</i>
                <div class="right-wrapper pull-right">
                     <!-- Modal -->
                </div>
            </header>
            <br />

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_CODE" DataSourceID="SqlDataSource3" CssClass="form-horizontal">
                
                <InsertItemTemplate>
                    <asp:Label runat="server" class="col-sm-4 control-label">COURSE_CODE:</asp:Label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="COURSE_CODETextBox" class="form-control" runat="server" Text='<%# Bind("COURSE_CODE") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="* Course code is required" style="color:red" ControlToValidate="COURSE_CODETextBox"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="* Course code not valid" ControlToValidate="COURSE_CODETextBox" style="color:red" ValidationExpression="^[A-Z]+[\d\d\d\d]+[A-Z]*$"></asp:RegularExpressionValidator>    
                        <br /></div>

                    <asp:Label runat="server" class="col-sm-4 control-label">COURSE_NAME:</asp:Label>
                    <div class="col-sm-8">
                    <asp:TextBox ID="COURSE_NAMETextBox" runat="server" class="form-control" Text='<%# Bind("COURSE_NAME") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="* Course name is required" style="color:red" ControlToValidate="COURSE_NAMETextBox"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ErrorMessage="* Course Name is not valid" ControlToValidate="COURSE_NAMETextBox" style="color:red" ValidationExpression="^[a-zA-Z]*$"></asp:RegularExpressionValidator>   
                        <br /></div>

                    <asp:Label runat="server" class="col-sm-4 control-label">CREDIT_HOUR:</asp:Label>
                    <div class="col-sm-8">
                    <asp:TextBox ID="CREDIT_HOURTextBox" runat="server" class="form-control" Text='<%# Bind("CREDIT_HOUR") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="* Credit hour is required" style="color:red" ControlToValidate="CREDIT_HOURTextBox"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ErrorMessage="* Credit hour must be in number" ControlToValidate="CREDIT_HOURTextBox" style="color:red" ValidationExpression="^(\d\d)?$"></asp:RegularExpressionValidator>    
                        <br /></div>

                    <asp:Label runat="server" class="col-sm-4 control-label">COURSE_LEADER:</asp:Label>
                    <div class="col-sm-8">
                    <asp:DropDownList ID="DropDownList3" class="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="FIRST_NAME" DataValueField="STAFF_ID" SelectedValue='<%# Bind("COURSE_LEADER") %>'>
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

            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_ID, STAFF.FIRST_NAME FROM STAFF, MODULE_LEADER WHERE STAFF.STAFF_ID = MODULE_LEADER.MODULE_LEADER_ID"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COURSE_CODE" DataSourceID="SqlDataSource3" BorderColor="Silver" BorderStyle="None" BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of all Students" Width="950px" EmptyDataText="No data available" PageIndex="1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" >
<ControlStyle CssClass="btn btn-primary"></ControlStyle>
                    </asp:CommandField>
                    <asp:BoundField DataField="COURSE_CODE" HeaderText="Course Code" ReadOnly="True" SortExpression="COURSE_CODE" />
                    <asp:BoundField DataField="COURSE_NAME" HeaderText="Course Name" SortExpression="COURSE_NAME" />
                    <asp:BoundField DataField="CREDIT_HOUR" HeaderText="Credit Hour" SortExpression="CREDIT_HOUR" />
                    <asp:BoundField DataField="COURSE_LEADER" HeaderText="Course Leader Id" SortExpression="COURSE_LEADER" />
                    <asp:TemplateField HeaderText="Course Leader Name">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" Enabled="False" runat="server" DataSourceID="SqlDataSource4" DataTextField="NAME" DataValueField="STAFF_ID" SelectedValue='<%# Bind("COURSE_LEADER") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COURSE&quot; WHERE &quot;COURSE_CODE&quot; = :COURSE_CODE" InsertCommand="INSERT INTO &quot;COURSE&quot; (&quot;COURSE_LEADER&quot;, &quot;CREDIT_HOUR&quot;, &quot;COURSE_NAME&quot;, &quot;COURSE_CODE&quot;) VALUES (:COURSE_LEADER, :CREDIT_HOUR, :COURSE_NAME, :COURSE_CODE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COURSE_CODE, COURSE_NAME, CREDIT_HOUR, COURSE_LEADER FROM COURSE" UpdateCommand="UPDATE &quot;COURSE&quot; SET &quot;COURSE_LEADER&quot; = :COURSE_LEADER, &quot;CREDIT_HOUR&quot; = :CREDIT_HOUR, &quot;COURSE_NAME&quot; = :COURSE_NAME WHERE &quot;COURSE_CODE&quot; = :COURSE_CODE">
                <DeleteParameters>
                    <asp:Parameter Name="COURSE_CODE" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="COURSE_LEADER" Type="String" />
                    <asp:Parameter Name="CREDIT_HOUR" Type="Decimal" />
                    <asp:Parameter Name="COURSE_NAME" Type="String" />
                    <asp:Parameter Name="COURSE_CODE" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="COURSE_LEADER" Type="String" />
                    <asp:Parameter Name="CREDIT_HOUR" Type="Decimal" />
                    <asp:Parameter Name="COURSE_NAME" Type="String" />
                    <asp:Parameter Name="COURSE_CODE" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STAFF_ID&quot;, &quot;FIRST_NAME&quot; || ' ' || last_name AS name FROM &quot;STAFF&quot;"></asp:SqlDataSource>
            <br />
        </div>
    </section>
</asp:Content>
