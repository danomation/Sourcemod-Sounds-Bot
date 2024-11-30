
#include <sourcemod>
#include <sdktools>
#include <clientprefs>

#pragma newdecls required
#pragma semicolon 1

Handle g_hAlphaSound;

public Plugin myinfo =
{
        name = "Alpha Sounds Plugin",
        author = "danomation",
        description = "Enables playing sounds in Dystopia",
        version = "0.2",
        url = "switchmeme.com"
}

public void OnPluginStart()
{
        g_hAlphaSound = RegClientCookie("alpha_sound_alphasound", "Alpha_Sound AlphaSound", CookieAccess_Protected);
        RegConsoleCmd("potato", potato);
        RegConsoleCmd("soundsoff", disable);
        RegConsoleCmd("soundson", enable);
        RegConsoleCmd("disable", disable);
        RegConsoleCmd("enable", enable);
        RegConsoleCmd("sounds_off", disable);
        RegConsoleCmd("sounds_on", enable);
        RegConsoleCmd("quack", quack);
        RegConsoleCmd("mission", mission);
        RegConsoleCmd("headshot", headshot);
        RegConsoleCmd("prepare", prepare);
        RegConsoleCmd("triple", triple);
        RegConsoleCmd("boing", boing);
        RegConsoleCmd("meow", meow);
        RegConsoleCmd("phistball", phistball);
        RegConsoleCmd("simonscat", simonscat);
        RegConsoleCmd("utini", utini);
        RegConsoleCmd("wtf", wtf);
        RegConsoleCmd("list", list);
}

public void OnMapStart()
{
        AddFileToDownloadsTable("sound/sewertemple/quack.wav");
        AddFileToDownloadsTable("sound/custom/wintermute_welcome_2.wav");
        AddFileToDownloadsTable("sound/custom/potato.wav");
        AddFileToDownloadsTable("sound/custom/potato_2.wav");
        AddFileToDownloadsTable("sound/custom/potato_3.wav");
        AddFileToDownloadsTable("sound/custom/potato_4.wav");
        AddFileToDownloadsTable("sound/custom/potato_5.wav");
        AddFileToDownloadsTable("sound/custom/potato_6.wav");
        AddFileToDownloadsTable("sound/custom/potato_7.wav");
        AddFileToDownloadsTable("sound/custom/potato_8.wav");
        PrecacheSound("custom/wintermute_welcome_2.wav");
        PrecacheSound("plush/squeek.wav");
        PrecacheSound("plush/sis.wav");
        PrecacheSound("custom/potato.wav");
        PrecacheSound("custom/potato_2.wav");
        PrecacheSound("custom/potato_3.wav");
        PrecacheSound("custom/potato_4.wav");
        PrecacheSound("custom/potato_5.wav");
        PrecacheSound("custom/potato_6.wav");
        PrecacheSound("custom/potato_7.wav");
        PrecacheSound("custom/potato_8.wav");
        PrecacheSound("player/falldeath1.wav");
        PrecacheSound("player/falldeath2.wav");
        PrecacheSound("player/fallpain1.wav");
        PrecacheSound("player/fallpain2.wav");
        PrecacheSound("player/fallpain3.wav");
        PrecacheSound("player/fallpain4.wav");
        PrecacheSound("player/heavy_death1.wav");
        PrecacheSound("player/heavy_death2.wav");
        PrecacheSound("player/heavy_death4.wav");
        PrecacheSound("player/objective lost.wav");
        PrecacheSound("player/objective succesful.wav");
        AddFileToDownloadsTable("sound/sewertemple/quack.wav");
        AddFileToDownloadsTable("sound/sewertemple/boing_t1.wav");
        AddFileToDownloadsTable("sound/sewertemple/meow_t1.wav");
        AddFileToDownloadsTable("sound/sewertemple/phistball_t1.wav");
        AddFileToDownloadsTable("sound/sewertemple/simonscat_t1.wav");
        AddFileToDownloadsTable("sound/sewertemple/utini_t1.wav");
        AddFileToDownloadsTable("sound/sewertemple/wtf_t1.wav");
        AddFileToDownloadsTable("sound/sewertemple/mission.wav");
        AddFileToDownloadsTable("sound/sewertemple/headshot.wav");
        AddFileToDownloadsTable("sound/sewertemple/prepare.wav");
        AddFileToDownloadsTable("sound/sewertemple/triple.wav");
        PrecacheSound("sewertemple/boing_t1.wav");
        PrecacheSound("sewertemple/meow_t1.wav");
        PrecacheSound("sewertemple/phistball_t1.wav");
        PrecacheSound("sewertemple/simonscat_t1.wav");
        PrecacheSound("sewertemple/utini_t1.wav");
        PrecacheSound("sewertemple/wtf_t1.wav");
        PrecacheSound("sewertemple/quack.wav");
        PrecacheSound("sewertemple/mission.wav");
        PrecacheSound("sewertemple/headshot.wav");
        PrecacheSound("sewertemple/prepare.wav");
        PrecacheSound("sewertemple/triple.wav");

}

