# Move models into zombie_apocalypse layout (like reference server)
# Run from: cstrike\models (or use full paths below)
# Scripts are already updated to use models/zombie_apocalypse/ and models/zombie_apocalypse/weapons/

$base = "c:\Users\elias\Desktop\CURSOR ZOMBIE PLAGUE\NEWbeta_cs16\cstrike\models"
$weapons = "$base\zombie_apocalypse\weapons"
$za = "$base\zombie_apocalypse"

# --- WEAPONS (into zombie_apocalypse/weapons/) ---
# From models/x/
Get-ChildItem "$base\x\*.mdl" -ErrorAction SilentlyContinue | Where-Object { $_.Name -notlike "*.ztmp" } | ForEach-Object { Copy-Item $_.FullName -Destination $weapons -Force }
# From models/zmo/ and zmo/balrog1/
Get-ChildItem "$base\zmo\*.mdl" -ErrorAction SilentlyContinue | Where-Object { $_.Name -notlike "*.ztmp" } | ForEach-Object { Copy-Item $_.FullName -Destination $weapons -Force }
Get-ChildItem "$base\zmo\balrog1\*.mdl" -ErrorAction SilentlyContinue | Where-Object { $_.Name -notlike "*.ztmp" } | ForEach-Object { Copy-Item $_.FullName -Destination $weapons -Force }
# From models/t9/
Get-ChildItem "$base\t9\*.mdl" -ErrorAction SilentlyContinue | Where-Object { $_.Name -notlike "*.ztmp" } | ForEach-Object { Copy-Item $_.FullName -Destination $weapons -Force }
# From models/zombieamxxru/
Get-ChildItem "$base\zombieamxxru\*.mdl" -ErrorAction SilentlyContinue | Where-Object { $_.Name -notlike "*.ztmp" } | ForEach-Object { Copy-Item $_.FullName -Destination $weapons -Force }
# From models/ root (weapon models only)
$rootWeapons = @(
    "DragonModel.mdl", "p_cannon_6.mdl", "v_cannon_6_fix2.mdl", "w_cannon_6.mdl",
    "gungnir_missile.mdl", "p_gungnira.mdl", "p_gungnirb.mdl", "v_gungnir_v3.mdl", "w_gungnir.mdl",
    "p_buffbaretta.mdl", "v_buffbarreta_fix3.mdl", "w_buffbaretta.mdl", "ef_scorpion_hole.mdl", "ef_man.mdl",
    "p_thunderpistol.mdl", "v_thunderpistol_fix.mdl", "v_thunderpistol_2_fix.mdl", "w_thunderpistol.mdl", "ef_thunderpistol.mdl",
    "p_balrog11.mdl", "v_balrog11_2.mdl", "w_balrog11.mdl",
    "p_laserminiguna.mdl", "p_laserminigunb.mdl", "v_laserminigun.mdl", "w_laserminigun.mdl",
    "p_crow9a.mdl", "v_crow9.mdl", "crow9_wind.mdl"
)
foreach ($f in $rootWeapons) {
    $src = Join-Path $base $f
    if (Test-Path $src) { Copy-Item $src -Destination $weapons -Force }
}
# From models/addons/ (dual uzi)
@("v_dual_uzi.mdl", "p_dual_uzi.mdl", "w_dual_uzi.mdl") | ForEach-Object {
    $src = Join-Path "$base\addons" $_
    if (Test-Path $src) { Copy-Item $src -Destination $weapons -Force }
}

# --- ZOMBIE APOCALYPSE ROOT (claws, knives, supplybox, bat, effects) ---
# From models/zombie_plague/
Get-ChildItem "$base\zombie_plague\*.mdl" -ErrorAction SilentlyContinue | Where-Object { $_.Name -notlike "*.ztmp" } | ForEach-Object { Copy-Item $_.FullName -Destination $za -Force }
# From models/xman2030/ (flying zombi)
$flying = "$base\xman2030\v_zombibomb_flyingzombi1.mdl"
if (Test-Path $flying) { Copy-Item $flying -Destination $za -Force }

Write-Host "Done. Models copied to zombie_apocalypse and zombie_apocalypse/weapons."
Write-Host "After testing, you can remove the old folders (x, zmo, t9, zombieamxxru, zombie_plague) or keep them as backup."
