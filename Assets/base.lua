local gameName, sversion = ...;

gameName = gameName or 'testing';
sversion = sversion or 'developer';

local repository        = 'https://raw.githubusercontent.com/mainstreamed/chlamydia_solutions/refs/heads/main/Assets/';

local loadAsset         = function(connector)
      local func, _err = loadstring(game:HttpGet(`{repository}{connector}`));
      assert(func, `Failed to load Asset {connector}: {_err}`)
      return func();
end;

local uiLibrary         = loadAsset('uiLibrary.lua');
local themeManager      = loadAsset('themeManager.lua');
local saveManager       = loadAsset('saveManager.lua');

local window = uiLibrary:CreateWindow({
      Title             = `{gameName} | version: {sversion}`;
      Center            = true;
      AutoShow          = true;
      TabPadding        = 8;
      MenuFadeTime      = 0.2;
});


return window, themeManager, saveManager;
