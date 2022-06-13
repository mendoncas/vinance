defmodule Lifinance.ReceiptsTest do
  use Lifinance.DataCase

  alias Lifinance.Receipts

  describe "expenses" do
    alias Lifinance.Receipts.Expense

    import Lifinance.ReceiptsFixtures

    @invalid_attrs %{date: nil, username: nil, value: nil}

    test "list_expenses/0 returns all expenses" do
      expense = expense_fixture()
      assert Receipts.list_expenses() == [expense]
    end

    test "get_expense!/1 returns the expense with given id" do
      expense = expense_fixture()
      assert Receipts.get_expense!(expense.id) == expense
    end

    test "create_expense/1 with valid data creates a expense" do
      valid_attrs = %{date: "some date", username: "some username", value: 120.5}

      assert {:ok, %Expense{} = expense} = Receipts.create_expense(valid_attrs)
      assert expense.date == "some date"
      assert expense.username == "some username"
      assert expense.value == 120.5
    end

    test "create_expense/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Receipts.create_expense(@invalid_attrs)
    end

    test "update_expense/2 with valid data updates the expense" do
      expense = expense_fixture()
      update_attrs = %{date: "some updated date", username: "some updated username", value: 456.7}

      assert {:ok, %Expense{} = expense} = Receipts.update_expense(expense, update_attrs)
      assert expense.date == "some updated date"
      assert expense.username == "some updated username"
      assert expense.value == 456.7
    end

    test "update_expense/2 with invalid data returns error changeset" do
      expense = expense_fixture()
      assert {:error, %Ecto.Changeset{}} = Receipts.update_expense(expense, @invalid_attrs)
      assert expense == Receipts.get_expense!(expense.id)
    end

    test "delete_expense/1 deletes the expense" do
      expense = expense_fixture()
      assert {:ok, %Expense{}} = Receipts.delete_expense(expense)
      assert_raise Ecto.NoResultsError, fn -> Receipts.get_expense!(expense.id) end
    end

    test "change_expense/1 returns a expense changeset" do
      expense = expense_fixture()
      assert %Ecto.Changeset{} = Receipts.change_expense(expense)
    end
  end

  describe "revenues" do
    alias Lifinance.Receipts.Revenue

    import Lifinance.ReceiptsFixtures

    @invalid_attrs %{date: nil, username: nil, value: nil}

    test "list_revenues/0 returns all revenues" do
      revenue = revenue_fixture()
      assert Receipts.list_revenues() == [revenue]
    end

    test "get_revenue!/1 returns the revenue with given id" do
      revenue = revenue_fixture()
      assert Receipts.get_revenue!(revenue.id) == revenue
    end

    test "create_revenue/1 with valid data creates a revenue" do
      valid_attrs = %{date: "some date", username: "some username", value: 120.5}

      assert {:ok, %Revenue{} = revenue} = Receipts.create_revenue(valid_attrs)
      assert revenue.date == "some date"
      assert revenue.username == "some username"
      assert revenue.value == 120.5
    end

    test "create_revenue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Receipts.create_revenue(@invalid_attrs)
    end

    test "update_revenue/2 with valid data updates the revenue" do
      revenue = revenue_fixture()
      update_attrs = %{date: "some updated date", username: "some updated username", value: 456.7}

      assert {:ok, %Revenue{} = revenue} = Receipts.update_revenue(revenue, update_attrs)
      assert revenue.date == "some updated date"
      assert revenue.username == "some updated username"
      assert revenue.value == 456.7
    end

    test "update_revenue/2 with invalid data returns error changeset" do
      revenue = revenue_fixture()
      assert {:error, %Ecto.Changeset{}} = Receipts.update_revenue(revenue, @invalid_attrs)
      assert revenue == Receipts.get_revenue!(revenue.id)
    end

    test "delete_revenue/1 deletes the revenue" do
      revenue = revenue_fixture()
      assert {:ok, %Revenue{}} = Receipts.delete_revenue(revenue)
      assert_raise Ecto.NoResultsError, fn -> Receipts.get_revenue!(revenue.id) end
    end

    test "change_revenue/1 returns a revenue changeset" do
      revenue = revenue_fixture()
      assert %Ecto.Changeset{} = Receipts.change_revenue(revenue)
    end
  end
end
