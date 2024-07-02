defmodule KemiskinanWeb.PertanyaanControllerTest do
  use KemiskinanWeb.ConnCase

  import Kemiskinan.KeteranganFixtures

  @create_attrs %{
    pertanyaan: "some pertanyaan",
    konsep: "some konsep",
    metodologi: "some metodologi"
  }
  @update_attrs %{
    pertanyaan: "some updated pertanyaan",
    konsep: "some updated konsep",
    metodologi: "some updated metodologi"
  }
  @invalid_attrs %{pertanyaan: nil, konsep: nil, metodologi: nil}

  describe "index" do
    test "lists all pertanyaans", %{conn: conn} do
      conn = get(conn, ~p"/pertanyaans")
      assert html_response(conn, 200) =~ "Listing Pertanyaans"
    end
  end

  describe "new pertanyaan" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/pertanyaans/new")
      assert html_response(conn, 200) =~ "New Pertanyaan"
    end
  end

  describe "create pertanyaan" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/pertanyaans", pertanyaan: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/pertanyaans/#{id}"

      conn = get(conn, ~p"/pertanyaans/#{id}")
      assert html_response(conn, 200) =~ "Pertanyaan #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/pertanyaans", pertanyaan: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pertanyaan"
    end
  end

  describe "edit pertanyaan" do
    setup [:create_pertanyaan]

    test "renders form for editing chosen pertanyaan", %{conn: conn, pertanyaan: pertanyaan} do
      conn = get(conn, ~p"/pertanyaans/#{pertanyaan}/edit")
      assert html_response(conn, 200) =~ "Edit Pertanyaan"
    end
  end

  describe "update pertanyaan" do
    setup [:create_pertanyaan]

    test "redirects when data is valid", %{conn: conn, pertanyaan: pertanyaan} do
      conn = put(conn, ~p"/pertanyaans/#{pertanyaan}", pertanyaan: @update_attrs)
      assert redirected_to(conn) == ~p"/pertanyaans/#{pertanyaan}"

      conn = get(conn, ~p"/pertanyaans/#{pertanyaan}")
      assert html_response(conn, 200) =~ "some updated pertanyaan"
    end

    test "renders errors when data is invalid", %{conn: conn, pertanyaan: pertanyaan} do
      conn = put(conn, ~p"/pertanyaans/#{pertanyaan}", pertanyaan: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pertanyaan"
    end
  end

  describe "delete pertanyaan" do
    setup [:create_pertanyaan]

    test "deletes chosen pertanyaan", %{conn: conn, pertanyaan: pertanyaan} do
      conn = delete(conn, ~p"/pertanyaans/#{pertanyaan}")
      assert redirected_to(conn) == ~p"/pertanyaans"

      assert_error_sent 404, fn ->
        get(conn, ~p"/pertanyaans/#{pertanyaan}")
      end
    end
  end

  defp create_pertanyaan(_) do
    pertanyaan = pertanyaan_fixture()
    %{pertanyaan: pertanyaan}
  end
end
