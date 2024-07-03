defmodule KemiskinanWeb.ResponsControllerTest do
  use KemiskinanWeb.ConnCase

  import Kemiskinan.SurveiFixtures

  @create_attrs %{respons: "some respons"}
  @update_attrs %{respons: "some updated respons"}
  @invalid_attrs %{respons: nil}

  describe "index" do
    test "lists all respons", %{conn: conn} do
      conn = get(conn, ~p"/respons")
      assert html_response(conn, 200) =~ "Listing Respons"
    end
  end

  describe "new respons" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/respons/new")
      assert html_response(conn, 200) =~ "New Respons"
    end
  end

  describe "create respons" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/respons", respons: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/respons/#{id}"

      conn = get(conn, ~p"/respons/#{id}")
      assert html_response(conn, 200) =~ "Respons #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/respons", respons: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Respons"
    end
  end

  describe "edit respons" do
    setup [:create_respons]

    test "renders form for editing chosen respons", %{conn: conn, respons: respons} do
      conn = get(conn, ~p"/respons/#{respons}/edit")
      assert html_response(conn, 200) =~ "Edit Respons"
    end
  end

  describe "update respons" do
    setup [:create_respons]

    test "redirects when data is valid", %{conn: conn, respons: respons} do
      conn = put(conn, ~p"/respons/#{respons}", respons: @update_attrs)
      assert redirected_to(conn) == ~p"/respons/#{respons}"

      conn = get(conn, ~p"/respons/#{respons}")
      assert html_response(conn, 200) =~ "some updated respons"
    end

    test "renders errors when data is invalid", %{conn: conn, respons: respons} do
      conn = put(conn, ~p"/respons/#{respons}", respons: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Respons"
    end
  end

  describe "delete respons" do
    setup [:create_respons]

    test "deletes chosen respons", %{conn: conn, respons: respons} do
      conn = delete(conn, ~p"/respons/#{respons}")
      assert redirected_to(conn) == ~p"/respons"

      assert_error_sent 404, fn ->
        get(conn, ~p"/respons/#{respons}")
      end
    end
  end

  defp create_respons(_) do
    respons = respons_fixture()
    %{respons: respons}
  end
end
