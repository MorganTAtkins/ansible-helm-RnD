# 



# Running
```
docker run -it -e ANSIBLE_STDOUT_CALLBACK=debug -v "${HOME}"/.aws:/root/.aws -v "${PWD}":/work -v "${HOME}"/.kube/:/.kube -e KUBECONFIG='/.kube/config' --rm morgantatkins/ansible:helm ansible-playbook -u ubuntu --private-key /data/.ssh/aws/morgan_atkins_key_pair.pem -i hosts aqua-enforcer-helm.yml
```# ansible-helm-RnD
