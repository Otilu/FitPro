defmodule FitproWeb.UserRegistrationHTML do
  use FitproWeb, :html

  embed_templates "user_registration_html/*"

  # Add this function to handle form inputs safely
  def input_name(form, field, multiple \\ false) do
    if multiple, do: "#{Phoenix.HTML.Form.input_name(form, field)}[]",
    else: Phoenix.HTML.Form.input_name(form, field)
  end
end
