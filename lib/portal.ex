defmodule Portal do
  defstruct [:left, :right]

  @doc """
  Start transfering 'data from 'left to 'right'
  """
  def transfer(left,right,data)do
    for item <- data do
      Portal.Door.push(left,item)
    end

    # Returns a portal struct we will use next
    %Portal{left: left, right: right}
  end

  @doc """
  pushes data to the right in the given 'portal'.
  """
  def push_right(portal)do
    # See if we can pop data from left, if so, push the
    # popped data to the right. Otherwise, do nothing.
    case Portal.Door.pop(portal.left)do
      :error -> :ok
      {:ok, h} -> Portal.Door.push(portal.right, h)

    end
    # let's run the portal itself
    portal
  end
end
