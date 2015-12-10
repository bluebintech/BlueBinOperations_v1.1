
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration


Partial Class GembaAuditNodeFormEdit
    Inherits Page

    Dim AdditionalComments As String
    Dim PS_EmptyBins As Integer = 0
    Dim PS_BackBins As Integer = 0
    Dim PS_StockOuts As Integer = 0
    Dim PS_ReturnVolume As Integer = 0
    Dim PS_NonBBT As Integer = 0
    Dim PS_OrangeCones As Integer = 0
    Dim PS_Comments As String
    Dim RS_BinsFilled As Integer = 0
    Dim RS_EmptiesCollected As Integer = 0
    Dim RS_BinServices As Integer = 0
    Dim RS_NodeSwept As Integer = 0
    Dim RS_NodeCorrections As Integer = 0
    Dim RS_ShadowedUser As String
    Dim RS_Comments As String
    Dim SS_Supplied As Integer = 0
    Dim SS_KanbansPP As Integer = 0
    Dim SS_StockoutsPT As Integer = 0
    Dim SS_StockoutsMatch As Integer = 0
    Dim SS_HuddleBoardMatch As Integer = 0
    Dim SS_Comments As String
    Dim NIS_Labels As Integer = 0
    Dim NIS_CardHolders As Integer = 0
    Dim NIS_BinsRacks As Integer = 0
    Dim NIS_GeneralAppearance As Integer = 0
    Dim NIS_Signage As Integer = 0
    Dim NIS_Comments As String
    Dim PS_TotalScore As Integer = 0
    Dim RS_TotalScore As Integer = 0
    Dim SS_TotalScore As Integer = 0
    Dim NIS_TotalScore As Integer = 0
    Dim TotalScore As Integer = 0


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        Dim GembaAuditNodeID As String = Request.QueryString("GembaAuditNodeID")
        If Not Page.IsPostBack() Then
            'Comment
            'Comment
            Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
            con.Open()
            Dim da As New SqlDataAdapter("exec sp_SelectGembaAuditNodeEdit " + GembaAuditNodeID, con)
            Dim dt As New DataTable

            da.Fill(dt)

            GembaAuditNodeIDTB.Text = dt.Rows(0)("GembaAuditNodeID").ToString()
            CurrentTimeTB.Text = dt.Rows(0)("Date").ToString()
            LastUpdatedTB.Text = dt.Rows(0)("LastUpdated").ToString()
            LocationDD.SelectedValue = dt.Rows(0)("LocationID").ToString()
            AuditerTB.Text = dt.Rows(0)("Auditer").ToString()
            AdditionalCommentsTB.Text = dt.Rows(0)("AdditionalComments").ToString()

            PSCommentsTB.Text = dt.Rows(0)("PS_Comments").ToString()
            ShadowedUserDD.SelectedValue = dt.Rows(0)("RS_ShadowedUser").ToString()
            RSCommentsTB.Text = dt.Rows(0)("RS_Comments").ToString()
            SS_CommentsTB.Text = dt.Rows(0)("SS_Comments").ToString()
            NISCommentsTB.Text = dt.Rows(0)("NIS_Comments").ToString()
            PullStandardTB.Text = dt.Rows(0)("PS_TotalScore").ToString()
            ReplenishmentTB.Text = dt.Rows(0)("RS_TotalScore").ToString()
            StageTB.Text = dt.Rows(0)("SS_TotalScore").ToString()
            NodeIntegrityTB.Text = dt.Rows(0)("NIS_TotalScore").ToString()
            TotalScoreTB.Text = dt.Rows(0)("TotalScore").ToString()

            'Pull Standards
            PS_EmptyBinsRL.SelectedValue = dt.Rows(0)("PS_EmptyBins").ToString()
            PS_BackBinsRL.SelectedValue = dt.Rows(0)("PS_BackBins").ToString()
            PS_StockOutsRL.SelectedValue = dt.Rows(0)("PS_StockOuts").ToString()
            PS_ReturnVolumeRL.SelectedValue = dt.Rows(0)("PS_ReturnVolume").ToString()
            PS_NonBBTRL.SelectedValue = dt.Rows(0)("PS_NonBBT").ToString()
            PS_OrangeConesDD.SelectedValue = dt.Rows(0)("PS_OrangeCones").ToString()


            'Replenishment
            RS_BinsFilledRL.SelectedValue = dt.Rows(0)("RS_BinsFilled").ToString()
            RS_EmptiesCollectedRL.SelectedValue = dt.Rows(0)("RS_EmptiesCollected").ToString()
            RS_BinServicesRL.SelectedValue = dt.Rows(0)("RS_BinServices").ToString()
            RS_NodeSweptRL.SelectedValue = dt.Rows(0)("RS_NodeSwept").ToString()
            RS_NodeCorrectionsRL.SelectedValue = dt.Rows(0)("RS_NodeCorrections").ToString()

            'Stage
            SS_SuppliedRL.SelectedValue = dt.Rows(0)("SS_Supplied").ToString()
            SS_KanbansPPRL.SelectedValue = dt.Rows(0)("SS_KanbansPP").ToString()
            SS_StockoutsPTRL.SelectedValue = dt.Rows(0)("SS_StockoutsPT").ToString()
            SS_StockoutsMatchRL.SelectedValue = dt.Rows(0)("SS_StockoutsMatch").ToString()
            SS_HuddleBoardMatchRL.SelectedValue = dt.Rows(0)("SS_HuddleBoardMatch").ToString()

            'NodeIntegrity
            NIS_LabelsRL.SelectedValue = dt.Rows(0)("NIS_Labels").ToString()
            NIS_CardHoldersRL.SelectedValue = dt.Rows(0)("NIS_CardHolders").ToString()
            NIS_BinsRacksRL.SelectedValue = dt.Rows(0)("NIS_BinsRacks").ToString()
            NIS_GeneralAppearanceRL.SelectedValue = dt.Rows(0)("NIS_GeneralAppearance").ToString()
            NIS_SignageRL.SelectedValue = dt.Rows(0)("NIS_Signage").ToString()



            con.Close()
        End If
    End Sub




    Public Sub GembaAuditNodeFormSubmit_Click(sender As Object, e As EventArgs) Handles GembaAuditNodeFormSubmit.Click
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)

        con.Open()

        Dim GembaAuditNodeID As String = GembaAuditNodeIDTB.Text
        Dim Location As String
        Dim Auditer As String
        Dim AdditionalComments As String


        'Pull Standards
        PS_EmptyBins = PS_EmptyBinsRL.SelectedValue
        PS_BackBins = PS_BackBinsRL.SelectedValue
        PS_StockOuts = PS_StockOutsRL.SelectedValue
        PS_ReturnVolume = PS_ReturnVolumeRL.SelectedValue
        PS_NonBBT = PS_NonBBTRL.SelectedValue


        'Replenishment
        RS_BinsFilled = RS_BinsFilledRL.SelectedValue
        RS_EmptiesCollected = RS_EmptiesCollectedRL.SelectedValue
        RS_BinServices = RS_BinServicesRL.SelectedValue
        RS_NodeSwept = RS_NodeSweptRL.SelectedValue
        RS_NodeCorrections = RS_NodeCorrectionsRL.SelectedValue

        'Stage
        SS_Supplied = SS_SuppliedRL.SelectedValue
        SS_KanbansPP = SS_KanbansPPRL.SelectedValue
        SS_StockoutsPT = SS_StockoutsPTRL.SelectedValue
        SS_StockoutsMatch = SS_StockoutsMatchRL.SelectedValue
        SS_HuddleBoardMatch = SS_HuddleBoardMatchRL.SelectedValue

        'NodeIntegrity
        NIS_Labels = NIS_LabelsRL.SelectedValue
        NIS_CardHolders = NIS_CardHoldersRL.SelectedValue
        NIS_BinsRacks = NIS_BinsRacksRL.SelectedValue
        NIS_GeneralAppearance = NIS_GeneralAppearanceRL.SelectedValue
        NIS_Signage = NIS_SignageRL.SelectedValue


        GembaAuditNodeID = GembaAuditNodeIDTB.Text
        Location = LocationDD.SelectedItem.Value
        Auditer = AuditerTB.Text
        AdditionalComments = AdditionalCommentsTB.Text
        PS_Comments = PSCommentsTB.Text
        RS_Comments = RSCommentsTB.Text
        RS_ShadowedUser = ShadowedUserDD.SelectedItem.Value
        SS_Comments = SS_CommentsTB.Text
        NIS_Comments = NISCommentsTB.Text
        PS_TotalScore = PS_EmptyBins + PS_BackBins + PS_StockOuts + PS_ReturnVolume + PS_NonBBT
        RS_TotalScore = RS_BinsFilled + RS_EmptiesCollected + RS_BinServices + RS_NodeSwept + RS_NodeCorrections
        SS_TotalScore = SS_Supplied + SS_KanbansPP + SS_StockoutsPT + SS_StockoutsMatch + SS_HuddleBoardMatch
        NIS_TotalScore = NIS_Labels + NIS_CardHolders + NIS_BinsRacks + NIS_GeneralAppearance + NIS_Signage
        TotalScore = PS_TotalScore + RS_TotalScore + SS_TotalScore + NIS_TotalScore
        TotalScore = TotalScore.ToString
        PS_TotalScore = PS_TotalScore.ToString
        RS_TotalScore = RS_TotalScore.ToString
        SS_TotalScore = SS_TotalScore.ToString
        NIS_TotalScore = NIS_TotalScore.ToString

        Dim UpdateString As String = "exec sp_EditGembaAuditNode 
           '" & GembaAuditNodeID & "'
           ,'" & Location & "'
           ,'" & AdditionalComments & "'
           ,'" & PS_EmptyBins & "'
           ,'" & PS_BackBins & "'
           ,'" & PS_StockOuts & "'
           ,'" & PS_ReturnVolume & "'
           ,'" & PS_NonBBT & "'
           ,'" & PS_OrangeCones & "'
           ,'" & PS_Comments & "'
           ,'" & RS_BinsFilled & "'
           ,'" & RS_EmptiesCollected & "'
           ,'" & RS_BinServices & "'
           ,'" & RS_NodeSwept & "'
           ,'" & RS_NodeCorrections & "'
           ,'" & RS_ShadowedUser & "'
           ,'" & RS_Comments & "'
           ,'" & SS_Supplied & "'
           ,'" & SS_KanbansPP & "'
           ,'" & SS_StockoutsPT & "'
           ,'" & SS_StockoutsMatch & "'
           ,'" & SS_HuddleBoardMatch & "'
           ,'" & SS_Comments & "'
           ,'" & NIS_Labels & "'
           ,'" & NIS_CardHolders & "'
           ,'" & NIS_BinsRacks & "'
           ,'" & NIS_GeneralAppearance & "'
           ,'" & NIS_Signage & "'
           ,'" & NIS_Comments & "'
           ,'" & PS_TotalScore & "'
           ,'" & RS_TotalScore & "'
           ,'" & SS_TotalScore & "'
           ,'" & NIS_TotalScore & "'
           ,'" & TotalScore & "'
  
