class Login {

    static logado = false;
    static matlogado = null;
    static nomelogado = null;
    static acessologado = null;
    static estilocss = null;
    static config = {
        cor: "#048",
        img: "./logo.jpg"
    };
    static endpoint = "https://ea5e330f-3e67-46f7-96a3-4e29209807d2-00-1rhphb7s2ac4p.riker.replit.dev/"

    static login = ( mat, pas, config = null ) => {
        if (config!=null) {
            this.config = config;
        }
        
        this.endpoint += `?matricula=${mat}&senha=${pas}`;
        this.estilocss =
            ".fundologin{ display: flex; justify-content: center; align-items: center; width: 100%; height: 100vh; position: absolute; top: 0px; left: 0px; background-color: rgba(0, 0, 0, 0.75); box-sizing: border-box; }" +
            ".baselogin{ display: flex; justify-content: center; align-items: stretch;width: 50%; box-sizing: inherit; }" +
            ".elementoslogin{ display: flex;justify-content: center;align-items: flex-start; flex-direction: column; width: 50%; background-color: #eee; padding: 10px; border-radius: 10px 0px 0px 10px; box-sizing: inherit; }" +
            ".logologin{ display: flex; justify-content: center; align-items: center; width: 50%;background-color: #bbb; padding: 10px; border-radius: 0px 10px 10px 0px; box-sizing: inherit; }" +
            ".logologin img{ width: 40%; box-sizing: inherit;}" +
            ".campologin{ display: flex; justify-content: flex-start;align-items: flex-start;flex-direction: column; box-sizing: inherit; margin-bottom: 10px; }" +
            ".campologin label{ font-size: 18px; }"+
            ".campologin input{ font-size: 18px; padding: 5px;background-color: #fff;border-radius: 5px;}" +
            ".botoeslogin{ display: flex;justify-content: space-around; align-items: center; width: 100%;box-sizing: inherit; }" +
            `.botoeslogin button{ cursor: pointer; background-color: ${this.config}; color: #fff; border-radius: 5px; padding: 10px; width: 100px; box-sizing: inherit; }`
        
            const styleestilo = document.createElement("style");
            styleestilo.setAttribute("id","id_estilologin");
            styleestilo.setAttribute("rel","stylesheet");
            styleestilo.setAttribute("type","text/css");
            styleestilo.innerHTML = this.estilocss;
            document.head.appendChild(styleestilo);

            const corpo = document.body;

            const fundologin = document.createElement("div");
            fundologin.setAttribute("id","fundologin");
            fundologin.setAttribute("class","fundologin");
            document.body.prepend(fundologin);

            const baselogin = document.createElement("div");
            baselogin.setAttribute("id","baselogin");
            baselogin.setAttribute("class","baselogin");
            fundologin.appendChild(baselogin);
            
            const elementoslogin = document.createElement("div");
            elementoslogin.setAttribute("id","elementoslogin");
            elementoslogin.setAttribute("class","elementoslogin");
            baselogin.appendChild(elementoslogin);

            const campologinusername = document.createElement("div");
            campologinusername.setAttribute("id","campologinusername");
            campologinusername.setAttribute("class","campologin");
            elementoslogin.appendChild(campologinusername);

            const labelusername = document.createElement("label");
            labelusername.innerHTML = "User Name:"
            campologinusername.appendChild(labelusername);

            const inputusername = document.createElement("input");
            inputusername.setAttribute("id","f_username");
            inputusername.setAttribute("type","text");
            inputusername.setAttribute("name","f_username");
            campologinusername.appendChild(inputusername);

            const campologinsenha = document.createElement("div");
            campologinsenha.setAttribute("id","campologinsenha");
            campologinsenha.setAttribute("class","campologin");
            elementoslogin.appendChild(campologinsenha);

            const labelsenha = document.createElement("label");
            labelsenha.innerHTML = "Senha:"
            campologinsenha.appendChild(labelsenha);

            const inputsenha = document.createElement("input");
            inputsenha.setAttribute("id","f_senha");
            inputsenha.setAttribute("type","password");
            inputsenha.setAttribute("name","f_senha");
            campologinsenha.appendChild(inputsenha);

            const botoeslogin = document.createElement("div");
            botoeslogin.setAttribute("id","botoeslogin");
            elementoslogin.appendChild(botoeslogin);

            const btn_login = document.createElement("button");
            btn_login.setAttribute("id","btn_login");
            btn_login.innerHTML = "Login"
            elementoslogin.appendChild(btn_login);
           
            const btn_cancelar = document.createElement("button");
            btn_cancelar.setAttribute("id","btn_login");
            btn_cancelar.innerHTML = "Cancelar"
            elementoslogin.appendChild(btn_cancelar);

            const logologin = document.createElement("div");
            logologin.setAttribute("id","logologin");
            logologin.setAttribute("class","logologin");
            baselogin.appendChild(logologin);
           
            const img_logologin = document.createElement("img");
            img_logologin.setAttribute("src",this.config.img);
            img_logologin.setAttribute("title","Tela Login");
            logologin.appendChild(img_logologin);
           
            
        //     fetch(this.endpoint)
        //     .then(res => res.json())
        //     .then(res => {
        //         if (res) {
        //             this.logado = true;
        //             this.matlogado = mat;
        //             this.nomelogado = res.nome;
        //             this.acessologado = res.acesso;
        //             console.log(res);
        //         }else{
        //             console.log("Usuário não encontrado");
        //         }

        //     })
        // }
    }
}
export { Login }