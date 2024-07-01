defmodule KemiskinanWeb.PendudukLiveTest do
  use KemiskinanWeb.ConnCase

  import Phoenix.LiveViewTest
  import Kemiskinan.PenduduksFixtures

  @create_attrs %{kode_unik: "some kode_unik", nik: "some nik", nama: "some nama", tanggal_lahir: "2024-06-30", jenis_kelamin: "some jenis_kelamin", kelurahan: "some kelurahan", kecamatan: "some kecamatan", kota_kab: "some kota_kab"}
  @update_attrs %{kode_unik: "some updated kode_unik", nik: "some updated nik", nama: "some updated nama", tanggal_lahir: "2024-07-01", jenis_kelamin: "some updated jenis_kelamin", kelurahan: "some updated kelurahan", kecamatan: "some updated kecamatan", kota_kab: "some updated kota_kab"}
  @invalid_attrs %{kode_unik: nil, nik: nil, nama: nil, tanggal_lahir: nil, jenis_kelamin: nil, kelurahan: nil, kecamatan: nil, kota_kab: nil}

  defp create_penduduk(_) do
    penduduk = penduduk_fixture()
    %{penduduk: penduduk}
  end

  describe "Index" do
    setup [:create_penduduk]

    test "lists all penduduks", %{conn: conn, penduduk: penduduk} do
      {:ok, _index_live, html} = live(conn, ~p"/penduduks")

      assert html =~ "Listing Penduduks"
      assert html =~ penduduk.kode_unik
    end

    test "saves new penduduk", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/penduduks")

      assert index_live |> element("a", "New Penduduk") |> render_click() =~
               "New Penduduk"

      assert_patch(index_live, ~p"/penduduks/new")

      assert index_live
             |> form("#penduduk-form", penduduk: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#penduduk-form", penduduk: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/penduduks")

      html = render(index_live)
      assert html =~ "Penduduk created successfully"
      assert html =~ "some kode_unik"
    end

    test "updates penduduk in listing", %{conn: conn, penduduk: penduduk} do
      {:ok, index_live, _html} = live(conn, ~p"/penduduks")

      assert index_live |> element("#penduduks-#{penduduk.id} a", "Edit") |> render_click() =~
               "Edit Penduduk"

      assert_patch(index_live, ~p"/penduduks/#{penduduk}/edit")

      assert index_live
             |> form("#penduduk-form", penduduk: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#penduduk-form", penduduk: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/penduduks")

      html = render(index_live)
      assert html =~ "Penduduk updated successfully"
      assert html =~ "some updated kode_unik"
    end

    test "deletes penduduk in listing", %{conn: conn, penduduk: penduduk} do
      {:ok, index_live, _html} = live(conn, ~p"/penduduks")

      assert index_live |> element("#penduduks-#{penduduk.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#penduduks-#{penduduk.id}")
    end
  end

  describe "Show" do
    setup [:create_penduduk]

    test "displays penduduk", %{conn: conn, penduduk: penduduk} do
      {:ok, _show_live, html} = live(conn, ~p"/penduduks/#{penduduk}")

      assert html =~ "Show Penduduk"
      assert html =~ penduduk.kode_unik
    end

    test "updates penduduk within modal", %{conn: conn, penduduk: penduduk} do
      {:ok, show_live, _html} = live(conn, ~p"/penduduks/#{penduduk}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Penduduk"

      assert_patch(show_live, ~p"/penduduks/#{penduduk}/show/edit")

      assert show_live
             |> form("#penduduk-form", penduduk: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#penduduk-form", penduduk: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/penduduks/#{penduduk}")

      html = render(show_live)
      assert html =~ "Penduduk updated successfully"
      assert html =~ "some updated kode_unik"
    end
  end
end
