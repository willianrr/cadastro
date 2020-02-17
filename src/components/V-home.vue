<template>
    <div class="container-fluid">
        <div class="row">
            <h1 class="title">Cadastro de Clientes</h1>
        </div>
        <div class="container">
            <div class="menu">
                <div class="button-new">
                    <button class="button" @click="showAddModal=true">
                        <i class="fa fa-plus"></i> Add New User
                    </button>
                </div>
                <hr class="bg-info">
                <div class="alert alert-danger" v-if="errorMsg">
                    {{errorMsg}}
                </div>
                <div class="alert alert-success" v-if="successMsg">
                    {{successMsg}}
                </div>
            </div>
            <div class="lists">
                <table class="table-bordered">
                    <thead>
                    <tr>
                        <td>Nome</td>
                        <td>Data Nascimento</td>
                        <td>Estado</td>
                        <td>Cidade</td>
                        <td>Editar</td>
                        <td>Excluir</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="list in users" :key="list.id">
                        <td>{{list.name}}</td>
                        <td>{{list.birth}}</td>
                        <td>{{list.state}}</td>
                        <td>{{list.city}}</td>
                        <td><a href="#" @click="selectUser(user);"><i class="fa fa-edit edit"></i></a></td>
                        <td><a href="#" @click="showDeleteModal=true"><i class="fa fa-trash remove"></i></a></td>
                    </tr>
                    </tbody>
                </table>
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
                            <form @submit.prevent="addToAPI">
                                <div class="form-group">
                                    <input type="text" name="name"
                                           class="form-control form-control-lg"
                                           placeholder="Nome" v-model="newUser.name"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="dateBirth"
                                           class="form-control form-control-lg"
                                           placeholder="Data de Nascimento" v-model="newUser.birth"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="state" class="form-control form-control-lg"
                                           placeholder="Estado" v-model="newUser.state"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="city" class="form-control form-control-lg"
                                           placeholder="Cidade" v-model="newUser.city"/>
                                </div>
                                <div class="form-group">
                                    <select name="sex" class="form-control form-control-lg" v-model="newUser.sex">
                                        <option value="Masculino">Masculino</option>
                                        <option value="Feminino">Feminino</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="cep" class="form-control form-control-lg"
                                           placeholder="Cep" v-model="newUser.cep"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="address" class="form-control form-control-lg"
                                           placeholder="Endereço" v-model="newUser.address"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="number" class="form-control form-control-lg"
                                           placeholder="Número" v-model="newUser.number"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="complement" class="form-control form-control-lg"
                                           placeholder="Complemento" v-model="newUser.complement"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="district" class="form-control form-control-lg"
                                           placeholder="Bairro" v-model="newUser.district"/>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-info btn-lg">Adicionar Cadastro</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
                
            <div class="overlay" v-if="showDeleteModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Deletar cadastro</h5>
                            <button type="button" class="close" @click="showDeleteModal=false">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body p-4">
                            <form action="#" method="post">
                                <h4 class="text-danger">Você tem certeza que deseja deletar o cadastro ?</h4>
                                <h5>Você esta deletando cadastro 'Willian'.</h5>
                                <hr>
                                <button class="btn btn-danger btn-lg">Sim</button>
                                &nbsp; &nbsp; &nbsp; &nbsp;
                                <button class="btn btn-success btn-lg" @click="showDeleteModal=false">Não</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    const axios = require('axios');
    const api = 'http://localhost:8080/cadastro/src/db/process.php?action=';
    export default {
        name: 'vhome',
        data() {
            return {
                users: [],
                errorMsg: '',
                successMsg: '',
                showAddModal: false,
                showEditModal: false,
                showDeleteModal: false,
                newUser: {
                    name: '',
                    birth: '',
                    state: '',
                    city: '',
                    sex: '',
                    cep: '',
                    address: '',
                    number: '',
                    complement: '',
                    district: ''
                },
                currentUser: {}
            }
        },
        mounted() {
            axios.get(`${api}read`, {}).then((response) => {
                this.users = response.data.list_user;
            });
        },
        methods: {
            addToAPI() {
                let newUsers = {
                    name: this.newUser.name,
                    birth: this.newUser.birth,
                    state: this.newUser.state,
                    city: this.newUser.city,
                    sex: this.newUser.sex,
                    cep: this.newUser.cep,
                    address: this.newUser.address,
                    number: this.newUser.number,
                    complement: this.newUser.complement,
                    district: this.newUser.district
                };
                const formData = new FormData();

                for (const key of Object.keys(newUsers)) {
                    formData.set(key, newUsers[key]);
                }
                axios.post("http://localhost:8080/cadastro/src/db/process.php?action=create", formData)
                    .then((response) => {
                        console.log(response);
                        this.showAddModal= false;
                        location.reload();
                    })
                    .catch((error) => {
                        console.log(error);
                    })
            },
            updateToAPI() {
                let newUsers = {
                    name: this.currentUser.name,
                    birth: this.currentUser.birth,
                    state: this.currentUser.state,
                    city: this.currentUser.city,
                    sex: this.currentUser.sex,
                    cep: this.currentUser.cep,
                    address: this.currentUser.address,
                    number: this.currentUser.number,
                    complement: this.currentUser.complement,
                    district: this.currentUser.district
                };
                const formData = new FormData();

                for (const key of Object.keys(newUsers)) {
                    formData.set(key, newUsers[key]);
                }
                axios.post("http://localhost:8080/cadastro/src/db/process.php?action=update", formData)
                    .then((response) => {
                        console.log(response);
                        this.showEditModal= false;
                        location.reload();
                    })
                    .catch((error) => {
                        console.log(error);
                    })
            },
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

    .title {
        text-align: center;
        color: #fff;
        background-color: #222;
        width: 100%;
        padding: .5rem;
    }

    .menu {
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

                i {
                    color: #fff;

                    &:hover {
                        color: #000;
                    }
                }
            }
        }
    }

    .lists {
        color: #fff;

        .table-bordered {
            width: 100%;
            max-width: 100%;
            margin-bottom: 18px;
            border: 1px solid #ddd;

            thead {
                background-color: #2980b9;
                font-weight: 600;
                font-size: 18px;
            }

            tbody {
                background-color: #c5c5c5;
                color: #000;
                font-weight: 500;
            }

            td {
                padding: 8px;
                line-height: 1.42857;

                a {
                    justify-content: center;
                    display: flex;
                    color: #fff;
                    font-size: 20px;

                    .remove {
                        background-color: red;
                        padding: 4px 6px;
                        border-radius: 4px;

                        &:hover {
                            color: #000;
                        }
                    }

                    .edit {
                        background-color: blue;
                        padding: 4px 6px;
                        border-radius: 4px;
                        justify-content: center;
                    }
                }

            }
        }
    }
</style>
