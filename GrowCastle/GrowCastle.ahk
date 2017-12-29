#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#MaxThreadsPerHotkey 2
#Include %A_ScriptDir%\FindClick-master\FindClick.ahk
SetWorkingDir %A_ScriptDir%\Images

bSuspended = 1

 

;~~~~~~~~~~~~~~~~~~~~~
;Global Variables
;~~~~~~~~~~~~~~~~~~~~~
BreakLoop = 0
leftColumn := 450
midColumn := 570
rightColumn := 680
topRow := 145
topMidRow := 295
botMidRow := 425
botRow := 560
mp_color := PixelGetColor(1600, 40)
hp_color := PixelGetColor(1100, 40)

End::ExitApp
F12::Reload

#IfWinActive, Nox

CoordMode, Mouse, Client

Pause::

F5::FindClick()

F7::
{
	BattleLoop()
	return
}

F8:: 
{
	DragonBattleLoop()
	return
}

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Spammable Hotkeys~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

t::MatItems()
r::ClickDeck2Heroes()


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Battle Loop~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

BattleLoop()
{
	global BreakLoop
	
	Loop
	{
		;Exit loop if active window is no longer Nox
		while !NoxActive()
		{
			Sleep, 100
		}
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Check for ad and watch~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,  *40 ad.png
		if ErrorLevel = 0
		{
			FoundX += 120
			FoundY += 30
			Loop, 10
			{
				
				FoundX += 5
				FoundY += 2
				MouseClick(FoundX, FoundY)
				
				Sleep, 10
			}
			Sleep, 1000
			ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,  *40 x.png
			if ErrorLevel = 0
			{
				FoundX += 5
				FoundY += 5
				MouseClick(FoundX, FoundY)
			}
			else if ErrorLevel = 1
			{
				Sleep, 60000
				MouseClick(1888, 16)
				
				Sleep, 3000
			}
		}
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Click 'x' if one is found~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 x.png
		if ErrorLevel = 0
		{
			Sleep, 1000
			ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 ad.png
			if ErrorLevel = 0
			{
				FoundX += 120
				FoundY += 30
				Loop, 10
				{
					FoundX += 5
					FoundY += 2
					MouseClick(FoundX, FoundY)
					
					Sleep, 10
				}
				Sleep, 1000
				ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 x.png
				if ErrorLevel = 0
				{
					FoundX += 5
					FoundY += 5
					MouseClick(FoundX, FoundY)
				}
				if ErrorLevel = 1
				{
					Sleep, 60000
					
					MouseClick(1888, 16)
					
					Sleep, 3000
				}

			}
			else if ErrorLevel = 1
			{	
				count := 0
				while count < 10
				{
					ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 x.png
					if ErrorLevel = 0
					{
						FoundX += 5
						FoundY += 5
						MouseClick(FoundX, FoundY)
						count++
						Sleep 2000
					}
					else if ErrorLevel = 1
					{
						count = 10
					}
				}
			}
		}
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Check max gems and spend~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 max_gems.png
		if ErrorLevel = 0
		{
			MouseClick(570, 690)
			Sleep, 2000
			MouseClick(570, 425)
			Sleep, 2000
			ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 minigun_castle.png
			if ErrorLevel = 0
			{
				MouseClick(1500, 230)
				Sleep, 2000
				count := 0
				while count < 10
				{
					MouseClick(1325, 720)
					count++
					Sleep, 5
				}
				Sleep, 1000
				Loop, 5
				{
					MouseClick(1325, 950)
					Sleep, 5
				}
			}
			Sleep, 1000
		}
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Check for battle button and click~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 battle.png
		if ErrorLevel = 0
		{
			Sleep, 1000
			ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 ad.png
			if ErrorLevel = 0
			{
				FoundX += 120
				FoundY += 30
				Loop, 10
				{
					
					FoundX += 5
					FoundY += 2
					MouseClick(FoundX, FoundY)
					
					Sleep, 10
				}
				Sleep, 1000
				ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 x.png
				if ErrorLevel = 0
				{
					FoundX += 5
					FoundY += 5
					MouseClick(FoundX, FoundY)
				}
				if ErrorLevel = 1
				{
					Sleep, 60000
					
					MouseClick(1888, 16)
					
					Sleep, 3000
				}
			}
			else if ErrorLevel = 1
			{	
				ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 battle.png
				if ErrorLevel = 0
				{
					
					FoundX += 5
					FoundY += 5
					MouseClick(FoundX, FoundY)
					
					Sleep, 5000
				}
			}
		}
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Check for chest and click~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 chest.png
		if ErrorLevel = 0
		{
			
			MouseClick(FoundX, FoundY)
			
			Sleep, 10
			
		}
		
		
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Captcha attempt (spam same answer lul)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Check for wave skip purchase and pause~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		while !NoxActive()
		{
			Sleep, 100
		}
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,  wave_skip.png
		if ErrorLevel = 0
		{
			Sleep, 3500
		}
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Click Heroes~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		ClickDeck1Heroes()
		Sleep, 2000
		
		if (BreakLoop)
		{
			break
		}
	}
	return
}



