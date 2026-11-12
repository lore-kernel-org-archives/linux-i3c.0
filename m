Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5696B606A331
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Nov 2026 12:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jV1f6r3z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrVqMMQ9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QxKeh4IBUJMRUSNA8pIiFFPPbgXrd1JGdumqj3Ne2uA=; b=jV1f6r3zwdjPWtWTc91dRxjzbT
	uqBjYOTd9XHQmblKGpvewRYzY/aYsU5QQZPVmcGgL70nukj6BlTbnhTCE+/8atLw3KFcYojbb3ANk
	M6vShu8xsfacgd9zaGeBm5rZTKJs8fzopS/o6uihL4FvEJCJ1BH6b1GxeU/xlk97fYxzA4+aZSSC8
	6IWXNtJz/IigsY51IyhiysOaoW+rDZO+2pVVbsaRcZsiECio31BpqvrlgdWaJ2u6Y1WovrN7ZfZDi
	NTZLGozOX2Pa577PD/+xemujcgZjWFz1CP79Zimy/8PIMm0ETMyNlkLLqhlL/kZtoRqqgnDbK+/6e
	hMjbjnfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUJf-00000009wCc-0G7N;
	Thu, 12 Nov 2026 12:54:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUJe-00000009wC5-10Yg
	for linux-i3c@lists.infradead.org;
	Thu, 12 Nov 2026 12:54:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6668B61CFC;
	Thu, 12 Nov 2026 12:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53C51F00A05;
	Thu, 12 Nov 2026 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794488049;
	bh=SK39DjHY/7ayNkOaPOD1KDfFy8vOW+PD9SYaUj7HteQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QrVqMMQ9qDiePqFG67stPyPX+M034WiICjbO1/XcOokKnTmpac3hcJofpghkBTyny
	 U/xgVMUct/0Tz2EH7/nu8C0DBnWUZTCgcSxVn45ipGS0vtbkW9Oy8K1N1JXJgnMSc4
	 TJY4WjwjztPzr1d4xR0hinQSVKudbZGhBnb0DmSuU2eoAVn3nQPe0hT9OZj6/15vXD
	 UoRufyxoBm16CRvRt0a0CkQLx/WSRF5pmQ+m56ZPBXbWAwSiUxNltDesFVkOTeHzcq
	 B1iLtvJfzKIGNYTftp3X3vcUilunc/chFkij43MrMozOdNZ/EVcYrmlK5TmW5Sq2Rl
	 IzTlXhdCVTFMw==
Message-ID: <sashiko-outbox-211119@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 1/4] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>, linux-i3c@lists.infradead.org, mfd@lists.linux.dev
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, lee@kernel.org
In-Reply-To: <20261112124437.3367252-2-lakshay.piplani@nxp.com>
References: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
 <20261112124437.3367252-2-lakshay.piplani@nxp.com>
