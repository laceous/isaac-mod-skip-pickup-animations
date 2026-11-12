local mod = RegisterMod('Skip Pickup Animations', 1)

if REPENTOGON then
  function mod:onPlayerRender(player)
    if Input.IsActionTriggered(ButtonAction.ACTION_DROP, player.ControllerIndex) then
      local bodySprite = player:GetBodySprite()
      -- Pickup : when picking up a collectible/trinket
      -- UseItem : when picking up a card/pill, also when you use an active item
      -- there's a separate LiftItem animation when you hold something over your head for an extended period of time
      if (bodySprite:IsPlaying('Pickup') or bodySprite:IsPlaying('UseItem')) and bodySprite:GetFrame() > 0 then -- Pickup_Online
        bodySprite:SetLastFrame()
        -- smoother, but slower, also potentially less compatible with custom sprites:
        --bodySprite:SetFrame(35) -- Pickup
        --bodySprite:SetFrame(11) -- UseItem
      end
      local sprite = player:GetSprite()
      if (sprite:IsPlaying('Happy') or sprite:IsPlaying('Sad')) and sprite:GetFrame() > 0 then
        sprite:SetLastFrame()
      end
    end
  end
  
  -- co-op babies don't have the animations we're checking for
  mod:AddCallback(ModCallbacks.MC_POST_PLAYER_RENDER, mod.onPlayerRender, PlayerVariant.PLAYER) -- MC_POST_RENDER
end