DragonBattleLoop()
{
	global BreakLoop

	Loop
	{
		;Exit loop if active window is no longer Nox
		while !NoxActive()
		{
			Sleep, 100
		}
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Click 'x' if one is found~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

		count := 0
		while count < 10
		{
			ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,  *40 x.png
			if ErrorLevel = 0
			{
				
				FoundX += 5
				FoundY += 5
				MouseClick(FoundX, FoundY)
				
				count++
				Sleep 2000
			}
			else if ErrorLevel = 1
			{
				count = 10
			}
		}
		
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Bag Loot~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,  *40 dragon_loot.png
		if ErrorLevel = 0
		{
			
			FoundX += 5
			FoundY += 5
			MouseClick(FoundX, FoundY)
			
			Sleep, 1000
		}
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Check for dragon and click~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 dragon.png
		if ErrorLevel = 0
		{
			
			FoundX += 5
			FoundY += 5
			MouseClick(FoundX, FoundY)
			
			Sleep, 500
			MouseClick(1720, 600)
			Sleep, 100
			MouseClick(1720, 600)
			Sleep, 500
		}
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Check for chest and click~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *40 chest.png
		if ErrorLevel = 0
		{
			
			MouseClick(FoundX, FoundY)
			
			Sleep, 10
			
		}
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Check max gems and spend~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,  *40 max_gems.png
		if ErrorLevel = 0
		{
			MouseClick(570, 690)
			Sleep, 2000
			MouseClick(570, 425)
			Sleep, 2000
			ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,  *40 minigun_castle.png
			if ErrorLevel = 0
			{
				MouseClick(1500, 230)
				Sleep, 2000
				count := 0
				while count < 10
				{
					MouseClick(1325, 720)
					count++
					Sleep, 5
				}
				Sleep, 1000
				Loop, 5
				{
					MouseClick(1325, 950)
					Sleep, 5
				}
			}
			Sleep, 1000
		}
		
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Click Heroes~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		;Exit loop if active window is no longer Nox
		while !NoxActive()
		{
			Sleep, 100
		}
		ClickDeck1Heroes()
		Sleep, 4000
		if (BreakLoop)
		{
			break
		}
	}
	return
}


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Deck hero positions to click~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ClickDeck1Heroes()
{
	
	global leftColumn
	global midColumn
	global rightColumn
	global topRow
	global topMidRow
	global botMidRow
	global botRow
	
	ClickHero(rightColumn, topMidRow)
	Sleep, 10
	ClickHero(rightColumn, botRow)
	Sleep, 10
	ClickHero(leftColumn, botMidRow)
	Sleep, 10
	ClickHero(rightColumn, botMidRow)
	Sleep, 10
	ClickHero(midColumn, botMidRow)
	Sleep, 10
	ClickHero(leftColumn, botRow)
	Sleep, 10
	ClickHero(midColumn, topMidRow)
	Sleep, 10
	ClickHero(rightColumn, topRow)
	Sleep, 10
	MouseClick(1680, 710)
	Sleep, 10
	ClickHero(midColumn, topRow)
	Sleep, 10
	MouseClick(1880, 710)
	Sleep, 10
	
	return
}

ClickDeck2Heroes()
{
	
	global leftColumn
	global midColumn
	global rightColumn
	global topRow
	global topMidRow
	global botMidRow
	global botRow
	global mp_color
	global hp_color
	
	PixelGetColor, mp_battleColor, 1614, 30
	if (mp_battleColor != mp_color)
	{
		ClickHero(midColumn, topMidRow)
		Sleep, 10
	}
	
	PixelGetColor, hp_battleColor, 1215, 30
	if (hp_battleColor != hp_color)
	{
		ClickHero(midColumn, topMidRow)
		Sleep, 10
	}
	ClickHero(rightColumn, topMidRow)
	Sleep, 10
	ClickHero(rightColumn, topRow)
	Sleep, 10
	ClickHero(rightColumn, botRow)
	Sleep, 10
	ClickHero(leftColumn, topMidRow)
	Sleep, 10
	ClickHero(leftColumn, botMidRow)
	Sleep, 10
	ClickHero(leftColumn, botRow)
	Sleep, 10
	ClickHero(midColumn, botMidRow)
	Sleep, 10
	ClickHero(rightColumn, botRow)
	Sleep, 10
	ClickHero(leftColumn, topRow)
	Sleep, 10
	ClickHero(midColumn, botRow)
	Sleep, 10
	
	return
}


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Mat items~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

MatItems()
{
	global BreakLoop
	
	while !BreakLoop
	{
		MouseClick(1370, 213)
		Sleep, 100
		MouseClick(740, 715)
		Sleep, 100
		MouseClick(740, 715)
		Sleep, 100
	}
	return
}


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~AHK functions expanded~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

PixelGetColor(X, Y) 
{
	PixelGetColor, c, %X%, %Y%
	Return, c
}

MouseClick(X, Y)
{
	MouseGetPos, mousePosX, mousePosY
	MouseClick, left, X, Y, 1, 0
	MouseMove, mousePosX, mousePosY
	Return
}

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Click hero positions~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


ClickHero(column, row)
{
	MouseClick(column, row)
	return
}


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Check if Nox is the active window~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

NoxActive()
{
	wingetactivetitle, var
	return InStr(var, "Nox")
}

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~AHK default~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;$`::Suspend


