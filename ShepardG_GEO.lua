-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()

end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	options.CastingModes = {'Normal', 'Resistant'}
	options.OffenseModes = {'Normal','Staff','Club','StaffACC','ClubACC'}
	options.DefenseModes = {'Normal'}
	options.WeaponskillModes = {'Normal'}
	options.IdleModes = {'Normal','Hybrid','PDT','petPDT'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.Defense.PhysicalMode = 'PDT'
	
	lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
		'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
		'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
		'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
		'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II', 'Stonera', 'Thundara', 'Fira', 'Blizzara', 'Aerora', 'Watera'}

	-- Default macro set/book
	set_macro_page(1, 6)
end

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic"}
	sets.precast.JA['Bolster'] = {body="Bagua Tunic"}
	sets.precast.JA['Curative Recantation'] = {hands="Bagua Mitaines"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants"}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}	
	
	-- Fast cast sets for spells

	sets.precast.FC = {
		head="Nahtirah Hat",neck="Jeweled Collar",ear2="Loquacious Earring",
		body="Eirene's Manteel",ring1="Prolix Ring",
		back="Swith Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Chelona Boots"}

	sets.precast.FC.Cure = {
		head="Nahtirah Hat",neck="Jeweled Collar",ear2="Loquacious Earring",
		body="Heka's Kalasiris",ring1="Prolix Ring",
		back="Pahtli Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}
		
	sets.precast.FC.Stoneskin = {
		head="Umuthi Hat",neck="Jeweled Collar",ear2="Loquacious Earring",
		body="Eirene's Manteel",hands="Carapacho Cuffs",ring1="Prolix Ring",
		back="Swith Cape",waist="Siegel Sash",legs="Geomancy Pants",feet="Chelona Boots"}

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Buremte Hat",neck="Ancient Torque",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Artsieq Jubbah",hands="Hagondes Cuffs",ring1="Pyrosoul Ring",ring2="Rajas Ring",
		back="Pahtli Cape",waist="Witch Sash",legs="Theurgist's Slacks",feet="Umbani Boots"}
		
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Flash Nova'] = {
		head="Hagondes Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring2="Strendu Ring",
		back="Toro Cape",waist="Snow Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
	
	sets.precast.WS['Hexa Strike'] = {
		head="Buremte Hat",neck="Rancor Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Artsieq Jubbah",hands="Hagondes Cuffs",ring1="Pyrosoul Ring",ring2="Rajas Ring",
		back="Pahtli Cape",waist="Witch Sash",legs="Theurgist's Slacks",feet="Umbani Boots"}
		
	sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}

	sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}

	sets.precast.WS['Retribution'] = {
		head="Buremte Hat",neck="Soil Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		body="Artsieq Jubbah",hands="Hagondes Cuffs",ring1="Pyrosoul Ring",ring2="Rajas Ring",
		back="Pahtli Cape",waist="Shadow Belt",legs="Theurgist's Slacks",feet="Umbani Boots"}
		
	sets.precast.WS['Cataclysm'] = {
		head="Buremte Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Novio Earring",
		body="Hagondes Coat",hands="Hagondes Cuffs",ring1="Pyrosoul Ring",ring2="Strendu Ring",
		back="Toro Cape",waist="Aswang Sash",legs="Theurgist's Slacks",feet="Umbani Boots"}
		
	-- Midcast Sets

	sets.midcast.FastRecast = {
		head="Artsieq Hat",ear2="Loquacious Earring",
		body="Artsieq Jubbah",hands="Artsieq Cuffs",ring1="Prolix Ring",
		back="Swith Cape",waist="Ninurta's Sash",legs="Geomancy Pants",feet="Umbani Boots"}

	sets.midcast.Geomancy = {range="Dunna",
		head="Artsieq Hat",ear1="Gifted Earring",
		body="Bagua Tunic",hands="Geomancy Mitaines",
		back="Lifestream Cape",waist="Austerity Belt",legs="Theurgist's Slacks",feet="Umbani Boots" }
		
	-- Cure potency = 
	sets.midcast.Cure = {main="Chatoyant Staff",sub="Oneiros Grip",range="Dunna",
		head="Artsieq Hat",neck="Weike Torque",ear1="Beatific Earring",ear2="Novia Earring",
		body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Haoma's Ring",ring2="Sirona's Ring",
		back="Pahtli Cape",waist="Ninurta's Sash",legs="Nares Trews",feet="Umbani Boots"}
	
	sets.midcast.Stoneskin = {main="Twebuliij",sub="Oneiros Grip",
		head="Umuthi hat",neck="Stone Gorget",ear1="Earthcry Earring",ear2="Gifted Earring",
		body="Hagondes Coat",hands="Artsieq Cuffs",ring1="Aquasoul Ring",ring2="Aquasoul Ring",
		back="Refraction Cape",waist="Siegel Sash",legs="Theurgist's Slacks",feet="Umbani Boots"}
		
	sets.midcast.Protectra = {ring1="Sheltered Ring"}

	sets.midcast.Shellra = {ring1="Sheltered Ring"}

	-- Custom Spell Classes
	sets.midcast['Enfeebling Magic'] = {main="Twebuliij Staff",sub="Mephitis Grip",ranged="Aureole",
		head="Artsieq Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Artsieq Jubbah",hands="Artsieq Cuffs",ring1="Aquasoul Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Witch Sash",legs="Theurgist's Slacks",feet="Umbani boots"}

	sets.midcast.IntEnfeebles = {main="Twebuliij Staff",sub="Mephitis Grip",ranged="Aureole",
		head="Artsieq Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Artsieq Jubbah",hands="Hagondes Cuffs",ring1="Aquasoul Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Witch Sash",legs="Theurgist's Slacks",feet="Umbani boots"}
		
	sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

	sets.midcast['Dark Magic'] = {main="Twebuliij Staff",sub="Mephitis Grip",ranged="Aureole",
		head="Bagua Galero",neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Geomancy Tunic",hands="Artsieq Cuffs",ring1="Sangoma Ring",ring2="Balrahn's Ring",
		back="Refraction Cape",waist="Aswang Sash",legs="Theurgist'sl Slacks",feet="Artsieq Boots"}
		
		-- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast.LowTierNuke = {main="Twebuliij Staff",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Eddy Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
		body="Hagondes Coat",hands="Hagondes Cuffs",ring1="Icesoul Ring",ring2="Strendu Ring",
		back="Toro Cape",waist="Aswang Sash",legs="Theurgist's Slacks",feet="Umbani Boots"}

	sets.midcast.LowTierNuke.Resistant = {main="Twebuliij Staff",sub="Mephitis Grip",ranged="Aureole",
		head="Buremete Hat",neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Artsieq Jubbah",hands="Hagondes Cuffs",ring1="Icesoul Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Aswang Sash",legs="Theurgist's Slacks",feet="Artsieq Boots"}

	-- Custom classes for high-tier nukes.
	sets.midcast.HighTierNuke = {main="Twebuliij Staff",sub="Zuuxowu Grip",ammo="Witchstone",
		head="Geomancy Galero",neck="Eddy Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
		body="Hagondes Coat",hands="Hagondes Cuffs",ring1="Icesoul Ring",ring2="Strendu Ring",
		back="Toro Cape",waist="Aswang Sash",legs="Theurgist's Slacks",feet="Umbani boots"}

	sets.midcast.HighTierNuke.Resistant = {main="Twebuliij Staff",sub="Mephitis Grip",ammo="Kalboron Stone",
		head="Geomancy Galero",neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Artsieq Jubbah",hands="Hagondes Cuffs",ring1="Sangoma Ring",ring2="Strendu Ring",
		back="Refraction Cape",waist="Aswang Sash",legs="Theurgist's Slacks",feet="Artsieq Boots"}
		
	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {head="Nahtirah Hat",neck="Wiglen Gorget",
		body="Artsieq Jubbah",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		legs="Nares Trews",feet="Chelona Boots"}


	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle.Town = {main="Terra's Staff",sub="Oneiros Grip",range="Dunna",
		head="Artsieq Hat",neck="Twilight Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
		body="Artsieq Jubbah",hands="Bagua Mitaines",ring1="Dark Ring",ring2="Defending Ring",
		back="Cheviot Cape",waist="Fucho-no-obi",legs="Nares Trews",feet="Geomancy Sandals"}

	sets.idle.Field = {main="Terra's Staff",sub="Oneiros Grip",range="Dunna",
		head="Artsieq Hat",neck="Twilight Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
		body="Artsieq Jubbah",hands="Bagua Mitaines",ring1="Dark Ring",ring2="Defending Ring",
		back="Cheviot Cape",waist="Fucho-no-obi",legs="Nares Trews",feet="Geomancy Sandals"}

	sets.idle.Field.PDT = {main="Terra's Staff",sub="Oneiros Grip",range="Dunna",
		head="Artsieq Hat",neck="Twilight Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
		body="Artsieq Jubbah",hands="Bagua Mitaines",ring1="Dark Ring",ring2="Defending Ring",
		back="Cheviot Cape",waist="Fucho-no-obi",legs="Nares Trews",feet="Geomancy Sandals"}

	sets.idle.Weak = {main="Terra's Staff",sub="Oneiros Grip",range="Dunna",
		head="Nefer Khat +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Umbra Cape",waist="Goading Belt",legs="Nares Trews",feet="Herald's Gaiters"}

	-- Defense sets

	sets.defense.PDT = {range="Dunna",
		head="Hagondes Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.defense.MDT = {range="Dunna",
		head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Goading Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

	sets.Kiting = {feet="Geomancy Sandals"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {main="Twebuliij",sub="Oneiros Grip",range="Dunna",
		head="Artsieq Hat",neck="Ancient Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Artsieq Jubbah",hands="Hagondes Cuffs",ring1="Mars's Ring",ring2="Beeline Ring",
		back="Cheviot Cape",waist="Ninurta's Sash",legs="Theurgist's Slacks",feet="Hagondes Sabots"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)

end

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)

end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		-- Default base equipment layer of fast recast.
		equip(sets.midcast.FastRecast)
	end
end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
	if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
		if lowTierNukes:contains(spell.english) then
			return 'LowTierNuke'
		else
			return 'HighTierNuke'
		end
	end
end
-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)

end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)

end


-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
	return idleSet
end

function customize_melee_set(meleeSet)
	return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_status_change(newStatus,oldStatus)

end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	--handle_equipping_gear(player.status)
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)

end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)

end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state()

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

