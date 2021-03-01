#include <a_samp>
#include <sscanf2>
#include <zcmd>
#include <a_mysql>

new Text:TextDraw[MAX_TEXT_DRAWS];
new MySQL:Connection;

public OnGameModeInit()
{
	Connection = mysql_connect("localhost", "root", "password", "mysql");
	TextDraw[0] = TextDrawCreate(279.000000, 414.000000, "CidadeRPG");
	TextDrawFont(TextDraw[0], 0);
	TextDrawLetterSize(TextDraw[0], 0.600000, 2.000000);
	TextDrawTextSize(TextDraw[0], 221.500000, 17.000000);
	TextDrawSetOutline(TextDraw[0], 0);
	TextDrawSetShadow(TextDraw[0], 1);
	TextDrawAlignment(TextDraw[0], 1);
	TextDrawColor(TextDraw[0], -1);
	TextDrawBackgroundColor(TextDraw[0], -1962934017);
	TextDrawBoxColor(TextDraw[0], 50);
	TextDrawUseBox(TextDraw[0], 0);
	TextDrawSetProportional(TextDraw[0], 1);
	TextDrawSetSelectable(TextDraw[0], 0);

	TextDraw[1] = TextDrawCreate(280.000000, 428.000000, "www.cidaderpg.com");
	TextDrawFont(TextDraw[1], 1);
	TextDrawLetterSize(TextDraw[1], 0.283333, 1.399999);
	TextDrawTextSize(TextDraw[1], 221.000000, 27.500000);
	TextDrawSetOutline(TextDraw[1], 0);
	TextDrawSetShadow(TextDraw[1], 1);
	TextDrawAlignment(TextDraw[1], 1);
	TextDrawColor(TextDraw[1], -1);
	TextDrawBackgroundColor(TextDraw[1], 255);
	TextDrawBoxColor(TextDraw[1], 50);
	TextDrawUseBox(TextDraw[1], 0);
	TextDrawSetProportional(TextDraw[1], 1);
	TextDrawSetSelectable(TextDraw[1], 0);

	TextDraw[2] = TextDrawCreate(287.000000, 198.000000, "TextDraw");
	TextDrawFont(TextDraw[2], 2);
	TextDrawLetterSize(TextDraw[2], 0.600000, 2.000000);
	TextDrawTextSize(TextDraw[2], 352.500000, 17.000000);
	TextDrawSetOutline(TextDraw[2], 1);
	TextDrawSetShadow(TextDraw[2], 0);
	TextDrawAlignment(TextDraw[2], 1);
	TextDrawColor(TextDraw[2], -1);
	TextDrawBackgroundColor(TextDraw[2], 255);
	TextDrawBoxColor(TextDraw[2], 50);
	TextDrawUseBox(TextDraw[2], 1);
	TextDrawSetProportional(TextDraw[2], 1);
	TextDrawSetSelectable(TextDraw[2], 0);

	TextDraw[3] = TextDrawCreate(216.000000, 182.000000, "Box");
	TextDrawFont(TextDraw[3], 1);
	TextDrawLetterSize(TextDraw[3], 0.600000, 16.450122);
	TextDrawTextSize(TextDraw[3], 430.500000, 367.500000);
	TextDrawSetOutline(TextDraw[3], 0);
	TextDrawSetShadow(TextDraw[3], 0);
	TextDrawAlignment(TextDraw[3], 1);
	TextDrawColor(TextDraw[3], -256);
	TextDrawBackgroundColor(TextDraw[3], 255);
	TextDrawBoxColor(TextDraw[3], 155);
	TextDrawUseBox(TextDraw[3], 1);
	TextDrawSetProportional(TextDraw[3], 1);
	TextDrawSetSelectable(TextDraw[3], 0);

	TextDraw[4] = TextDrawCreate(234.000000, 297.000000, "Inserir");
	TextDrawFont(TextDraw[4], 0);
	TextDrawLetterSize(TextDraw[4], 0.612500, 2.000000);
	TextDrawTextSize(TextDraw[4], 288.000000, 17.000000);
	TextDrawSetOutline(TextDraw[4], 0);
	TextDrawSetShadow(TextDraw[4], 0);
	TextDrawAlignment(TextDraw[4], 1);
	TextDrawColor(TextDraw[4], 9109759);
	TextDrawBackgroundColor(TextDraw[4], 1433087999);
	TextDrawBoxColor(TextDraw[4], 1433087794);
	TextDrawUseBox(TextDraw[4], 1);
	TextDrawSetProportional(TextDraw[4], 1);
	TextDrawSetSelectable(TextDraw[4], 1);

	TextDraw[5] = TextDrawCreate(346.000000, 297.000000, "Cancelar");
	TextDrawFont(TextDraw[5], 0);
	TextDrawLetterSize(TextDraw[5], 0.612500, 2.000000);
	TextDrawTextSize(TextDraw[5], 416.000000, 17.000000);
	TextDrawSetOutline(TextDraw[5], 0);
	TextDrawSetShadow(TextDraw[5], 0);
	TextDrawAlignment(TextDraw[5], 1);
	TextDrawColor(TextDraw[5], -1962934017);
	TextDrawBackgroundColor(TextDraw[5], -16776961);
	TextDrawBoxColor(TextDraw[5], -16777166);
	TextDrawUseBox(TextDraw[5], 1);
	TextDrawSetProportional(TextDraw[5], 1);
	TextDrawSetSelectable(TextDraw[5], 1);

	DisableInteriorEnterExits();
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	mysql_close(Connection);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	TextDrawShowForPlayer(playerid, TextDraw[0]);
	TextDrawShowForPlayer(playerid, TextDraw[1]);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid) {
	if(clickedid == TextDraw[4]) {
		TextDrawHideForPlayer(playerid, Text:TextDraw[2]);
		TextDrawHideForPlayer(playerid, Text:TextDraw[3]);
		TextDrawHideForPlayer(playerid, Text:TextDraw[4]);
		TextDrawHideForPlayer(playerid, Text:TextDraw[5]);
		SendClientMessage(playerid, -1, "* Você clicou no botão aceitar da TextDraw!");
		CancelSelectTextDraw(playerid);
		new query[512], name[MAX_PLAYER_NAME];
		GetPlayerName(playerid, name, sizeof(name));
		mysql_format(Connection, query, sizeof(query), "INSERT INTO `test` (`Username`, `Id`) VALUES ('%s', '%i')", name, playerid);
		mysql_tquery(Connection, query);
	} else if(clickedid == TextDraw[5]) {
		TextDrawHideForPlayer(playerid, Text:TextDraw[2]);
		TextDrawHideForPlayer(playerid, Text:TextDraw[3]);
		TextDrawHideForPlayer(playerid, Text:TextDraw[4]);
		TextDrawHideForPlayer(playerid, Text:TextDraw[5]);
		SendClientMessage(playerid, -1, "* Você clicou no botão cancelar da TextDraw!");
		CancelSelectTextDraw(playerid);
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		// Do something here
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid) {
		case 1: {
			if(response) {
				new finalResponse[512];
				format(finalResponse, sizeof(finalResponse), "Resposta obtida: %s", inputtext);
				SendClientMessage(playerid, -1, finalResponse);
			} else {
				SendClientMessage(playerid, -1, "* Você fechou a dialog com sucesso.");
			}
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

CMD:broadcast(playerid, params[]) {
	new message[120], response[512], name[MAX_PLAYER_NAME];
	if(sscanf(params, "s[120]", message)) {
		SendClientMessage(playerid, -1, "* Use: /broadcast [mensagem]");
	} else {
		GetPlayerName(playerid, name, sizeof(name));
		format(response, sizeof(response), "[Mensagem Global] %s: %s", name, message);
		SendClientMessageToAll(-1, response);
	}
	return 1;
}

CMD:dialog(playerid, params[]) {
	new list[1024];
	strcat(list, "Emprego\tNível\tSalário\n");
	strcat(list, "Desempregado\t0\t300 $\n");
	strcat(list, "Caminhoneiro\t3\t1500 $\n");
	strcat(list, "Ladrão\t8\t12000 $");
	ShowPlayerDialog(playerid, 1, DIALOG_STYLE_LIST, "CidadeRPG | Empregos", list, "Pegar", "Cancelar");
	return 1;
}

CMD:textdraw(playerid, params[]) {
	TextDrawShowForPlayer(playerid, Text:TextDraw[2]);
	TextDrawShowForPlayer(playerid, Text:TextDraw[3]);
	TextDrawShowForPlayer(playerid, Text:TextDraw[4]);
	TextDrawShowForPlayer(playerid, Text:TextDraw[5]);
	SelectTextDraw(playerid, -1);
	return 1;
}