<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="AcademicInstitute.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<header class="page-header">
		<h2>Dashboard</h2>
					
		<div class="right-wrapper pull-right">
			<ol class="breadcrumbs">
				<li>
				    <a href="#">
				    <i class="fa fa-home"></i>
					</a>
				</li>
			    <li><span>Dashboard <br/> </span></li>
			</ol>
					
		    <a></a>
		</div>
	</header>

    <section class="panel col-md-6">
        <div class="panel-body tab-content">



            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Department Workforce</i>
               
            </header>
            				


            <br />
         

            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceDepartment" CssClass="chart chart-md" Height="400px" Palette="SeaGreen" Width="500px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="DEPARTMENT_NAME" YValueMembers="EXPR1"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
                
            </asp:Chart>

            <asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DEPARTMENT.DEPARTMENT_NAME, COUNT(DEPARTMENT_STAFF.STAFF_ID) AS EXPR1 FROM DEPARTMENT, DEPARTMENT_STAFF WHERE DEPARTMENT.DEPARTMENT_ID = DEPARTMENT_STAFF.DEPARTMENT_ID GROUP BY DEPARTMENT.DEPARTMENT_NAME"></asp:SqlDataSource>

            </div>
        </section>
					

        <section class="panel col-md-6">
        <div class="panel-body tab-content">

            <header class="panel-heading">
                <i class="fa fa-list" style="font-size:18px; font-weight:500"> Teachers for each Course</i>
               
            </header>
            <br />
         
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSourcecourse" Height="400px" Palette="Pastel" Width="500px">
                <Series>
                    <asp:Series Name="Series1" ChartType="Pie" IsXValueIndexed="True" Label="#VAL-- #VALX" XValueMember="COURSE_CODE" YValueMembers="EXPR1"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
                <Titles>
                    <asp:Title Name="Title1" Text="Number of Teachers assigned to each courses">
                    </asp:Title>
                </Titles>
            </asp:Chart>

           
            <asp:SqlDataSource ID="SqlDataSourcecourse" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(COURSE_CLASS.TEACHER_ID) AS EXPR1, COURSE.COURSE_CODE FROM COURSE_CLASS, COURSE WHERE COURSE_CLASS.COURSE_CODE = COURSE.COURSE_CODE GROUP BY COURSE.COURSE_CODE"></asp:SqlDataSource>

           
            </div>
            </section>

    <div class="col-md-6 col-lg-12 col-xl-6">
							<div class="row">
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-primary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-primary">
														<i class="fa fa-institution"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Total Students</h4>
														<div class="info">
															<strong class="amount">12</strong>
															<span class="text-primary">(Enrolled)</span>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="Student.aspx">(view all)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-secondary">
										<div class="panel-body">
											<div class="widget-summary">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-secondary">
														<i class="fa fa-book"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">Total Courses</h4>
														<div class="info">
															<strong class="amount">7</strong>
														</div>
													</div>
													<div class="summary-footer">
														<a class="text-muted text-uppercase" href="Course.aspx">(view all)</a>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								
							</div>
						</div>

    



    
  
    


</asp:Content>
