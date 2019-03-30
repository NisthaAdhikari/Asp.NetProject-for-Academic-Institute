<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="AcademicInstitute.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" >
<ControlStyle CssClass="btn btn-primary"></ControlStyle>
                    </asp:CommandField>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="FIRST_NAME" HeaderText="FIRST_NAME" SortExpression="FIRST_NAME" />
                    <asp:BoundField DataField="LAST_NAME" HeaderText="LAST_NAME" SortExpression="LAST_NAME" />
                    <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                    <asp:TemplateField HeaderText="Address_name">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" Enabled="false" runat="server" DataSourceID="SqlDataSource2" DataTextField="ADDRESS" DataValueField="ADDRESS_ID" SelectedValue='<%# Bind("ADDRESS_ID") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>



            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STUDENT.STUDENT_ID, STUDENT.FIRST_NAME, STUDENT.LAST_NAME, ADDRESS.ADDRESS_ID, ADDRESS.ADDRESS FROM STUDENT, STUDENT_ADDRESS, ADDRESS WHERE STUDENT.STUDENT_ID = STUDENT_ADDRESS.STUDENT_ID AND STUDENT_ADDRESS.ADDRESS_ID = ADDRESS.ADDRESS_ID" >
                <DeleteParameters>
                    <asp:Parameter Name="Student_Id" />
                </DeleteParameters>
            </asp:SqlDataSource>



            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;ADDRESS&quot; FROM &quot;ADDRESS&quot;"></asp:SqlDataSource>



        </div>
    </form>
</body>
</html>
