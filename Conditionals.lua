local addOnName = ...
local version = '1.0.0'

if not Library.isRegistered(addOnName, version) then
  --- @class Conditionals
  local Conditionals = {}

  Library.register(addOnName, version, Conditionals)

  function Conditionals.doOnceWhen(areConditionsMet, fn)
    local ticker
    ticker = C_Timer.NewTicker(0, function()
      if areConditionsMet() then
        ticker:Cancel()

        fn()
      end
    end)
  end
end
