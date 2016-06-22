from java.lang import *
from java.util import *
from java.awt import *
from java.io import *
from de.usu.s3.api import ApiBOType
from de.gebit.trend.bo.persistence.session.jdbc import *
from java.sql import *

def chkComponent(vIdent, lTransaction):
	objComponent = None
	oBOT = VM.getBOTypes().find("Component")
	cond = "%s == %s " % ("ident", "'" + vIdent + "'")
	components = oBOT.find(lTransaction, cond)
	if components.isOne():
		objComponent = components.getBObject()

	return objComponent


#****************************
#*  ROUTINE PRINCIPALE    *
#****************************

#**** Identifica l'utente connesso, per client (Mandante) e utenza ****
client = S3.getCurrentUser().getCurrentClient().getId()
user = S3.getCurrentUser().getId()
datchg = S3.getFunctionProvider().getCurrentDate()

#campiPrevisti = 7

numeroInserimenti = 0
numeroScarti = 0
numeroTotale = 0
cont = 0
risultato = ""
i = 0
conteggioRighe = 0
numRigheCommit = 1
controlloAggiornamento = None

sac=""
rda=""
sn=""
sua_id=""
flg=""
cod_error=""
ident=""

#**** Scansione tabella di stage ed estrazione dei record da importare
oBOT = S3.getBOTypes().find("StageUpdateAsset")
cond = "flgImport == null && codError == null && usercre == '%s'" % (user)
assetColl = oBOT.getIterator(cond, ApiBOType.IT_COMMIT_ON_COUNT, 1)
while (assetColl.hasNext()):
	sp = transaction.setSyncPoint()
	asset = assetColl.next()
	rda = String(asset.getBOField("rda").getNotNullValue()).trim()
	sac = String(asset.getBOField("sac").getNotNullValue()).trim()
	sn = String(asset.getBOField("serialNumber").getNotNullValue()).trim()
	ident = String(asset.getBOField("ident").getNotNullValue()).trim()
	#**** check Sistema (idPdl); se non esiste, lo crea ****
	Component = chkComponent(ident, transaction)
	if Component is None:
		numeroScarti += 1
		asset.getBOField("flgImport").setValue(Boolean.FALSE)
		asset.getBOField("codError").setValue("Componente non trovato in SAM ITAM (Campo 'Id Componente').")
	elif Component is not None and rda == "" and sac=="" and sn=="":
		numeroScarti += 1
		asset.getBOField("flgImport").setValue(Boolean.FALSE)
		asset.getBOField("codError").setValue("riga vuota")
	elif Component is not None and (rda != "" or sac!="" or sn!=""):
		#**** Aggiornamento del serial number****
		if sn != "":
			Component.getBOField("serialNo").setValue(sn)
		#**** Aggiornamento di rda****
		if rda!= "":
			Component.getBOField("cfldc01").setValue(rda)
         #**** Aggiornamento di sac****
		if sac!= "":
			Component.getBOField("fixedAssetId").setValue(sac)
		#**** Aggiornamento tabella di stage ****
		asset.getBOField("flgImport").setValue(Boolean.TRUE)
		#**** Aggiornamento contatore ****
		numeroInserimenti += 1
	else:
		continue
	numeroTotale += 1
	transaction.doCommitResume()

assetColl.finish()

strResult = " - Asset aggiornati: " + Integer(numeroInserimenti).toString()
if (numeroScarti != 0):
	strResult += " - Asset non aggiornati per errore nei dati: " + Integer(numeroScarti).toString()
strResult += " - Fare riferimento al Catalogo 'StageUpdateAsset'."

_output.put("strResult", strResult)


