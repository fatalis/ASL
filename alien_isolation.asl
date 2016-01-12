state("AI-steam")
{
	int fadeState :      0x15D24B4;          // cPostProcessing->ScreenFadeType
	float fadeNum :      0x15D24B8;
	byte gameFlowState : 0x12f0c88, 0x48, 8;
	//byte trc:            0x134A7D0, 0x1D;
	//int uiState :        0x134A4C8;
	int levelManagerState : 0x12F0C88, 0x3C, 0x4C;
}

init
{
	vars.loading = false;
}

start
{
	vars.loading = false;
}

update
{
	if (old.levelManagerState == 5 && current.levelManagerState == 7)
	//if (old.trc == 0 && current.trc == 1 && current.uiState == 3)
		vars.loading = true;
	else if (current.fadeState == 2 && old.fadeNum < 0.2 && current.fadeNum > 0.2)
		vars.loading = false;	
}

isLoading
{
	return vars.loading || current.gameFlowState == 6;
}
