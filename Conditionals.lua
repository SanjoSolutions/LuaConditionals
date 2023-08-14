local addOnName = 'Conditionals'
local version = '2.0.0'

if _G.Library then
  if not Library.isRegistered(addOnName, version) then
    --- @class Conditionals
    local Conditionals = {}

    function Conditionals.doOnceWhen(areConditionsMet, fn)
      local ticker
      ticker = C_Timer.NewTicker(0, function()
        if areConditionsMet() then
          ticker:Cancel()

          fn()
        end
      end)
    end

    Library.register(addOnName, version, Conditionals)
  end
else
  error(addOnName + ' requires Library. It seems absent.')
end