exec sp_InsertMasterLog '" & Auditer & "','Gemba','Update Gemba Node Audit','" & GembaAuditNodeID & "'         
"

        Dim Updatecmd As New SqlCommand(UpdateString, con)
        Trace.Write(UpdateString)
        Updatecmd.ExecuteNonQuery()

        'MsgBox("New Gemba Saved for with score = " & TotalScore & "")
        Response.Redirect("~/Gemba")

        PullStandardTB.Text = PS_TotalScore
        ReplenishmentTB.Text = RS_TotalScore
        StageTB.Text = SS_TotalScore
        NodeIntegrityTB.Text = NIS_TotalScore
        TotalScoreTB.Text = TotalScore
    End Sub

    Protected Sub GembaAuditNodeFormCancel_Click(sender As Object, e As EventArgs) Handles GembaAuditNodeFormCancel.Click
        Response.Redirect("~/Gemba")
    End Sub

    Protected Sub GembaAuditNodeFormSubmit_Calculate(sender As Object, e As EventArgs) Handles GembaAuditNodeFormCalculate.Click

        'Pull Standards
        PS_EmptyBins = PS_EmptyBinsRL.SelectedValue
        PS_BackBins = PS_BackBinsRL.SelectedValue
        PS_StockOuts = PS_StockOutsRL.SelectedValue
        PS_ReturnVolume = PS_ReturnVolumeRL.SelectedValue
        PS_NonBBT = PS_NonBBTRL.SelectedValue


        'Replenishment
        RS_BinsFilled = RS_BinsFilledRL.SelectedValue
        RS_EmptiesCollected = RS_EmptiesCollectedRL.SelectedValue
        RS_BinServices = RS_BinServicesRL.SelectedValue
        RS_NodeSwept = RS_NodeSweptRL.SelectedValue
        RS_NodeCorrections = RS_NodeCorrectionsRL.SelectedValue

        'Stage
        SS_Supplied = SS_SuppliedRL.SelectedValue
        SS_KanbansPP = SS_KanbansPPRL.SelectedValue
        SS_StockoutsPT = SS_StockoutsPTRL.SelectedValue
        SS_StockoutsMatch = SS_StockoutsMatchRL.SelectedValue
        SS_HuddleBoardMatch = SS_HuddleBoardMatchRL.SelectedValue

        'NodeIntegrity
        NIS_Labels = NIS_LabelsRL.SelectedValue
        NIS_CardHolders = NIS_CardHoldersRL.SelectedValue
        NIS_BinsRacks = NIS_BinsRacksRL.SelectedValue
        NIS_GeneralAppearance = NIS_GeneralAppearanceRL.SelectedValue
        NIS_Signage = NIS_SignageRL.SelectedValue


        PS_TotalScore = PS_EmptyBins + PS_BackBins + PS_StockOuts + PS_ReturnVolume + PS_NonBBT
        RS_TotalScore = RS_BinsFilled + RS_EmptiesCollected + RS_BinServices + RS_NodeSwept + RS_NodeCorrections
        SS_TotalScore = SS_Supplied + SS_KanbansPP + SS_StockoutsPT + SS_StockoutsMatch + SS_HuddleBoardMatch
        NIS_TotalScore = NIS_Labels + NIS_CardHolders + NIS_BinsRacks + NIS_GeneralAppearance + NIS_Signage
        TotalScore = PS_TotalScore + RS_TotalScore + SS_TotalScore + NIS_TotalScore
        TotalScore = TotalScore.ToString
        PS_TotalScore = PS_TotalScore.ToString
        RS_TotalScore = RS_TotalScore.ToString
        SS_TotalScore = SS_TotalScore.ToString
        NIS_TotalScore = NIS_TotalScore.ToString

        PullStandardTB.Text = PS_TotalScore
        ReplenishmentTB.Text = RS_TotalScore
        StageTB.Text = SS_TotalScore
        NodeIntegrityTB.Text = NIS_TotalScore
        TotalScoreTB.Text = TotalScore
    End Sub
End Class