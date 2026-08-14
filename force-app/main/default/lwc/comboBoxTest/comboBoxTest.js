import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/comboBoxAccount.getAccounts';
import getContacts from '@salesforce/apex/comboBoxAccount.getContacts';

const columns= [
    {label: "Contact Name", fieldName: "Name"},
    {label: "Email", fieldName: "Email"}
]

export default class ComboBoxTest extends LightningElement {
    @track value = '';
    @track accOption =[];
    
    @track cardVisible= false;
    @track data = [];
    @track columns = columns;

    get options()
    {
       return this.accOption;
    }

    connectedCallback()
    {
        getAccounts()
        .then(result =>{
            let arr= [];
            for(var i=0; i<result.length; i++)
            {
                console.log('Result :'+result[i].Name);
               arr.push({label: result[i].Name, value: result[i].Id})
            }
            this.accOption = arr;
        })
        
        .catch(error => {
            console.error(error);
        });
    }

    onHandleChange(event)
    {
        this.cardVisible = true;
        this.value = event.detail.value;
        getContacts({accId : this.value})
        .then(result=>{
            this.data= result;
            console.log('Data : '+JSON.stringify(this.data));
        })
        .catch(error=>{
            window.alert("Error : "+error);
        }
        )
    }
}
