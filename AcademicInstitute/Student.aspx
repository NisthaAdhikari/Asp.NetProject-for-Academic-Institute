<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="AcademicInstitute.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <header class="page-header">
						<h2>Student Details</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Student Details <br/> </span></li>
							</ol>
					
							<a></a>
						</div>
	</header>
    
    <section class="panel">
        <div class="panel-body tab-content">
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>

                      <div class="modal-body">
                        
                      </div>
                      
                    </div>
                  </div>
                </div>
  
          

            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Student List</i>
                <div class="right-wrapper pull-right">
                     <!-- Modal -->
                
                </div>
                </header>
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1" CssClass="form-horizontal">
                
                <InsertItemTemplate>
                    <asp:Label runat="server" class="col-sm-4 control-label">STUDENT_ID:</asp:Label>
                    <div class="col-sm-8">
                    <asp:TextBox ID="STUDENT_IDTextBox" class="form-control"  runat="server" Text='<%# Bind("STUDENT_ID") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="* Student ID is required" style="color:red" ControlToValidate="STUDENT_IDTextBox"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^(\d+)?$" runat="server" style="color:red" ErrorMessage="* Id must be between 0-9" ControlToValidate="STUDENT_IDTextBox"></asp:RegularExpressionValidator>
                        <br /></div>
          
                    <asp:Label runat="server" class="col-sm-4 control-label">FIRST_NAME:</asp:Label>
                    <div class="col-sm-8">
                    <asp:TextBox ID="FIRST_NAMETextBox" runat="server" class="form-control" Text='<%# Bind("FIRST_NAME") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="* First Name is required" style="color:red" ControlToValidate="FIRST_NAMETextBox"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ErrorMessage="* Not a valid name" ControlToValidate="FIRST_NAMETextBox" style="color:red" ValidationExpression="^[a-zA-Z]*$"></asp:RegularExpressionValidator> 
                        <br /></div>
                    
                    <asp:Label runat="server" class="col-sm-4 control-label">LAST_NAME:</asp:Label>
                    <div class="col-sm-8">
                    <asp:TextBox ID="LAST_NAMETextBox" runat="server" class="form-control"  Text='<%# Bind("LAST_NAME") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ErrorMessage="* Last Name is required" style="color:red" ControlToValidate="LAST_NAMETextBox"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ErrorMessage="* Not a valid name" style="color:red" ControlToValidate="FIRST_NAMETextBox" ValidationExpression="^[a-zA-Z]*$"></asp:RegularExpressionValidator>   
                        <br /></div>
                    
                    <asp:Label runat="server" class="col-sm-4 control-label">DOB:</asp:Label>
                    <div class="col-sm-8">
                    <asp:TextBox ID="DOBTextBox" runat="server" class="form-control" Text='<%# Bind("DOB") %>' type="date"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ErrorMessage="* DOB is required" style="color:red" ControlToValidate="DOBTextBox"></asp:RequiredFieldValidator>
                        
                        <br /></div>
                    <div style="float:right">
                        <br />
                    <asp:LinkButton ID="InsertButton" runat="server" class="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" class="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </div>
                        </InsertItemTemplate>
                <ItemTemplate>
                    
                   <asp:LinkButton ID="NewButton" class="btn btn-primary" runat="server" CausesValidation="True" CommandName="New" Text="New"/>
                   
                </ItemTemplate>

            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_ID&quot;, &quot;FIRST_NAME&quot;, &quot;LAST_NAME&quot;, &quot;DOB&quot;) VALUES (:STUDENT_ID, :FIRST_NAME, :LAST_NAME, :DOB)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;STUDENT&quot;" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;FIRST_NAME&quot; = :FIRST_NAME, &quot;LAST_NAME&quot; = :LAST_NAME, &quot;DOB&quot; = :DOB WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                    <asp:Parameter Name="FIRST_NAME" Type="String" />
                    <asp:Parameter Name="LAST_NAME" Type="String" />
                    <asp:Parameter Name="DOB" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FIRST_NAME" Type="String" />
                    <asp:Parameter Name="LAST_NAME" Type="String" />
                    <asp:Parameter Name="DOB" Type="String" />
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1" BorderStyle="None" BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of all Students" Width="950px" EmptyDataText="No data available" PageIndex="1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-primary">
<ControlStyle CssClass="btn btn-primary"></ControlStyle>
                    </asp:CommandField>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="Student Id" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="FIRST_NAME" HeaderText="First Name" SortExpression="FIRST_NAME" />
                    <asp:BoundField DataField="LAST_NAME" HeaderText="Last Name" SortExpression="LAST_NAME" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                </Columns>
            </asp:GridView>
            <br />

            </div>
        </section>
</asp:Content>
