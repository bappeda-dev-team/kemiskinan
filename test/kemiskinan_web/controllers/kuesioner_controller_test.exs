defmodule KemiskinanWeb.KuesionerControllerTest do
  use KemiskinanWeb.ConnCase

  import Kemiskinan.KeteranganFixtures

  @create_attrs %{jenis: "some jenis", penyedia: "some penyedia", tahun: 42}
  @update_attrs %{jenis: "some updated jenis", penyedia: "some updated penyedia", tahun: 43}
  @invalid_attrs %{jenis: nil, penyedia: nil, tahun: nil}

  describe "index" do
    test "lists all kuesioners", %{conn: conn} do
      conn = get(conn, ~p"/kuesioners")
      assert html_response(conn, 200) =~ "Listing Kuesioners"
    end
  end

  describe "new kuesioner" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/kuesioners/new")
      assert html_response(conn, 200) =~ "New Kuesioner"
    end
  end

  describe "create kuesioner" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/kuesioners", kuesioner: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/kuesioners/#{id}"

      conn = get(conn, ~p"/kuesioners/#{id}")
      assert html_response(conn, 200) =~ "Kuesioner #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/kuesioners", kuesioner: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Kuesioner"
    end
  end

  describe "edit kuesioner" do
    setup [:create_kuesioner]

    test "renders form for editing chosen kuesioner", %{conn: conn, kuesioner: kuesioner} do
      conn = get(conn, ~p"/kuesioners/#{kuesioner}/edit")
      assert html_response(conn, 200) =~ "Edit Kuesioner"
    end
  end

  describe "update kuesioner" do
    setup [:create_kuesioner]

    test "redirects when data is valid", %{conn: conn, kuesioner: kuesioner} do
      conn = put(conn, ~p"/kuesioners/#{kuesioner}", kuesioner: @update_attrs)
      assert redirected_to(conn) == ~p"/kuesioners/#{kuesioner}"

      conn = get(conn, ~p"/kuesioners/#{kuesioner}")
      assert html_response(conn, 200) =~ "some updated jenis"
    end

    test "renders errors when data is invalid", %{conn: conn, kuesioner: kuesioner} do
      conn = put(conn, ~p"/kuesioners/#{kuesioner}", kuesioner: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Kuesioner"
    end
  end

  describe "delete kuesioner" do
    setup [:create_kuesioner]

    test "deletes chosen kuesioner", %{conn: conn, kuesioner: kuesioner} do
      conn = delete(conn, ~p"/kuesioners/#{kuesioner}")
      assert redirected_to(conn) == ~p"/kuesioners"

      assert_error_sent 404, fn ->
        get(conn, ~p"/kuesioners/#{kuesioner}")
      end
    end
  end

  defp create_kuesioner(_) do
    kuesioner = kuesioner_fixture()
    %{kuesioner: kuesioner}
  end
end
