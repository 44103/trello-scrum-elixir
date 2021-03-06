defmodule Trial do
  use FaasBase, service: :aws
  alias FaasBase.Logger
  alias FaasBase.Aws.Request
  alias FaasBase.Aws.Response

  @impl FaasBase
  def init(context) do
    # call back one time
    {:ok, context}
  end

  @impl FaasBase
  def handle(%Request{body: body} = request, event, context) do
    Logger.info(request)
    Logger.info(event)
    Logger.info(context)
    {:ok, Response.to_response(body |> String.upcase, %{}, 200)}
  end
end
