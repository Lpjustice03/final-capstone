import axios from 'axios';


export default {

list(){
    return axios.get('/cards');
},

addCard(card) {
    return axios.post(`/cards/create`, card)
}

}