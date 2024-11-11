from datetime import datetime

tasks = []


def add_task(tasks: list, **kwargs: dict) -> dict:
    """
    Adiciona uma nova tarefa à lista de tarefas.

    Args:
        tasks (list): Lista de tarefas.
        **kwargs (dict): Parâmetros da tarefa (id, descrição, status).

    Returns:
        dict: A tarefa adicionada.
    """

    task_id_list = []

    if len(tasks) == 0:
        kwargs["_id"] = len(tasks) + 1
        tasks.append(kwargs)
        return kwargs
    else:
        for task in tasks:
            task_id_list.append(task["_id"])

        task_id_list = sorted(task_id_list)

        kwargs["_id"] = task_id_list[-1] + 1
        tasks.append(kwargs)
        print("\nTarefa adicionada com sucesso!")
        return kwargs


def read_tasks(tasks: list):
    """
    Exibe todas as tarefas e suas respectivas informações.
    Args:
        tasks (list): Uma lista de tarefas.
    """
    if not tasks:
        print("\nNão há nenhuma tarefa.")
        return
    for task in tasks:
        print(f"\nID: {task['_id']}")
        print(f"Descrição: {task['Descrição']}")
        print(f"Status: {task['Status']}")
        print(f"Data: {task['Data']}")


def complete_task(tasks: list, task_id: int):
    """
    Marca uma tarefa conforme seu ID como concluída.

    Args:
        tasks (list): Lista de tarefas.
        task_id (int): ID da tarefa a ser marcada como concluída.
    """
    for task in tasks:
        if task["_id"] == task_id:
            task["Status"] = "CONCLUÍDA"
            print(f"\nTarefa {task['Descrição']} concluída.")
            return
        else:
            print("\nTarefa não encontrada.")


def delete_task(tasks: list, task_id: int):
    """
    Deleta uma tarefa da lista.

    Args:
        tasks (list): Lista de tarefas.
        task_id (int): ID da tarefa a ser removida.
    """
    founded_task = [task for task in tasks if task["_id"] == task_id]
    if founded_task:
        tasks.remove(founded_task[0])
        print(
            f"\nTarefa {founded_task[0]['Descrição']} -  ID {founded_task[0]['_id']} deletada com sucesso."
        )
    else:
        print("\nTarefa não encontrada.")


def options_menu():
    """
    Exibe o menu de opções e executa as operações escolhidas pelo usuário.
    """
    while True:
        print("\nTP1 - Sistema de gestão de tarefas:")
        print("1.) Adicionar tarefa")
        print("2.) Listar tarefas")
        print("3.) Marcar tarefa como 'concluída'")
        print("4.) Remover tarefa")
        print("5.) Sair")

        choice = input("Digite o número da opção desejada: ")

        if choice == "1":
            description = input("\nDigite a descrição da tarefa: ")
            status = "pendente"
            date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            add_task(
                tasks, Descrição=description.upper(), Status=status.upper(), Data=date
            )

        elif choice == "2":
            read_tasks(tasks)

        elif choice == "3":
            try:
                task_id = int(
                    input("\nDigite o ID da tarefa que será marcada como concluída: ")
                )
                complete_task(tasks, task_id)
            except ValueError:
                print("Favor inserir um ID válido.")

        elif choice == "4":
            try:
                task_id = int(input("\nDigite o ID da tarefa a ser deletada: "))
                delete_task(tasks, task_id)
            except ValueError:
                print("Favor inserir um ID válido.")

        elif choice == "5":
            print("\nPrograma finalizado.")
            break
        else:
            print("\nOpção inválida. Tente novamente.")


options_menu()
