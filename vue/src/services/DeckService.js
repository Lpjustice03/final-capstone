import axios from 'axios';

export default {
    list(){
        return axios.get('/decks')
    },

    addDeck(deck) {
        return axios.post(`/decks/create`, deck)
    }







    

}    