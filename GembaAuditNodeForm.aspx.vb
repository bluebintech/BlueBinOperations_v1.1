
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration


Partial Class GembaAuditNodeForm
    Inherits Page

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CurrentTimeTB.Text = DateTime.Now.ToString("MM/dd/yyyy")
        AuditerTB.Text = Page.User.Identity.Name.ToString()

        'UserLogin2 As System.Security.Principal.IPrincipal = System.Web.HttpContext.Current.User
    End Sub


    Public Sub GembaAuditNodeFormSubmit_Click(sender As Object, e As EventArgs) Handles GembaAuditNodeFormSubmit.Click
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Site_ConnectionString").ConnectionString)
        Dim cmd As New SqlCommand

        cmd.Connection = con
        con.Open()

        Dim Location As String
        Dim Auditer As String
        Dim AdditionalComments As String


        'Pull Standards
        PS_EmptyBins = PS_EmptyBinsRL.SelectedValue
        PS_BackBins = PS_BackBinsRL.SelectedValue
        PS_StockOuts = PS_StockOutsRL.SelectedValue
        PS_ReturnVolume = PS_ReturnVolumeRL.SelectedValue
        PS_NonBBT = PS_NonBBTRL.SelectedValue
        PS_OrangeCones = PS_OrangeConesDD.SelectedValue


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



        Location = LocationDD.SelectedItem.Value
        Auditer = AuditerTB.Text
        AdditionalComments = AdditionalCommentsTB.Text
        PS_Comments = PSCommentsTB.Text
        RS_Comments = RSCommentsTB.Text
        SS_Comments = SS_CommentsTB.Text
        RS_ShadowedUser = ShadowedUserDD.SelectedItem.Value
        NIS_Comments = NISCommentsTB.Text
        cmd.CommandType = System.Data.CommandType.Text
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
        cmd.CommandText = "

                    exec sp_InsertGembaAuditNode
                    '" & Location & "',
                    '" & Auditer & "',
                    '" & AdditionalComments & "',
                    '" & PS_EmptyBins & "',
                    '" & PS_BackBins & "',
                    '" & PS_StockOuts & "',
                    '" & PS_ReturnVolume & "',
                    '" & PS_NonBBT & "',
                    '" & PS_OrangeCones & "',
                    '" & PS_Comments & "',
                    '" & RS_BinsFilled & "',
                    '" & RS_EmptiesCollected & "',
                    '" & RS_BinServices & "',
                    '" & RS_NodeSwept & "',
                    '" & RS_NodeCorrections & "',
                    '" & RS_ShadowedUser & "',
                    '" & RS_Comments & "',
                    '" & SS_Supplied & "',
                    '" & SS_KanbansPP & "',
                    '" & SS_StockoutsPT & "',
                    '" & SS_StockoutsMatch & "',
                    '" & SS_HuddleBoardMatch & "',
                    '" & SS_Comments & "',
                    '" & NIS_Labels & "',
                    '" & NIS_CardHolders & "',
                    '" & NIS_BinsRacks & "',
                    '" & NIS_GeneralAppearance & "',
                    '" & NIS_Signage & "',
                    '" & NIS_Comments & "',
                    '" & PS_TotalScore & "',
                    '" & RS_TotalScore & "',
                    '" & SS_TotalScore & "',
                    '" & NIS_TotalScore & "',
                    '" & TotalScore & "'

exec sp_InsertMasterLog '" & Auditer & "','Gemba','New Gemba Node Audit',''
"

        cmd.ExecuteNonQuery()


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