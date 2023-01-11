resource "aws_key_pair" "secret-key" {
  key_name   = "secretkey"
  public_key = file("terraform_ssh/secretkey.pub")
}

resource "aws_instance" "vault-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.medium"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.secret-key.key_name
  vpc_security_group_ids = ["sg-023cbc9d654644576"]
  tags = {
    Name    = "Vault-Instance"
    Project = "Vault"
  }

  provisioner "file" {
    source      = "minikube.sh"
    destination = "/tmp/minikube.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/minikube.sh",
      "sudo /tmp/minikube.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("terraform_ssh/secretkey")
    host        = self.public_ip
  }
}
