<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TeacherStudent.aspx.cs" Inherits="AcademicInstitute.TeacherStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="page-header">
		<h2>Teacher Student</h2>
					
		<div class="right-wrapper pull-right">
			<ol class="breadcrumbs">
				<li>
				    <a href="#">
				    <i class="fa fa-home"></i>
					</a>
				</li>
			    <li><span>Student Possessed by Teacher <br/> </span></li>
			</ol>
					
		    <a></a>
		</div>
	</header>

    <section class="panel">
        <div class="panel-body tab-content">

            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Student Possessed List</i>
                <div class="right-wrapper pull-right">
                     <!-- Modal -->
                </div>
            </header>
            	
            <br />
             <div class="right-wrapper pull-right">
                <asp:Label runat="server" Font-Bold="True">Select a teacher: </asp:Label>
                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TEACHER.TEACHER_ID||'-'||STAFF.FIRST_NAME||''||STAFF.LAST_NAME" DataValueField="TEACHER_ID" AutoPostBack="True"></asp:DropDownList>
                 </div>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT TEACHER.TEACHER_ID, TEACHER.TEACHER_ID || '- ' || STAFF.FIRST_NAME || ' ' || STAFF.LAST_NAME FROM STAFF, TEACHER WHERE STAFF.STAFF_ID = TEACHER.TEACHER_ID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT TEACHER.TEACHER_ID, STAFF.FIRST_NAME, STUDENT.STUDENT_ID, STUDENT.FIRST_NAME AS STUDENT_NAME FROM STAFF, TEACHER, TEACHER_STUDENT, STUDENT WHERE STAFF.STAFF_ID = TEACHER.TEACHER_ID AND TEACHER.TEACHER_ID = TEACHER_STUDENT.TEACHER_ID AND TEACHER_STUDENT.STUDENT_ID = STUDENT.STUDENT_ID AND (TEACHER.TEACHER_ID = :TEACHER_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="TEACHER_ID" PropertyName="SelectedValue" Type="String" DefaultValue="s66" />
                </SelectParameters>
            </asp:SqlDataSource>


            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TEACHER_ID,STUDENT_ID" DataSourceID="SqlDataSource2" EmptyDataText="No Student possessed yet" BorderColor="Silver" BorderStyle="None" BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of the student possessed by selected teacher" Width="950px" PageIndex="1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="TEACHER_ID" HeaderText="Teacher Id" ReadOnly="True" SortExpression="TEACHER_ID" />
                    <asp:BoundField DataField="FIRST_NAME" HeaderText="First Name" SortExpression="FIRST_NAME" />
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="Student Id" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="STUDENT_NAME" HeaderText="Student Name" SortExpression="STUDENT_NAME" />
                </Columns>
            </asp:GridView>

        </div>
    </section>


</asp:Content>
