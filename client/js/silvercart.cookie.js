var silvercart = silvercart ? silvercart : [];
silvercart.cookie = function() {
    var property = {},
        selector = {},
        private = {
            getPairs: function()
            {
                return document.cookie.split('; ');
            },
            getKeyValue: function(pair)
            {
                return pair.split('=');
            },
            setPairs: function(pairs)
            {
                document.cookie = pairs.join('; ');
            }
        },
        public = {
            getValue: function (key)
            {
                var fValue = '';
                $(private.getPairs()).each(function(cIndex, cPair) {
                    var cKeyValue = private.getKeyValue(cPair),
                        cKey      = cKeyValue[0],
                        cValue    = cKeyValue[1];
                    if (key === cKey) {
                        fValue = cValue;
                    }
                });
                return fValue;
            },
            setValue: function (key, value)
            {
                document.cookie = key + '=' + value + ';';
            }
        };
    return public;
};