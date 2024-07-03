defmodule Kemiskinan.SurveiTest do
  use Kemiskinan.DataCase

  alias Kemiskinan.Survei

  describe "respons" do
    alias Kemiskinan.Survei.Respons

    import Kemiskinan.SurveiFixtures

    @invalid_attrs %{respons: nil}

    test "list_respons/0 returns all respons" do
      respons = respons_fixture()
      assert Survei.list_respons() == [respons]
    end

    test "get_respons!/1 returns the respons with given id" do
      respons = respons_fixture()
      assert Survei.get_respons!(respons.id) == respons
    end

    test "create_respons/1 with valid data creates a respons" do
      valid_attrs = %{respons: "some respons"}

      assert {:ok, %Respons{} = respons} = Survei.create_respons(valid_attrs)
      assert respons.respons == "some respons"
    end

    test "create_respons/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Survei.create_respons(@invalid_attrs)
    end

    test "update_respons/2 with valid data updates the respons" do
      respons = respons_fixture()
      update_attrs = %{respons: "some updated respons"}

      assert {:ok, %Respons{} = respons} = Survei.update_respons(respons, update_attrs)
      assert respons.respons == "some updated respons"
    end

    test "update_respons/2 with invalid data returns error changeset" do
      respons = respons_fixture()
      assert {:error, %Ecto.Changeset{}} = Survei.update_respons(respons, @invalid_attrs)
      assert respons == Survei.get_respons!(respons.id)
    end

    test "delete_respons/1 deletes the respons" do
      respons = respons_fixture()
      assert {:ok, %Respons{}} = Survei.delete_respons(respons)
      assert_raise Ecto.NoResultsError, fn -> Survei.get_respons!(respons.id) end
    end

    test "change_respons/1 returns a respons changeset" do
      respons = respons_fixture()
      assert %Ecto.Changeset{} = Survei.change_respons(respons)
    end
  end
end
