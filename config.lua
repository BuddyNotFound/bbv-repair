Config = {}

QBCore = exports['qb-core']:GetCoreObject()  -- comment if you use QBCore
-- ESX = exports["es_extended"]:getSharedObject() -- uncomment if you use ESX

Config.Settings = {
    Framework = "", -- ST/QB/ESX
    Command = "repair", -- Will be used if Framework is set to ST
    Distance = 4.0
}

Config.Button = {
    FirstText = "Repair",
    EndText = "Vehilce Repaired",
    Event = 'bbv-repair:repair',
    Time = 6000,
    NoVeh = "You are too far"
}