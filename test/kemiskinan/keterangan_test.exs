defmodule Kemiskinan.KeteranganTest do
  use Kemiskinan.DataCase

  alias Kemiskinan.Keterangan

  describe "kuesioners" do
    alias Kemiskinan.Keterangan.Kuesioner

    import Kemiskinan.KeteranganFixtures

    @invalid_attrs %{jenis: nil, penyedia: nil, tahun: nil}

    test "list_kuesioners/0 returns all kuesioners" do
      kuesioner = kuesioner_fixture()
      assert Keterangan.list_kuesioners() == [kuesioner]
    end

    test "get_kuesioner!/1 returns the kuesioner with given id" do
      kuesioner = kuesioner_fixture()
      assert Keterangan.get_kuesioner!(kuesioner.id) == kuesioner
    end

    test "create_kuesioner/1 with valid data creates a kuesioner" do
      valid_attrs = %{jenis: "some jenis", penyedia: "some penyedia", tahun: 42}

      assert {:ok, %Kuesioner{} = kuesioner} = Keterangan.create_kuesioner(valid_attrs)
      assert kuesioner.jenis == "some jenis"
      assert kuesioner.penyedia == "some penyedia"
      assert kuesioner.tahun == 42
    end

    test "create_kuesioner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Keterangan.create_kuesioner(@invalid_attrs)
    end

    test "update_kuesioner/2 with valid data updates the kuesioner" do
      kuesioner = kuesioner_fixture()
      update_attrs = %{jenis: "some updated jenis", penyedia: "some updated penyedia", tahun: 43}

      assert {:ok, %Kuesioner{} = kuesioner} = Keterangan.update_kuesioner(kuesioner, update_attrs)
      assert kuesioner.jenis == "some updated jenis"
      assert kuesioner.penyedia == "some updated penyedia"
      assert kuesioner.tahun == 43
    end

    test "update_kuesioner/2 with invalid data returns error changeset" do
      kuesioner = kuesioner_fixture()
      assert {:error, %Ecto.Changeset{}} = Keterangan.update_kuesioner(kuesioner, @invalid_attrs)
      assert kuesioner == Keterangan.get_kuesioner!(kuesioner.id)
    end

    test "delete_kuesioner/1 deletes the kuesioner" do
      kuesioner = kuesioner_fixture()
      assert {:ok, %Kuesioner{}} = Keterangan.delete_kuesioner(kuesioner)
      assert_raise Ecto.NoResultsError, fn -> Keterangan.get_kuesioner!(kuesioner.id) end
    end

    test "change_kuesioner/1 returns a kuesioner changeset" do
      kuesioner = kuesioner_fixture()
      assert %Ecto.Changeset{} = Keterangan.change_kuesioner(kuesioner)
    end
  end
end
