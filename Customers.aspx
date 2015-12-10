<%@ Page Title="Customers" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Customers.aspx.vb" Inherits="Customers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your customers page.</h3>
    <p>&nbsp;</p>
    <p>Search Customer</p>
    <p>
        <asp:TextBox ID="textName" runat="server" Height="25px" Width="436px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Submit" Width="104px" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                <asp:BoundField DataField="ShippingAddress" HeaderText="ShippingAddress" SortExpression="ShippingAddress" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Zipcode" HeaderText="Zipcode" SortExpression="Zipcode" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlueBinHardwareConnectionString %>" SelectCommand="SELECT [CustomerName], [ShippingAddress], [City], [State], [Zipcode], [Notes] FROM [Customer] WHERE ([CustomerName] LIKE '%' + @CustomerName + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="textName" Name="CustomerName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    
</asp:Content>
