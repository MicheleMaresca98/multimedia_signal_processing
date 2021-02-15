Progetto:   Riconoscimento volti

Autori:     Vincenzo Riccardi, Michele Maresca, Marco Russo, Antonino Sposito

Obiettivo:  dato un dataset di 64 immagini per 10 soggetti in diverse
            condizioni di luce, si allena un classificatore in modo da
            associare ad un'immagine di test una label 1:10 che indica
            il soggetto a cui fa riferimento.
            Le feature utilizzate per descrivere le immagini dei soggetti
            sono ottenute applicando l'algoritmo LBP o LTP.
            Gli algoritmi in questione restituiscono l'istogramma dell'intera
            immagine o di blocchi della stessa.
            La funzione di predizione utilizza la chi distance euclidea.

File System:
    - data/              
    | - enhanced_img/       (immagini in uscita dal processo di enhancement)
    | - orginal_img/        (dataset di immagini croppate 192x168)
    | - models/             (contiene il modello allenato con i descrittori delle img)
    | - feature_tables/     (contiene i descrittori delle img di test e di train)
    - src/
    | - enhanchements/      (modulo per fare l'enhancement delle immagini)
    | - feature_extraction/ (modulo per estrarre i descrittori dalle immagini con LTP/LBP)
    | - predicion/          (modulo che date le immagini di test predice le labels)
    | - training/           (modulo per allenare e salvare il classificatore)
    | - utils/              (cartella contenente funzioni di utilità)
    | - config_builder.m    (modulo per generare la configurazione del progetto)

File importanti:
    - src/enhancements/
        -> enhancer.m:
        modulo che per ogni immagine originale ne salva una copia modificata
        nella cartella enhanced. La copia salvata è soggetta a funzioni di 
        gamma_correction.m(), dog_filter() e equalization() che realizzano 
        rispettivamente la correzione gamma, filtro passa banda e equalizzazione.
    - src/feature_extraction/
        -> feature_extractor.m
        modulo che legge tutte le immagini di train e di test opportunamente modificate
        nella fase precedente e ne calcola i descrittori.
        Tale modulo invoca la funzione get_feature_via_lbp(...) o get_feature_via_ltp(...)
        in base al file di configurazione. Il modulo in questione informa
        le funzioni precedenti se il descrittore deve essere globale a tutta l'immagine
        o devono esserci più descrittori per porzioni dell'immagine stessa opportunamente
        concatenati in base al file di configurazione.
    - src/prediction/
        -> predict.m
        modulo che utilizza il classificatore allenato nella fase apposita e gli
        fornisce l'insieme delle immagini di test. Il modulo in questione per ogni
        immagine di test associa una label e calcola la percentuale di successi ottenuta.
    - src/training/
        -> train.m
        modulo che utilizza le immagini di train e le relative label per allenare
        un classificatore nearest neighbor.
    - src/
        -> config_builder.m
        modulo che permette di salvare un file di configurazione (config.mat):
        tale file contiene varie scelte di progetto che possono essere
        modificate a runtime. OSS: per un corretto funzionamento dopo aver modificato
        il file di configurazione è necessario rieseguire tutti i moduli
        relativi alle fasi del progetto partendo dalla feature_extraction.
        In questo file è possibile scegliere:
            - algoritmo                 : LTP/LBP
            - dim blocchi dell'img      : [1,1], [2,2], [3,3] o [4,4]
            - dataset dim per soggetto  : 64 default
            - test dim per soggettto    : 10 default
            - nun_subject               : 10 default