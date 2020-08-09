import axios from 'axios';


export default {

list(){
    return axios.get('/cards');
},
listTrialCards(){
    return axios.get('/trial/cards');
},

addCard(card) {
    return axios.post(`/cards/create`, card)
},

update(card, id) {
    return axios.put(`/cards/${id}`, card)
}

}