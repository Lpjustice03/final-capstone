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
    },

    update(deck) {
        return axios.put("/decks/update", deck)
    },

    delete(id) {
        return axios.delete(`/decks/${id}`)
    }







    

}    