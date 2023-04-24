
#region 1. Find powershell commands you can use to manage file shares.

    #region answers
    Get-Command *share*
    Get-Command -noun fileshare
    #endregion

#endregion

#region 2. How many different ways can you get a list of file shares?

    #region answers
    Help Get-FileShare
    Get-Command Get-FileShare -syntax
    #endregion

#endregion

#region 3. How many properties does an integer have?

    #region answers
    1 | Get-Member
    1 | Get-Member -MemberType Properties
    #endregion

#endregion

#region 4. What type of object do you get from Get-Date?

    #region answers
    Get-Date | Get-Member
    #endregion

#endregion