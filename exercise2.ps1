#region 1. Create a new PSDrive called WIN that maps to C:\Windows/

    #region answers
        New-PSDrive -Name Win -PSProvider FileSystem -Root c:\Windows
    #endregion

#endregion

#region 2. Change location to the new PSDrive. Create an array of FILES in the directory. Don't recurse. How many items are in the array?

    #region answers
        $a = dir -file
        $a.count
    #endregion

#endregion

#region 3. Change location to C:\. Remove the PSDrive you created.

    #region answers
        cd c:\
        Remove-PSDrive -name win
    #endregion

#endregion
