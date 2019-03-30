<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AssignmentMarks.aspx.cs" Inherits="AcademicInstitute.AssignmentMarks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <header class="page-header">
		<h2>Students Obtained Marks Details</h2>
					
		<div class="right-wrapper pull-right">
			<ol class="breadcrumbs">
				<li>
				    <a href="#">
				    <i class="fa fa-home"></i>
					</a>
				</li>
			    <li><span>Students Obtained Marks Details<br/> </span></li>
			</ol>
					
		    <a></a>
		</div>
	</header>


    <section class="panel-featured.panel-featured-primary">
        <div class="panel-body tab-content">

            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Assignment marks of Student</i>
                
            </header>
            <br />
            <div class="right-wrapper pull-right">
                
                <asp:Label runat="server" Font-Bold="True">Select a student: </asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="NAME" DataValueField="STUDENT_ID" AutoPostBack="True"></asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_ID&quot; || '- ' || &quot;FIRST_NAME&quot; || ' ' ||  last_name AS name FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
            
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,COURSE_CODE,ASSIGNMENT_ID" DataSourceID="SqlDataSource3" EmptyDataText="No Marks to show" BorderColor="Silver" BorderStyle="None" BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of the selected course and teacher assigned to it" Width="950px" PageIndex="1" AllowPaging="True" AllowSorting="True" >
                <Columns>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="Student Id" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="NAME" HeaderText="Student Name" SortExpression="NAME" />
                    <asp:BoundField DataField="COURSE_CODE" HeaderText="Course Code" SortExpression="COURSE_CODE" ReadOnly="True" />
                    <asp:BoundField DataField="ASSIGNMENT_ID" HeaderText="Assignment Id" SortExpression="ASSIGNMENT_ID" ReadOnly="True" />
                    <asp:BoundField DataField="ASSIGNMENT_MARKS" HeaderText="Obtained Assignment Marks" SortExpression="ASSIGNMENT_MARKS" />
                    <asp:BoundField DataField="ASSIGNMENT_TYPE" HeaderText="Assignment Type" SortExpression="ASSIGNMENT_TYPE" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT a.STUDENT_ID, STUDENT.FIRST_NAME || ' ' || STUDENT.LAST_NAME AS name, a.COURSE_CODE, a.ASSIGNMENT_ID, a.ASSIGNMENT_MARKS, ASSIGNMENT.ASSIGNMENT_TYPE FROM STUDENT, ASSIGNMENT_COURSE_STUDENT a, ASSIGNMENT WHERE STUDENT.STUDENT_ID = a.STUDENT_ID AND a.ASSIGNMENT_ID = ASSIGNMENT.ASSIGNMENT_ID AND (a.STUDENT_ID = :STUDENT_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="STUDENT_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        
            <br />
            </div></section>
            <section class="panel">
        <div class="panel-body tab-content">

            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Total marks with Completed Year</i>
                
            </header>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EmptyDataText="No marks to display" BorderColor="Silver" BorderStyle="None" BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of the selected course and teacher assigned to it" Width="950px" PageIndex="1">
                <Columns>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="Student Id" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="COURSE_CODE" HeaderText="Course Code" SortExpression="COURSE_CODE" />
                    <asp:BoundField DataField="TOTAL_MARKS" HeaderText="Total Obtained Marks" SortExpression="TOTAL_MARKS" />
                    <asp:TemplateField HeaderText="Completed Year">
                        <ItemTemplate>
                            2018
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT student_id, course_code, AVG(ASSIGNMENT_MARKS) AS TOTAL_MARKS FROM ASSIGNMENT_COURSE_STUDENT WHERE (STUDENT_ID = :STUDENT_ID) GROUP BY COURSE_CODE, STUDENT_ID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="STUDENT_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>





    </section>



</asp:Content>
