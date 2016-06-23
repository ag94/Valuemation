from java.lang import *
from java.util import *
from java.awt import *
from java.io import *
from de.usu.s3.api import ApiBOType
from de.gebit.trend.bo.persistence.session.jdbc import *
from java.sql import *

def chkReqitem(vRequisition, vReqitem, lTransaction):
	objReqitem = None
	numLinea = Integer(vReqitem).intValue()
	oBOT = VM.getBOTypes().find("Reqitem")
	cond = "%s == %s " % ("requisition.requisition", "'" + vRequisition + "'")
	cond += " && reqitem == %d " % (numLinea)
	objReqitems = oBOT.find(lTransaction, cond)
	if objReqitems.isOne():
		objReqitem = objReqitems.getBObject()

	return objReqitem


#****************************
#*  ROUTINE PRINCIPALE    *
#****************************

#**** Identifica l'utente connesso, per client (Mandante) e utenza ****
client = S3.getCurrentUser().getCurrentClient().getId()
user = S3.getCurrentUser().getId()
dataCurr = S3.getFunctionProvider().getCurrentDate()
dataMax = S3.getFunctionProvider().getMaxDate()

campiPrevisti = 3

numeroInserimenti = 0
numeroScarti = 0
numeroTotale = 0
cont = 0
risultato = ""
i = 0
conteggioRighe = 0
numRigheCommit = 1
controlloAggiornamento = None
requisition=""
reqitem=""
reqitemstatus=""
#asset è tab stage
# Reqitem è tab di destnazione
#**** Scansione tabella di stage ed estrazione dei record da importare
oBOT = S3.getBOTypes().find("StageUpdateLineRequisition")
cond = "flgImport == null && codError == null && usercre == '%s'" % (user)
assetColl = oBOT.getIterator(cond, ApiBOType.IT_COMMIT_ON_COUNT, 1)
while (assetColl.hasNext()):
	sp = transaction.setSyncPoint()
	asset = assetColl.next()
	requisition = String(asset.getBOField("requisitionId").getNotNullValue()).trim()
	reqitem = asset.getBOField("reqitemId").getNotNullValue()
	reqitemstatus = asset.getBOField("reqitemStatus").getNotNullValue()


	#**** check Richiesta/Linea di Richiesta ****
	Reqitem = chkReqitem(requisition, reqitem, transaction)
	if Reqitem is None:
		numeroScarti += 1
		asset.getBOField("flgImport").setValue(Boolean.FALSE)
		asset.getBOField("codError").setValue("Richiesta non trovata in SAM ITAM (Coppia 'Richiesta/Linea').")
	elif Reqitem.getBOField("reqitemStatus") == "Approvazione Tecnica" and reqitemstatus == "Da evadere":
		Reqitem.getBOField("reqitemStatus").setValue("Da evadere")
		#**** Aggiornamento tabella di stage ****
		asset.getBOField("flgImport").setValue(Boolean.TRUE)
		asset.getBOField("utente").setValue(user)
		asset.getBOField("dataCaricamento").setValue(datchg)
		#**** Aggiornamento contatore ****
		numeroInserimenti += 1

	elif Reqitem.getBOField("reqitemStatus") == "Da evadere" and reqitemstatus == "In Fase di acquisto":
		Reqitem.getBOField("reqitemStatus").setValue("In Fase di acquisto")
		#**** Aggiornamento tabella di stage ****
		asset.getBOField("flgImport").setValue(Boolean.TRUE)
		asset.getBOField("utente").setValue(user)
		asset.getBOField("dataCaricamento").setValue(datchg)
		#**** Aggiornamento contatore ****
		numeroInserimenti += 1
	else:
	    numeroScarti += 1
        asset.getBOField("flgImport").setValue(Boolean.FALSE)
        asset.getBOField("codError").setValue("Aggiornamento non rispetta requisiti")

	numeroTotale += 1
	transaction.doCommitResume()

assetColl.finish()

strResult = " - Richieste aggiornate: " + Integer(numeroInserimenti).toString()
if (numeroScarti != 0):
	strResult += " - Richieste non aggiornate per errore nei dati: " + Integer(numeroScarti).toString()
strResult += " - Fare riferimento al Catalogo 'Tutte le Linee di Richiesta'."

_output.put("strResult", strResult)

