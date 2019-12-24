<template>
    <article>
        <div class="button-new">
            <button class="button" @click="showAddModal=true">
                <i class="fa fa-plus"></i> Add New User
            </button>
        </div>
        <div class="overlay" v-if="showAddModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Adicionar novo cadastro</h5>
                    <button type="button" class="close" @click="showAddModal=false">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body p-4">
                    <form action="#" method="post">
                        <div class="form-group">
                            <input type="text" name="name"
                                   class="form-control form-control-lg"
                                   placeholder="Nome"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="dateBirth"
                                   class="form-control form-control-lg"
                                   placeholder="Data de Nascimento"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="state" class="form-control form-control-lg"
                                   placeholder="Estado"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="city" class="form-control form-control-lg"
                                   placeholder="Cidade"/>
                        </div>
                        <div class="form-group">
                            <select name="sex" class="form-control form-control-lg">
                                <option value="Masculino">Masculino</option>
                                <option value="Feminino">Feminino</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" name="cep" class="form-control form-control-lg" placeholder="Cep"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="address" class="form-control form-control-lg"
                                   placeholder="Endereço"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="number" class="form-control form-control-lg"
                                   placeholder="Número"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="complement" class="form-control form-control-lg"
                                   placeholder="Complemento"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="district" class="form-control form-control-lg"
                                   placeholder="Bairro"/>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-info btn-lg">Adicionar Cadastro</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
        <div class="overlay" v-if="showEditModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Adicionar novo cadastro</h5>
                        <button type="button" class="close" @click="showEditModal=false">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body p-4">
                        <form action="#" method="post">
                            <div class="form-group">
                                <input type="text" name="name"
                                       class="form-control form-control-lg"
                                       placeholder="Nome"/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="dateBirth"
                                       class="form-control form-control-lg"
                                       placeholder="Data de Nascimento"/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="state" class="form-control form-control-lg"
                                       placeholder="Estado"/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="city" class="form-control form-control-lg"
                                       placeholder="Cidade"/>
                            </div>
                            <div class="form-group">
                                <select name="sex" class="form-control form-control-lg">
                                    <option value="Masculino">Masculino</option>
                                    <option value="Feminino">Feminino</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" name="cep" class="form-control form-control-lg" placeholder="Cep"/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="address" class="form-control form-control-lg"
                                       placeholder="Endereço"/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="number" class="form-control form-control-lg"
                                       placeholder="Número"/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="complement" class="form-control form-control-lg"
                                       placeholder="Complemento"/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="district" class="form-control form-control-lg"
                                       placeholder="Bairro"/>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-info btn-lg">Adicionar Cadastro</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </article>
</template>

<script>
    export default {
        name: "V-model",
        data() {
            return {
                showAddModal: false,
                showEditModal: false
            }
        }
    }
</script>

<style scoped lang="scss">
    .overlay {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.6);
    }

    .button-new {
        display: flex;
        justify-content: flex-end;
        cursor: pointer;
        align-items: center;

        .button {
            background-color: green;
            color: #fff;
            padding: .5rem;
            border-radius: 2px;
            border: none;
            i {
                color: #fff;

                &:hover {
                    color: #000;
                }
            }
        }
    }
</style>