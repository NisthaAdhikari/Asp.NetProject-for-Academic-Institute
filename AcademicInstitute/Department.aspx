<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="AcademicInstitute.Department" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="page-header">
		<h2>Department Details</h2>
					
		<div class="right-wrapper pull-right">
			<ol class="breadcrumbs">
				<li>
				    <a href="#">
				    <i class="fa fa-home"></i>
					</a>
				</li>
			    <li><span>Department Details <br/> </span></li>
			</ol>
					
		    <a></a>
		</div>
	</header>

    <section class="panel">
        <div class="panel-body tab-content">



            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Department List</i>
                <div class="right-wrapper pull-right">
                     <!-- Modal -->
                </div>
            </header>
            				


            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="DEPARTMENT_ID" DataSourceID="SqlDataSourceDepartment" CssClass="form-horizontal">
                
                <InsertItemTemplate>
                    <asp:Label runat="server" class="col-sm-4 control-label">DEPARTMENT_ID:</asp:Label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="DEPARTMENT_IDTextBox" class="form-control" runat="server" Text='<%# Bind("DEPARTMENT_ID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="* Department ID is required" style="color:red" ControlToValidate="DEPARTMENT_IDTextBox"></asp:RequiredFieldValidator>
                    </div>
                        
                    <asp:Label runat="server" class="col-sm-4 control-label">DEPARTMENT_NAME:</asp:Label>
                    <div class="col-sm-8">
                        <asp:TextBox class="form-control" ID="DEPARTMENT_NAMETextBox" runat="server" Text='<%# Bind("DEPARTMENT_NAME") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="* Department name is required" style="color:red" ControlToValidate="DEPARTMENT_NAMETextBox"></asp:RequiredFieldValidator>
                    </div>
                        <br />
                    <br />
                    <div style="float:right">
                        <br />
                    <asp:LinkButton ID="InsertButton" class="btn btn-primary" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" OnClick="InsertButton_Click" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton"  class="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>
                        </InsertItemTemplate>
                <ItemTemplate>
                  
                    
                    &nbsp;<asp:LinkButton ID="NewButton" class="btn btn-primary" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>

            <br />

            <asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" DeleteCommand="DELETE FROM &quot;DEPARTMENT&quot; WHERE &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID" InsertCommand="INSERT INTO &quot;DEPARTMENT&quot; (&quot;DEPARTMENT_ID&quot;, &quot;DEPARTMENT_NAME&quot;) VALUES (:DEPARTMENT_ID, :DEPARTMENT_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT &quot;DEPARTMENT_ID&quot;, &quot;DEPARTMENT_NAME&quot; FROM &quot;DEPARTMENT&quot;" UpdateCommand="UPDATE &quot;DEPARTMENT&quot; SET &quot;DEPARTMENT_NAME&quot; = :DEPARTMENT_NAME WHERE &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                    <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                    <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>




            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSourceDepartment" BorderColor="Silver" BorderStyle="None" BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of all Students" Width="950px" EmptyDataText="No data available" PageIndex="1" AutoGenerateColumns="False" DataKeyNames="DEPARTMENT_ID">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-primary">
<ControlStyle CssClass="btn btn-primary"></ControlStyle>
                    </asp:CommandField>
                    <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="Department Id" ReadOnly="True" SortExpression="DEPARTMENT_ID" />
                    <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="Department Name" SortExpression="DEPARTMENT_NAME" />
                </Columns>
            </asp:GridView>





        </div>
    </section>
</asp:Content>