static char MemeSound [][] = {
        "plush/squeek.wav",
        "plush/sis.wav",
        "player/fall_impact1.wav",
        "player/falldeath1.wav",
        "player/heavy_death2.wav",
        "custom/potato.wav",
        "custom/potato_2.wav",
        "custom/potato_3.wav",
        "custom/potato_4.wav",
        "custom/potato_5.wav",
        "custom/potato_6.wav",
        "custom/potato_7.wav",
        "custom/potato_8.wav",
};

static char MemePotato [][] = {
        "custom/potato.wav",
        "custom/potato_2.wav",
        "custom/potato_3.wav",
        "custom/potato_4.wav",
        "custom/potato_5.wav",
        "custom/potato_6.wav",
        "custom/potato_7.wav",
        "custom/potato_8.wav",
};

public void OnClientPutInServer( int client )
{
        if ( IsFakeClient(client) )
        {
                return;
        }
        int sclient = client;
        int client = MaxClients;
        while ( client )
        {
            if ( client == sclient )
            {
                if ( IsClientAuthorized(client) )
                {
                    if (AreClientCookiesCached(client))
                    {
                        char sCookieValue[12];
                        GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                        int cookieValue = StringToInt(sCookieValue);
                        if ( cookieValue == 1 ){
                            EmitSoundToClient(
                                client,
                                MemeSound[GetRandomInt( 0, sizeof(MemeSound)-1 )]    // sample
                            );
                        }
                    }
                }
            }
            client--;
        }
}

public Action quack(int client, int argc)
{
        int client = MaxClients;
        while ( client )
        {
            if ( IsClientAuthorized(client) )
            {
                if (AreClientCookiesCached(client))
                {
                    char sCookieValue[12];
                    GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                    int cookieValue = StringToInt(sCookieValue);
                    if ( cookieValue == 1 )
                    {
                        EmitSoundToClient(
                            client,
                            "sewertemple/quack.wav"    // sample
                        );
                    }
                }
            }
            client--;
        }
        return Plugin_Handled;
}

public Action mission(int client, int argc)
{
        int client = MaxClients;
        while ( client ) {
            if ( IsClientAuthorized(client) ) {
                if (AreClientCookiesCached(client))
                {
                    char sCookieValue[12];
                    GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                    int cookieValue = StringToInt(sCookieValue);
                    if ( cookieValue == 1 ){
                        EmitSoundToClient(
                            client,
                            "sewertemple/mission.wav"    // sample
                        );
                    }
                }
            }
            client--;
        }
        return Plugin_Handled;
}

public Action headshot(int client, int argc)
{
        int client = MaxClients;
        while ( client ) {
            if ( IsClientAuthorized(client) ) {
                if (AreClientCookiesCached(client))
                {
                    char sCookieValue[12];
                    GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                    int cookieValue = StringToInt(sCookieValue);
                    if ( cookieValue == 1 ){
                        EmitSoundToClient(
                            client,
                            "sewertemple/prepare.wav"    // sample
                        );
                    }
                }
            }
            client--;
        }
        return Plugin_Handled;
}


public Action prepare(int client, int argc)
{
        int client = MaxClients;
        while ( client ) {
            if ( IsClientAuthorized(client) ) {
                if (AreClientCookiesCached(client))
                {
                    char sCookieValue[12];
                    GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                    int cookieValue = StringToInt(sCookieValue);
                    if ( cookieValue == 1 ){
                        EmitSoundToClient(
                            client,
                            "sewertemple/prepare.wav"    // sample
                        );
                    }
                }
            }
            client--;
        }
        return Plugin_Handled;
}

public Action triple(int client, int argc)
{
        int client = MaxClients;
        while ( client ) {
            if ( IsClientAuthorized(client) ) {
                if (AreClientCookiesCached(client))
                {
                    char sCookieValue[12];
                    GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                    int cookieValue = StringToInt(sCookieValue);
                    if ( cookieValue == 1 ){
                        EmitSoundToClient(
                            client,
                            "sewertemple/triple.wav"    // sample
                        );
                    }
                }
            }
            client--;
        }
        return Plugin_Handled;
}

public Action boing(int client, int argc)
{
        int client = MaxClients;
        while ( client ) {
            if ( IsClientAuthorized(client) ) {
                if (AreClientCookiesCached(client))
                {
                    char sCookieValue[12];
                    GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                    int cookieValue = StringToInt(sCookieValue);
                    if ( cookieValue == 1 ){
                        EmitSoundToClient(
                            client,
                            "sewertemple/boing_t1.wav"    // sample
                        );
                    }
                }
            }
            client--;
        }
        return Plugin_Handled;
}

