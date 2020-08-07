import axios from 'axios';

export default {
    list(){
        return axios.get('/decks')
    },

    listTrial(){
        return axios.get('/decks/trial')
    },

    addDeck(deck) {
        return axios.post(`/decks/create`, deck)
    }







    

}    