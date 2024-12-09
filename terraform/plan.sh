export SCW_ACCESS_KEY=SCW0RE865NC7QTDTGPP2
export SCW_SECRET_KEY=8e91d90f-971d-4753-9d43-577dfee9b524
export AWS_ACCESS_KEY_ID=$SCW_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=$SCW_SECRET_KEY

function tfplan {
    echo "terraform plan"
    terraform init
    terraform plan
}

function tfapply {
    echo "terraform apply"
    terraform init
    terraform apply -auto-approve
}

function tfdestroy {
    echo "terraform destroy"
    terraform destroy
}




op=$1
if [[ "${op}" == "apply" ]]; then
  tfapply
elif [[ "${op}" == "destroy" || "${op}" == "delete" ]]; then
  tfdestroy
elif [[ "${op}" == "plan" ]]; then
    tfplan
else
  echo "Commande:"
  echo "- apply: applique le terraform"
  echo "- destroy: destroy le terraform"
  echo ""
fi

# terraform init
# terraform plan
# terraform apply -auto-approve
# terraform apply -auto-approve
# # terraform plan -out plan.out





# terraform destroy