return {
  -- pets
  "giusgad/pets.nvim",
  dependencies = {
    "edluffy/hologram.nvim",
  },
  config = true,
  cmd = {
    "PetsNew",
    "PetsNewCustom",
    "PetsList",
    "PetsKill",
    "PetsKillAll",
    "PetsPauseToggle",
    "PetsHideToggle",
    "PetsSleepToggle",
  },
}
