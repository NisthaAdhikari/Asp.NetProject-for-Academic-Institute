<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TeacherCourse.aspx.cs" Inherits="AcademicInstitute.TeacherCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="page-header">
		<h2>Course and Teacher Assigned Details</h2>
					
		<div class="right-wrapper pull-right">
			<ol class="breadcrumbs">
				<li>
				    <a href="#">
				    <i class="fa fa-home"></i>
					</a>
				</li>
			    <li><span>Course and Teacher Assigned Details<br/> </span></li>
			</ol>
					
		    <a></a>
		</div>
	</header>

    <section class="panel">
        <div class="panel-body tab-content">

            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Course and Teacher Assigned List</i>
                
            </header>
            <br />
            <div class="right-wrapper pull-right">
                <asp:Label runat="server" Font-Bold="True">Select a course: </asp:Label>
                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_NAME" DataValueField="COURSE_CODE" AutoPostBack="True"></asp:DropDownList>
                 </div>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_CODE&quot;, &quot;COURSE_NAME&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>


            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource2" EmptyDataText="No Teacher assigned yet" BorderColor="Silver" BorderStyle="None" BorderWidth="0px" CssClass="table-hover table-condensed table-responsive" HorizontalAlign="Justify" ToolTip="Details of the selected course and teacher assigned to it" Width="950px" PageIndex="1">
                
                <Columns>
                    <asp:BoundField DataField="COURSE_CODE" HeaderText="Course Code" SortExpression="COURSE_CODE" />
                    <asp:BoundField DataField="COURSE_NAME" HeaderText="Course Name" SortExpression="COURSE_NAME" />
                    <asp:BoundField DataField="CREDIT_HOUR" HeaderText="Credit Hour" SortExpression="CREDIT_HOUR" />
                    <asp:BoundField DataField="CLASS_TYPE" HeaderText="Class Type" SortExpression="CLASS_TYPE" />
                    <asp:BoundField DataField="TEACHER_ID" HeaderText="Teacher Id" SortExpression="TEACHER_ID" />
                    <asp:BoundField DataField="FIRST_NAME" HeaderText="Teacher's First Name" SortExpression="FIRST_NAME" />
                    <asp:BoundField DataField="LAST_NAME" HeaderText="Teacher's Last Name" SortExpression="LAST_NAME" />
                    <asp:BoundField DataField="CONTACT_NO" HeaderText="CONTACT_NO" SortExpression="CONTACT_NO" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.COURSE_CODE, COURSE.COURSE_NAME, COURSE.CREDIT_HOUR, c.CLASS_TYPE, c.TEACHER_ID, s.FIRST_NAME, s.LAST_NAME, s.CONTACT_NO, s.EMAIL FROM STAFF s, COURSE_CLASS c, CLASS, COURSE WHERE s.STAFF_ID = c.TEACHER_ID AND c.ROOM_ID = CLASS.ROOM_ID AND c.COURSE_CODE = COURSE.COURSE_CODE AND (c.COURSE_CODE = :COURSE_CODE)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="COURSE_CODE" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            </div>
        </section>


</asp:Content>
