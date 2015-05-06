---
title: Git jest git
author: Michał Bojanowski
output:
  html_document:
    toc: true
    self_contained: true
---







# Wstęp

Praca z git bash.

## Narzędzia

- Zainstalować `git`. (git bash)
- Przydatne aliasy (skróty) dla `git`
  - oglądanie historii

## Źródła

- Książka o gicie



# Repozytorium

Symulacja githuba.

Główne repozytorium projektu


```bash
git init --bare projekt.git
git clone projekt.git
cd projekt
echo "To jest pierwszy plik" > plik1.txt
echo "To jest drugi plik" > plik2.txt
git add plik1.txt plik2.txt
git commit -m "Pierwsze wersje plików"
echo "Gadery poluki" >> plik1.txt
git commit -am "Dopiski"
echo "Siała baba mak" >> plik2.txt
git commit -am "Dopiski o sianiu w drugim pliku"
git push origin master
git log -p
cd ..
rm -rf projekt
```

```
Initialized empty Git repository in /home/mbojan/Documents/projects/howtogit/projekt.git/
Cloning into 'projekt'...
warning: You appear to have cloned an empty repository.
done.
[master (root-commit) 79cfe26] Pierwsze wersje plików
 2 files changed, 2 insertions(+)
 create mode 100644 plik1.txt
 create mode 100644 plik2.txt
[master eb557ac] Dopiski
 1 file changed, 1 insertion(+)
[master 61a19e3] Dopiski o sianiu w drugim pliku
 1 file changed, 1 insertion(+)
To /home/mbojan/Documents/projects/howtogit/projekt.git
 * [new branch]      master -> master
commit 61a19e35e1704f19761d1ab3c1b46220778ff5a1
Author: Michal Bojanowski <michal2992@gmail.com>
Date:   Wed May 6 14:34:28 2015 +0200

    Dopiski o sianiu w drugim pliku

diff --git a/plik2.txt b/plik2.txt
index 8fafd2c..7989cc5 100644
--- a/plik2.txt
+++ b/plik2.txt
@@ -1 +1,2 @@
 To jest drugi plik
+Siała baba mak

commit eb557ac9cde91c91eb59e267272c92a640d7c98a
Author: Michal Bojanowski <michal2992@gmail.com>
Date:   Wed May 6 14:34:28 2015 +0200

    Dopiski

diff --git a/plik1.txt b/plik1.txt
index db998bc..141b8ff 100644
--- a/plik1.txt
+++ b/plik1.txt
@@ -1 +1,2 @@
 To jest pierwszy plik
+Gadery poluki

commit 79cfe2604121d3778ae24ce7599ee9de258a94d7
Author: Michal Bojanowski <michal2992@gmail.com>
Date:   Wed May 6 14:34:28 2015 +0200

    Pierwsze wersje plików

diff --git a/plik1.txt b/plik1.txt
new file mode 100644
index 0000000..db998bc
--- /dev/null
+++ b/plik1.txt
@@ -0,0 +1 @@
+To jest pierwszy plik
diff --git a/plik2.txt b/plik2.txt
new file mode 100644
index 0000000..8fafd2c
--- /dev/null
+++ b/plik2.txt
@@ -0,0 +1 @@
+To jest drugi plik
```





# Praca w pojedynke

Klonujemy za pomocą URL ze strony github.


```bash
git clone projekt.git
# Przy pracy z Github  `projekt.git` wstawiamy odpowiedni URL.
# Powstanie folder `projekt` zawierający następujące pliki:
cd projekt
ls projekt

# 1. edytujemy i zapisujemy
echo "Moja edycja" >> plik1.txt

# 2. komitujemy
git add plik1.txt
git commit -m "Zmieniłem plik1.txt"

# 3. wróc do 1., i tak dalej...
```

Dobre praktyki komitowania:

- Lepiej częściej niż rzadziej.
- Jeżeli to możliwe, i ma sens, komit powinien być jakąś logiczną całością.
- ...

W odpowiednim momencie (gdy zmiany mają być widoczne dla innych, na koniec dnia, etc.)
wypychamy ("push") nasze zmiany z lokalnego repozytorium "upstream", czyli do repozytorium,
które sklonowaliśmy. W tym przypadku `projekt.git`.


```bash
git push origin
```



# Zespołowo: fork - remote - pull request


