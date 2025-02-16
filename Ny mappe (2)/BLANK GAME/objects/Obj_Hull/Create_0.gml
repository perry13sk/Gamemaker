
// macros
#macro DAMAGE_NONE 0 // INGEN SKADE
#macro DAMAGE_LIGHT 1 // LET SKADE INGEN EFEKT
#macro DAMAGE_MEDIUM 2 // KRAFTIG SKADE LANGSOM KØERNE
#macro DAMAGE_HEAVY 3 // ALVORLIG SKADE IMOBIL
#macro DAMAGE_DESTROYED 4 // ØDELAGT

// variabler
//direction = 0 
instance_create_layer(0,0,"instances",Obj_Skerm)


instance_create_layer(x,y,"instances",Obj_Driver)
damage = DAMAGE_NONE;