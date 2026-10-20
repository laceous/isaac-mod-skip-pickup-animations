local mod = RegisterMod('Skip Pickup Animations', 1)

if REPENTOGON then
  function mod:onPlayerRender(player)
    if Input.IsActionTriggered(ButtonAction.ACTION_DROP, player.ControllerIndex) then
      local sprite = player:GetBodySprite()
      -- Pickup : when picking up a collectible/trinket
      -- UseItem : when picking up a card/pill, also when you use an active item
      -- there's a separate LiftItem animation when you hold something over your head for an extended period of time
      if (sprite:IsPlaying('Pickup') or sprite:IsPlaying('UseItem')) and sprite:GetFrame() > 0 then -- Pickup_Online
        sprite:SetLastFrame()
        -- smoother, but slower, also potentially less compatible with custom sprites:
        --sprite:SetFrame(35) -- Pickup
        --sprite:SetFrame(11) -- UseItem
      end
    end
  end
  
  mod:AddCallback(ModCallbacks.MC_POST_PLAYER_RENDER, mod.onPlayerRender, PlayerVariant.PLAYER) -- MC_POST_RENDER
end