Date: Thu, 12 Nov 2026 12:54:08 +0000
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbWZkOiBwM2gyeDR4OiBkdXBs
aWNhdGVkIHByb2JlIGxvZ2ljIGFuZCB1bmFkZHJlc3NlZCBuYW1pbmcKICBmZWVkYmFjawotLQoK
Y29tbWl0IGRhZmNjMWUxMDY3ZDk5NmZjYWI3YTg2NzcwMTI0Njk1YzhiYmY0MzQKQXV0aG9yOiBB
bWFuIEt1bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBhbmRleUBueHAuY29tPgoKbWZkOiBwM2gyeDR4
OiBBZGQgZHJpdmVyIGZvciBOWFAgUDNIMng0eCBpM2MgaHViIGFuZCBvbi1kaWUgcmVndWxhdG9y
CgpUaGlzIGNvbW1pdCBhZGRzIGNvcmUgTUZEIHN1cHBvcnQgZm9yIHRoZSBOWFAgUDNIMng0eCBm
YW1pbHkgb2YgbXVsdGlwb3J0CkkzQyBodWIgZGV2aWNlcyBvdmVyIEkzQyBhbmQgSTJDLgoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvcDNoMjg0MC5jIGIvZHJpdmVycy9tZmQvcDNoMjg0MC5j
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi5jNDg5ODQ0ODIx
NDg3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvbWZkL3AzaDI4NDAuYwoKWyAuLi4g
XQoKPiArc3RhdGljIGludCBwM2gyeDR4X2RldmljZV9wcm9iZV9pM2Moc3RydWN0IGkzY19kZXZp
Y2UgKmkzY2RldikKPiArewo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gaTNjZGV2X3RvX2Rldihp
M2NkZXYpOwo+ICsJc3RydWN0IGkzY19kZXZpY2VfaW5mbyBkZXZpbmZvOwo+ICsJc3RydWN0IHAz
aDJ4NHggKmRkYXRhOwo+ICsJaW50IHJldDsKPiArCj4gKwlpM2NfZGV2aWNlX2dldF9pbmZvKGkz
Y2RldiwgJmRldmluZm8pOwo+ICsJaWYgKEkzQ19QSURfTUFOVUZfSUQoZGV2aW5mby5waWQpICE9
IEkzQ19NQU5VRl9JRF9OWFApCj4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4gKwo+ICsJZGRhdGEgPSBk
ZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmRkYXRhKSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIWRk
YXRhKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsKPiArCXJldCA9IGRldm1fbXV0ZXhfaW5pdChk
ZXYsICZkZGF0YS0+cHJvdGVjdGVkX3JlZ19sb2NrKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJu
IHJldDsKPiArCj4gKwlpM2NkZXZfc2V0X2RydmRhdGEoaTNjZGV2LCBkZGF0YSk7Cj4gKwo+ICsJ
ZGRhdGEtPnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTNjKGkzY2RldiwgJnAzaDJ4NHhfcmVn
bWFwX2NvbmZpZyk7Cj4gKwlpZiAoSVNfRVJSKGRkYXRhLT5yZWdtYXApKQo+ICsJCXJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihkZGF0YS0+cmVnbWFwKSwKPiArCQkJCSAgICAgIkZh
aWxlZCB0byByZWdpc3RlciBIVUIgcmVnbWFwXG4iKTsKPiArCj4gKwkvKiBUaGUgaHViIGNoaWxk
IGRyaXZlciByZXRyaWV2ZXMgaW5mb3JtYXRpb24gZnJvbSBpM2NkZXYuICovCj4gKwlkZGF0YS0+
aTNjZGV2ID0gaTNjZGV2Owo+ICsKPiArCXJldCA9IHAzaDJ4NHhfcmVhZF9udW1fdGFyZ2V0X3Bv
cnRzKGRldiwgZGRhdGEpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCXJl
dCA9IGRldm1fbWZkX2FkZF9kZXZpY2VzKGRldiwgUExBVEZPUk1fREVWSURfQVVUTywKPiArCQkJ
CSAgIHAzaDJ4NHhfZGV2cywgQVJSQVlfU0laRShwM2gyeDR4X2RldnMpLAo+ICsJCQkJICAgTlVM
TCwgMCwgTlVMTCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwg
cmV0LCAiRmFpbGVkIHRvIGFkZCBzdWIgZGV2aWNlc1xuIik7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4g
K30KPiArCj4gK3N0YXRpYyBpbnQgcDNoMng0eF9kZXZpY2VfcHJvYmVfaTJjKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQpCj4gK3sKPiArCXN0cnVjdCBwM2gyeDR4ICpkZGF0YTsKPiArCWludCBy
ZXQ7Cj4gKwo+ICsJZGRhdGEgPSBkZXZtX2t6YWxsb2MoJmNsaWVudC0+ZGV2LCBzaXplb2YoKmRk
YXRhKSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIWRkYXRhKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+
ICsKPiArCXJldCA9IGRldm1fbXV0ZXhfaW5pdCgmY2xpZW50LT5kZXYsICZkZGF0YS0+cHJvdGVj
dGVkX3JlZ19sb2NrKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlpMmNf
c2V0X2NsaWVudGRhdGEoY2xpZW50LCBkZGF0YSk7Cj4gKwo+ICsJZGRhdGEtPnJlZ21hcCA9IGRl
dm1fcmVnbWFwX2luaXRfaTJjKGNsaWVudCwgJnAzaDJ4NHhfcmVnbWFwX2NvbmZpZyk7Cj4gKwlp
ZiAoSVNfRVJSKGRkYXRhLT5yZWdtYXApKQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZjbGll
bnQtPmRldiwgUFRSX0VSUihkZGF0YS0+cmVnbWFwKSwKPiArCQkJCSAgICAgIkZhaWxlZCB0byBy
ZWdpc3RlciBIVUIgcmVnbWFwXG4iKTsKPiArCj4gKwlkZGF0YS0+aTNjZGV2ID0gTlVMTDsKPiAr
Cj4gKwlyZXQgPSBwM2gyeDR4X3JlYWRfbnVtX3RhcmdldF9wb3J0cygmY2xpZW50LT5kZXYsIGRk
YXRhKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlyZXQgPSBkZXZtX21m
ZF9hZGRfZGV2aWNlcygmY2xpZW50LT5kZXYsIFBMQVRGT1JNX0RFVklEX0FVVE8sCj4gKwkJCQkg
ICBwM2gyeDR4X2RldnMsIEFSUkFZX1NJWkUocDNoMng0eF9kZXZzKSwKPiArCQkJCSAgIE5VTEws
IDAsIE5VTEwpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmY2xpZW50
LT5kZXYsIHJldCwgIkZhaWxlZCB0byBhZGQgc3ViIGRldmljZXNcbiIpOwo+ICsKPiArCXJldHVy
biAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGkzY19kZXZpY2VfaWQgcDNoMng0
eF9pM2NfaWRzW10gPSB7Cj4gKwlJM0NfQ0xBU1MoSTNDX0RDUl9IVUIsIE5VTEwpLAo+ICsJeyAv
KiBzZW50aW5lbCAqLyB9LAo+ICt9Owo+ICtNT0RVTEVfREVWSUNFX1RBQkxFKGkzYywgcDNoMng0
eF9pM2NfaWRzKTsKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBwM2gy
eDR4X2kyY19pZF90YWJsZVtdID0gewo+ICsJeyAubmFtZSA9ICJueHAtaTNjLWh1YiIgfSwKPiAr
CXsgLyogc2VudGluZWwgKi8gfQo+ICt9OwoKWyAuLi4gXQoKPiArTU9EVUxFX0RFU0NSSVBUSU9O
KCJOWFAgUDNIMlg0WCBJM0MgSFVCIG11bHRpIGZ1bmN0aW9uIGRyaXZlciIpOwo+ICtNT0RVTEVf
TElDRU5TRSgiR1BMIik7CgpbU2V2ZXJpdHk6IExvd10KQXMgcmVwb3J0ZWQgYnkgTGVlIEpvbmVz
IG9uIHY3IFsxXSwgY291bGQgdGhlIGNvbW1vbiBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZQppbiBw
M2gyeDR4X2RldmljZV9wcm9iZV9pM2MoKSBhbmQgcDNoMng0eF9kZXZpY2VfcHJvYmVfaTJjKCkg
YmUgZmFjdG9yZWQgaW50bwphIHNoYXJlZCBoZWxwZXIgZnVuY3Rpb24gc28gdGhlIGJ1cy1zcGVj
aWZpYyBwcm9iZSBmdW5jdGlvbnMgb25seSBoYW5kbGUgYnVzCnZhbGlkYXRpb24gYW5kIHJlZ21h
cCBpbml0aWFsaXphdGlvbj8KCkluIGFkZGl0aW9uLCBwM2gyeDR4X2kyY19pZF90YWJsZSB1c2Vz
IHRoZSBnZW5lcmljIG5hbWUgIm54cC1pM2MtaHViIiBpbnN0ZWFkCm9mIGEgZGV2aWNlLXNwZWNp
ZmljIG5hbWUsIE1PRFVMRV9ERVNDUklQVElPTiBzdGlsbCByZWZlcnMgdG8gYSAibXVsdGkKZnVu
Y3Rpb24gZHJpdmVyIiwgYW5kIHRoZSBmaWxlIG5hbWVzIHAzaDI4NDAuYyBhbmQgcDNoMjg0MC5o
IGRvIG5vdCBtYXRjaApDT05GSUdfTUZEX1AzSDJYNFggYW5kIHRoZSBwM2gyeDR4IHN5bWJvbCBw
cmVmaXguCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDMyNjExNTg0OC5HTDEx
NDE3MThAZ29vZ2xlLmNvbQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MTExMjEyNDQzNy4zMzY3MjUyLTEtbGFrc2hheS5waXBsYW5p
QG54cC5jb20/cGFydD0xCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWkzYwo=
