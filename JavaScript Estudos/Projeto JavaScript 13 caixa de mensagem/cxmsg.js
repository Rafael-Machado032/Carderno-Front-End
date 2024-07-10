class Cxmsg {
    titulo = null   //Atributo de configuração
    texto = null    //Atributo de configuração
    cor = null      //Atributo de configuração
    destino = null  //Atributo de configuração
    divmsg = null   //Atributo de configuração

    constructor(config) {               //Construtor da classe
        this.titulo = config.titulo     //Recebe as configuração externamente
        this.texto = config.texto
        this.cor = config.cor
        this.destino = document.body
    }
    mostrar = () => {       //Métodos da classe
        
        const estilo_divmsg =       //Variável para armazenar o estilo
            " display: flex;" +
            " justify-content: center;" +
            " align-items: center;" +
            " position: absolute;" +
            " top: 0px;" +
            " left: 0px;" +
            " width: 100%;" +
            " height: 100vh;" +
            " background-color: rgba(0,0,0,0.7);" 
        this.divmsg = document.createElement("div")     //criando a div e inserido na variável de propriedade divmsg
        this.divmsg.setAttribute("id","divmsg")         //Setando "id" na div
        this.divmsg.setAttribute("style",estilo_divmsg) //Setando o estilo na div
        this.destino.prepend(this.divmsg)               //Colocar a div no topo do body que esta associado no destino
        
        const estilo_areaCxmsg =       //Variável para armazenar o estilo
            " display: flex;" +
            " justify-content: flex-start;" +
            " align-items: flex-start;" +
            " flex-direction: column;" +
            " width: 300px;" 
        const areaCxmsg = document.createElement("div")     //criando a div e inserido na variável areaCxmsg
        areaCxmsg.setAttribute("style",estilo_areaCxmsg)    //Setando o estilo na div
        this.divmsg.appendChild(areaCxmsg)      //Filho da divmsg

        const estilo_tituloCxmsg =
            " display: flex;" +
            " justify-content: flex-start;" +
            " align-items: center;" +
            " width: 100%;" +
            " background-color: " + this.cor + ";" +
            " color: #fff;" +
            " padding: 5px;" +
            " border-radius: 5px 5px 0px 0px;"
        const tituloCxmsg = document.createElement("div")       //criando a div e inserido na variável tituloCxmsg
        tituloCxmsg.setAttribute("style",estilo_tituloCxmsg)    //Setando o estilo na div
        tituloCxmsg.innerHTML = this.titulo     //Insere conteúdo setado na chamada do objeto
        areaCxmsg.appendChild(tituloCxmsg)      //Filho da div areaCxmsg
    }
    ocultar = () => {       //Métodos da classe

    }
}