
screwdriver = screwdriver or {}

local church_pews = {}

-------------------
-- Register Nodes
-------------------
church_pews.materials = {
	{"acacia_wood", "Acacia Wood", "default_acacia_wood.png", "default:acacia_wood"},
	{"aspen_wood", "Aspen Wood", "default_aspen_wood.png", "default:aspen_wood"},
	{"junglewood", "Jungle Wood", "default_junglewood.png", "default:junglewood"},
	{"pine_wood", "Pine Wood", "default_pine_wood.png", "default:pine_wood"},
	{"wood", "Appletree Wood", "default_wood.png", "default:wood"},
}

for _, row in ipairs(church_pews.materials) do
	local name = row[1]
	local desc = row[2]
	local tiles = row[3]
	local craft_material = row[4]

	minetest.register_node("church_pews:church_pew_left_"..name, {
		drawtype = "nodebox",
		description = desc.." Pew",
		tiles = { tiles },
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {oddly_breakable_by_hand= 3, snappy = 3, choppy = 3, cracky = 3},
		sounds = default.node_sound_wood_defaults(),
		on_rotate = screwdriver.rotate_simple,
		node_box = {
			type = 'fixed',
			fixed = {
				{-0.375, -0.375, 0.3125, 0.5, -0.25, 0.375},
				{-0.375, -0.25, 0.375, 0.5, 0.3125, 0.4375},
				{-0.5, -0.5, 0.25, -0.3125, 0.375, 0.5},
				{-0.5, -0.3125, -0.25, -0.3125, -0.0625, 0.25},
				{-0.4375, -0.0625, -0.25, -0.375, 0.125, 0.25},
				{-0.4375, 0.125, -0.125, -0.375, 0.1875, 0.25},
				{-0.5, -0.5, -0.4375, -0.3125, 0.0625, -0.25},
				{-0.4375, 0.125, 0.0625, -0.375, 0.25, 0.3125},
				{-0.3125, -0.25, -0.25, 0.5, -0.1875, 0.3125},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.25, 0.5, 0.0, 0.375},
			},
		}
	})

	minetest.register_node("church_pews:church_pew_right_"..name, {
		drawtype = "nodebox",
		description = desc.." Pew",
		tiles = { tiles },
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {oddly_breakable_by_hand= 3, snappy = 3, choppy = 3, cracky = 3},
		sounds = default.node_sound_wood_defaults(),
		on_rotate = screwdriver.rotate_simple,
		node_box = {
			type = 'fixed',
			fixed = {
				{-0.5, -0.375, 0.3125, 0.3125, -0.25, 0.375},
				{-0.5, -0.25, 0.375, 0.3125, 0.3125, 0.4375},
				{0.3125, -0.5, 0.25, 0.5, 0.375, 0.5},
				{0.3125, -0.3125, -0.25, 0.5, -0.0625, 0.25},
				{0.375, -0.0625, -0.25, 0.4375, 0.125, 0.25},
				{0.375, 0.125, -0.125, 0.4375, 0.1875, 0.25},
				{0.3125, -0.5, -0.4375, 0.5, 0.0625, -0.25},
				{0.375, 0.125, 0.0625, 0.4375, 0.25, 0.3125},
				{-0.5, -0.25, -0.25, 0.3125, -0.1875, 0.3125},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.25, 0.5, 0.0, 0.375},
			},
		}
	})

	minetest.register_node("church_pews:church_pew_center_" ..name, {
		drawtype = "nodebox",
		description = desc.." Pew",
		tiles = { tiles },
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {oddly_breakable_by_hand= 3, snappy = 3, choppy = 3, cracky = 3},
		sounds = default.node_sound_wood_defaults(),
		on_rotate = screwdriver.rotate_simple,
		node_box = {
			type = 'fixed',
			fixed = {
				{-0.5, -0.375, 0.3125, 0.5, -0.25, 0.375},
				{-0.5, -0.25, 0.375, 0.5, 0.3125, 0.4375},
				{-0.5, -0.25, -0.25, 0.5, -0.1875, 0.375},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.25, 0.5, 0.0, 0.375},
			},
		},
	})

---------------------------
-- Register Craft Recipes
---------------------------
	if craft_material then
		minetest.register_craft({
			output = 'church_pews:church_pew_left' ..name.. ' 3',
			recipe = {{craft_material, 'stairs:stair_' ..name, 'stairs:stair_' ..name}}
		})

		minetest.register_craft({
			output = 'church_pews:church_pew_center' ..name.. ' 3',
			recipe = {{'stairs:stair_' ..name, craft_material, 'stairs:stair_' ..name}}
		})

		minetest.register_craft({
			output = 'church_pews:church_pew_center' ..name.. ' 3',
			recipe = {{'stairs:stair_' ..name, 'stairs:stair_' ..name, craft_material}}
		})
	end

end