public Action meow(int client, int argc)
{
        int client = MaxClients;
        while ( client ) {
            if ( IsClientAuthorized(client) ) {
                if (AreClientCookiesCached(client))
                {
                    char sCookieValue[12];
                    GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                    int cookieValue = StringToInt(sCookieValue);
                    if ( cookieValue == 1 ){
                        EmitSoundToClient(
                            client,
                            "sewertemple/meow_t1.wav"    // sample
                        );
                    }
                }
            }
            client--;
        }
        return Plugin_Handled;
}

public Action phistball(int client, int argc)
{
        int client = MaxClients;
        while ( client ) {
            if ( IsClientAuthorized(client) ) {
                if (AreClientCookiesCached(client))
                {
                    char sCookieValue[12];
                    GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                    int cookieValue = StringToInt(sCookieValue);
                    if ( cookieValue == 1 ){
                        EmitSoundToClient(
                            client,
                            "sewertemple/phistball_t1.wav"    // sample
                        );
                    }
                }
            }
            client--;
        }
        return Plugin_Handled;
}

public Action simonscat(int client, int argc)
{
        int client = MaxClients;
        while ( client ) {
            if ( IsClientAuthorized(client) ) {
                if (AreClientCookiesCached(client))
                {
                    char sCookieValue[12];
                    GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                    int cookieValue = StringToInt(sCookieValue);
                    if ( cookieValue == 1 ){
                        EmitSoundToClient(
                            client,
                            "sewertemple/simonscat_t1.wav"    // sample
                        );
                    }
                }
            }
            client--;
        }
        return Plugin_Handled;
}

public Action utini(int client, int argc)
{
        int client = MaxClients;
        while ( client ) {
            if ( IsClientAuthorized(client) ) {
                if (AreClientCookiesCached(client))
                {
                    char sCookieValue[12];
                    GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                    int cookieValue = StringToInt(sCookieValue);
                    if ( cookieValue == 1 ){
                        EmitSoundToClient(
                            client,
                            "sewertemple/utini_t1.wav"    // sample
                        );
                    }
                }
            }
            client--;
        }
        return Plugin_Handled;
}

public Action wtf(int client, int argc)
{
        int client = MaxClients;
        while ( client ) {
            if ( IsClientAuthorized(client) ) {
                if (AreClientCookiesCached(client))
                {
                    char sCookieValue[12];
                    GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                    int cookieValue = StringToInt(sCookieValue);
                    if ( cookieValue == 1 ){
                        EmitSoundToClient(
                            client,
                            "sewertemple/wtf_t1.wav"    // sample
                        );
                    }
                }
            }
            client--;
        }
        return Plugin_Handled;
}

public Action potato(int client, int argc)
{
        int client = MaxClients;
        while ( client ) {
            if ( IsClientAuthorized(client) )
                        {
                if (AreClientCookiesCached(client))
                {
                    char sCookieValue[12];
                    GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
                    int cookieValue = StringToInt(sCookieValue);
                    if ( cookieValue == 1 )
                                        {
                        EmitSoundToClient(
                            client,
                            MemePotato[GetRandomInt( 0, sizeof(MemePotato)-1 )]);
                    }
                }
            }
            client--;
        }
        return Plugin_Handled;
}


public Action list(int client, int argc)
{
        PrintCenterText(client, "!potato !quack !mission !headshot !prepare !triple !boing !meow !phistball !simonscat !utini !wtf");
}

public Action disable(int client, int argc)
{
        if (AreClientCookiesCached(client))
        {
            // Get cookie and add 1 to it
            char sCookieValue[12];
            char sCookieValue1[12];
            GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
            int cookieValue = StringToInt(sCookieValue);
                if (cookieValue == 1){
                    cookieValue = 0;
                    PrintCenterText(client, "Sounds Off");
                }
                else {
                    IntToString(cookieValue, sCookieValue1, sizeof(sCookieValue1));
                    PrintCenterText(client, "Sounds already disabled. Cookie value %s", sCookieValue1);
                }

            IntToString(cookieValue, sCookieValue, sizeof(sCookieValue));
            SetClientCookie(client, g_hAlphaSound, sCookieValue);
        }
}

public Action enable(int client, int argc)
{
       if (AreClientCookiesCached(client))
       {
           char sCookieValue[12];
           char sCookieValue1[12];
           GetClientCookie(client, g_hAlphaSound, sCookieValue, sizeof(sCookieValue));
           int cookieValue = StringToInt(sCookieValue);
           if (cookieValue == 0){
               cookieValue = 1;
               PrintCenterText(client, "Sounds On");
           }
           else {
               IntToString(cookieValue, sCookieValue1, sizeof(sCookieValue1));
               PrintCenterText(client, "Sounds already enabled. Cookie value %s", sCookieValue1);
           }
           IntToString(cookieValue, sCookieValue, sizeof(sCookieValue));
           SetClientCookie(client, g_hAlphaSound, sCookieValue);
       }
}
