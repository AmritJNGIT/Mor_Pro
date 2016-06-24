using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Telerik.Web.UI;
using System.Data.Entity;
using System.Web.UI.HtmlControls;
using System.ComponentModel;



public partial class JobReport : System.Web.UI.Page
{
    #region Create Database Object
    MOR_ProEntities1 db = new MOR_ProEntities1();
    #endregion

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkButton btnAddMore = new LinkButton();
        if (!IsPostBack)
        {
            BindOperator();
            BindDepartment();

        }

    }
    #endregion

    #region Bind Operator Dropdown
    public void BindOperator()
    {
        var Operator = (from Op in db.Operators where Op.status == true && Op.isDeleted == false select new { Id = Op.operatorId, Name = Op.firstName + " " + Op.lastName }).ToList();
        RadddlPressOperator.DataSource = Operator;
        RadddlPressOperator.DataTextField = "Name";
        RadddlPressOperator.DataValueField = "Id";
        RadddlPressOperator.DataBind();
    }
    #endregion

    #region Bind Department Dropdown
    public void BindDepartment()
    {
        var Department = (from DP in db.Departments where DP.status == true && DP.isDeleted == false select new { departmentId = DP.departmentId, departmentName = DP.departmentName }).ToList();
        RadddlDepartment.DataSource = Department;
        RadddlDepartment.DataTextField = "departmentName";
        RadddlDepartment.DataValueField = "departmentId";
        RadddlDepartment.DataBind();
    }
    #endregion

    #region Bind Machine Dropdown
    protected void RadddlDepartment_SelectedIndexChanged(object sender, DropDownListEventArgs e)
    {
        int DepartmentID = Convert.ToInt32(RadddlDepartment.SelectedValue.ToString());

        var machines = (from M in db.Machines join Dept in db.Departments on M.FK_departmentId equals Dept.departmentId where M.FK_departmentId == DepartmentID && M.status == true && M.isDeleted == false select new { MachineID = M.machineId, MachineName = M.machineName }).ToList();
        RadddlMachine.DataSource = machines;
        RadddlMachine.DataValueField = "MachineID";
        RadddlMachine.DataTextField = "MachineName";
        RadddlMachine.DataBind();

    }
    #endregion

    #region Job And Form Save Method
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            var Jobcheck = db.Jobs.Where(ex => ex.jobId == RadtxtJob.Text).FirstOrDefault();
            if (Jobcheck != null)
            {
                RadNotification1.Title = "Warning!";
                RadNotification1.Show(RadtxtJob.Text + " " + "Already Exist!");
            }
            else
            {
                Job tblJob = new Job();
                if (!string.IsNullOrEmpty(RadtxtJob.Text))
                {
                    tblJob.jobId = RadtxtJob.Text;
                }
                if (!string.IsNullOrEmpty(RadtxtRunSpeed.Text))
                {
                    tblJob.runSpeed = Convert.ToInt32(RadtxtRunSpeed.Text);
                }
                tblJob.FK_departmentId = Convert.ToInt32(RadddlDepartment.SelectedValue);
                if (!string.IsNullOrEmpty(Convert.ToDateTime(RadtxtRunDate.SelectedDate).ToString()))
                {
                    tblJob.runDate = RadtxtRunDate.SelectedDate;
                }
                tblJob.FK_machineId = Convert.ToInt32(RadddlMachine.SelectedValue);
                tblJob.startTime = calStartTime.SelectedDate;
                tblJob.FK_operatorId = Convert.ToInt32(RadddlPressOperator.SelectedValue);
                if (!string.IsNullOrEmpty(Convert.ToDateTime(CalEndtime.SelectedDate).ToString()))
                {
                    tblJob.endTime = CalEndtime.SelectedDate;
                }
                if (!string.IsNullOrEmpty(RadtxtNoProblem.Text))
                {
                    tblJob.noProblem = RadtxtNoProblem.Text;
                }
                if (!string.IsNullOrEmpty(RadtxtProblemWithPlates.Text))
                {
                    tblJob.problemWithPlates = RadtxtProblemWithPlates.Text;
                }
                if (!string.IsNullOrEmpty(RadtxtProblemWithPaper.Text))
                {
                    tblJob.problemWithPaper = RadtxtProblemWithPaper.Text;
                }
                if (!string.IsNullOrEmpty(RadtxtProblemWithInk.Text))
                {
                    tblJob.problemWithInk = RadtxtProblemWithInk.Text;
                }
                if (!string.IsNullOrEmpty(RadtxtProblemWithPress.Text))
                {
                    tblJob.problemWithPress = RadtxtProblemWithPress.Text;
                }
                if (!string.IsNullOrEmpty(RadtxtMaintenancePerformed.Text))
                {
                    tblJob.maintenancePerformed = RadtxtMaintenancePerformed.Text;
                }
                tblJob.createdOn = DateTime.Now;
                db.Jobs.Add(tblJob);
                db.SaveChanges();
                int JobID = tblJob.Id;

                int HfFormsId = Convert.ToInt32(HfForms.Value);
                for (var i = 1; i <= HfFormsId; i++)
                {
                    string RadtxtFront = ((sender as RadButton).Parent.FindControl("RadtxtFront" + i.ToString()) as RadTextBox).Text;
                    string RadtxtBack = ((sender as RadButton).Parent.FindControl("RadtxtBack" + i.ToString()) as RadTextBox).Text;
                    if (!string.IsNullOrEmpty(RadtxtFront) && !string.IsNullOrEmpty(RadtxtBack))
                    {
                        Form tblformsFrontBack = new Form();
                        tblformsFrontBack.FK_JobId = JobID;
                        tblformsFrontBack.formName = "Form" + "" + i;
                        tblformsFrontBack.front = Convert.ToInt32(RadtxtFront);
                        tblformsFrontBack.back = Convert.ToInt32(RadtxtBack);
                        tblformsFrontBack.createdOn = DateTime.Now;
                        db.Forms.Add(tblformsFrontBack);
                        db.SaveChanges();
                    }
                }
                RadWindowManager1.RadAlert("Record Inserted Successfully.", 300, 140, "Success", "");
                Clear();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
    #endregion

    #region Clear All TextBox
    public void Clear()
    {
        RadtxtJob.Text = "";
        RadtxtRunSpeed.Text = "";
        RadddlDepartment.ClearSelection();
        RadddlPressOperator.ClearSelection();
        RadtxtRunDate.Clear();
        RadddlMachine.ClearSelection();
        calStartTime.Clear();
        CalEndtime.Clear();
        RadtxtNoProblem.Text = "";
        RadtxtProblemWithPlates.Text = "";
        RadtxtProblemWithPaper.Text = "";
        RadtxtProblemWithInk.Text = "";
        RadtxtProblemWithPress.Text = "";
        RadtxtMaintenancePerformed.Text = "";
        RadtxtFront1.Text = "";
        RadtxtBack1.Text = "";
        RadtxtFront2.Text = "";
        RadtxtBack2.Text = "";
        RadtxtFront3.Text = "";
        RadtxtBack3.Text = "";
        RadtxtFront4.Text = "";
        RadtxtBack4.Text = "";
        RadtxtFront5.Text = "";
        RadtxtBack5.Text = "";
        RadtxtFront6.Text = "";
        RadtxtBack6.Text = "";
        RadtxtFront7.Text = "";
        RadtxtBack7.Text = "";
        RadtxtFront8.Text = "";
        RadtxtBack8.Text = "";
        RadtxtFront9.Text = "";
        RadtxtBack9.Text = "";
        RadtxtFront10.Text = "";
        RadtxtBack10.Text = "";
        RadChkProblemWithPress.Checked = false;
        RadChkProblemWithPaper.Checked = false;
        RadChkProblemWithInk.Checked = false;
        RadChkMaintenancePerformed.Checked = false;
        RadChkNoProblem.Checked = false;
        RadChkProblemWithPlates.Checked = false;
        HfForms.Value = "1";

    }
    #endregion

   

    protected void RadChkNoProblem_Click(object sender, EventArgs e)
    {
        if(RadChkNoProblem.Checked==false)
        {
           RadtxtNoProblem.ReadOnly=true;
        }
        else
        {
            RadtxtNoProblem.ReadOnly = false;
        }
    }

    protected void RadChkProblemWithPlates_Click(object sender, EventArgs e)
    {
        if(RadChkProblemWithPlates.Checked == false)
        {
            RadtxtProblemWithPlates.ReadOnly = true;
        }
        else
        {
            RadtxtProblemWithPlates.ReadOnly = false;
        }
    }

    protected void RadChkProblemWithPaper_Click(object sender, EventArgs e)
    {
        if(RadChkProblemWithPaper.Checked==false)
        {
            RadtxtProblemWithPaper.ReadOnly = true;
        }
        else
        {
            RadtxtProblemWithPaper.ReadOnly = false;
        }
    }

    protected void RadChkProblemWithInk_Click(object sender, EventArgs e)
    {
        if(RadChkProblemWithInk.Checked ==false)
        {
            RadtxtProblemWithInk.ReadOnly = true;
        }
        else
        {
            RadtxtProblemWithInk.ReadOnly = false;
        }
    }

    protected void RadChkProblemWithPress_Click(object sender, EventArgs e)
    {
        if(RadChkProblemWithPress.Checked ==false)
        {
            RadtxtProblemWithPress.ReadOnly = true;
        }
        else
        {
            RadtxtProblemWithPress.ReadOnly = false;
        }
    }

    protected void RadChkMaintenancePerformed_Click(object sender, EventArgs e)
    {
        if(RadChkMaintenancePerformed.Checked ==false)
        {
            RadtxtMaintenancePerformed.ReadOnly = true;
        }
        else
        {
            RadtxtMaintenancePerformed.ReadOnly = false;
        }
    }
}