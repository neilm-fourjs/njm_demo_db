IMPORT os
DEFINE m_dataPath STRING = "../etc"
PUBLIC DEFINE m_stat STRING
--------------------------------------------------------------------------------
FUNCTION mkdb_progress(l_mess STRING)
  LET l_mess = CURRENT, ":", NVL(l_mess, "NULL!")
  LET m_stat = m_stat.append(l_mess || "\n")
  DISPLAY l_mess
  DISPLAY BY NAME m_stat
  CALL ui.Interface.refresh()
END FUNCTION
--------------------------------------------------------------------------------
FUNCTION mkdb_chkFile(l_file STRING) RETURNS STRING
	LET l_file = os.path.join(m_dataPath, l_file)
	IF NOT os.path.exists(l_file) THEN
		CALL fgl_winMessage("Error",SFMT("Data file %1 not found!",l_file),"exclamation")
		EXIT PROGRAM
	END IF
	DISPLAY SFMT("Loading from file %1",l_file )
	RETURN l_file
END FUNCTION