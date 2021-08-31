// utility functions // math functions

const Util = {

    inherits: function inherit(childClass, parentClass){
        function Surrogate() {};
        Surrogate.prototype = parentClass.prototype;
        childClass.prototype = new Surrogate;
        childClass.prototype.constructor = childClass;
    },

    addVectors: function addvectors(vector1, vector2) {
        return [vector1[0] + vector2[0], vector1[1] + vector2[1]];
    },

    randomVector: function randomVector(length) {
        const deg = 2 * Math.PI * Math.random();
        return Util.scale([Math.sin(deg), Math.cos(deg)], length);
    },

    scale: function scale(vec, m) {
        return [vec[0] * m, vec[1] * m];
    },

    getDistance: function getDistance(vector1, vector2) {
        let res = [vector1[0] - vector2[0], vector1[1] - vector2[1]];
        return Math.sqrt(Math.pow(res[0],2) + Math.pow(res[1],2));
    }

}


module.exports = Util

