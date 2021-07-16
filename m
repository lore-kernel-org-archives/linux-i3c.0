Return-Path: <SRS0=KHFp=MI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D70AC636CA
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 08:00:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D15A9613ED
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 08:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D15A9613ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5gm3v/DWtX7qcRD4IxL27k0tVDNiUhGsJYwKgGq0gg=; b=3veDoYdhZLF2gZ
	ff/BrqEBXJG3GtfH7zT1lCfWdM5sJtzcsj5HsXj8mxH7vDfeO93mG0BK4UxWRyrkUZ7VmT5MuEC/s
	YGvQ1g2J43m2BDr1ElU3xS/3ckIZtBI5/Cw7FiQf8SCIOoDCv61n66R7755V2onKZApsV48XqYd/t
	ubTbmvj87x3rZ3lkxfcAzCKeIlAGAGgeIhu6nNCLHqd6Y4pdvQ5XvdfYghzCBLLsE19mC3ToCGHCa
	hJ9WjmFK2XNvZ8q5v9fWDgWxOcWxFY5iPdxxUyvaSJDkzCQtHms+/4OpJ+eEPMNSr7+Qn6/TzIDgM
	BdQPQ/cVeWESRyzU1Prw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4IlS-003cq9-CM; Fri, 16 Jul 2021 08:00:06 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4IlP-003cp6-DU
 for linux-i3c@lists.infradead.org; Fri, 16 Jul 2021 08:00:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 23726C0007;
 Fri, 16 Jul 2021 07:59:59 +0000 (UTC)
Date: Fri, 16 Jul 2021 09:59:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 5/5] i3c: master: svc: add runtime pm support
Message-ID: <20210716095958.4e27d574@xps13>
In-Reply-To: <20210716073723.3490180-6-xiaoning.wang@nxp.com>
References: <20210716073723.3490180-1-xiaoning.wang@nxp.com>
 <20210716073723.3490180-6-xiaoning.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_010003_644858_A8D59EB4 
X-CRM114-Status: GOOD (  16.56  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgQ2xhcmssCgoKPiBAQCAtMTQzMSw3ICsxNTAyLDcgQEAgc3RhdGljIGludCBzdmNfaTNjX21h
c3Rlcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJCQkJCSBHRlBfS0VS
TkVMKTsKPiAgCWlmICghbWFzdGVyLT5pYmkuc2xvdHMpIHsKPiAgCQlyZXQgPSAtRU5PTUVNOwo+
IC0JCWdvdG8gZXJyX2Rpc2FibGVfc2NsazsKPiArCQlnb3RvIHJwbV9kaXNhYmxlOwo+ICAJfQo+
ICAKPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIG1hc3Rlcik7Cj4gQEAgLTE0NDIsMTgg
KzE1MTMsMTcgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICAJcmV0ID0gaTNjX21hc3Rlcl9yZWdpc3RlcigmbWFzdGVyLT5i
YXNlLCAmcGRldi0+ZGV2LAo+ICAJCQkJICAmc3ZjX2kzY19tYXN0ZXJfb3BzLCBmYWxzZSk7Cj4g
IAlpZiAocmV0KQo+IC0JCWdvdG8gZXJyX2Rpc2FibGVfc2NsazsKPiArCQlnb3RvIHJwbV9kaXNh
YmxlOwo+ICAKPiAtCXJldHVybiAwOwo+IC0KPiAtZXJyX2Rpc2FibGVfc2NsazoKPiAtCWNsa19k
aXNhYmxlX3VucHJlcGFyZShtYXN0ZXItPnNjbGspOwo+ICsJcG1fcnVudGltZV9tYXJrX2xhc3Rf
YnVzeSgmcGRldi0+ZGV2KTsKPiArCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCZwZGV2LT5k
ZXYpOwo+ICAKPiAtZXJyX2Rpc2FibGVfZmNsazoKPiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZSht
YXN0ZXItPmZjbGspOwo+ICsJcmV0dXJuIDA7Cj4gIAo+IC1lcnJfZGlzYWJsZV9wY2xrOgo+IC0J
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1hc3Rlci0+cGNsayk7CgpJdCdzIG5vdCBjbGVhciB0byBt
ZSB3aHkgeW91IGRyb3AgdGhlIGRpc2FibGVfKmNsayBsYWJlbHMgdG8gbW92ZSB0aGVtCmJhY2sg
aW4gcGxhY2U/IEkgd291bGQgcmF0aGVyIHByZWZlciB0byBrZWVwIGEgY2xlYW4gZXJyb3IgcGF0
aC4KCj4gK3JwbV9kaXNhYmxlOgo+ICsJcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZCgm
cGRldi0+ZGV2KTsKPiArCXBtX3J1bnRpbWVfcHV0X3N5bmMoJnBkZXYtPmRldik7Cj4gKwlwbV9y
dW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7Cj4gIAo+ICAJcmV0dXJuIHJldDsKPiAgfQo+IEBA
IC0xNDY3LDEzICsxNTM3LDU3IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7
Cj4gIAo+ICsJcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZCgmcGRldi0+ZGV2KTsKPiAr
CXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+
ICsKPiArc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdmNfaTNjX3J1bnRpbWVfc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpCj4gK3sKPiArCXN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVy
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gKwo+ICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1h
c3Rlci0+cGNsayk7Cj4gIAljbGtfZGlzYWJsZV91bnByZXBhcmUobWFzdGVyLT5mY2xrKTsKPiAg
CWNsa19kaXNhYmxlX3VucHJlcGFyZShtYXN0ZXItPnNjbGspOwo+ICsJcGluY3RybF9wbV9zZWxl
Y3Rfc2xlZXBfc3RhdGUoZGV2KTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiArc3RhdGlj
IGludCBfX21heWJlX3VudXNlZCBzdmNfaTNjX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikKPiArewo+ICsJc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIgPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2KTsKPiArCWludCByZXQgPSAwOwo+ICsKPiArCXBpbmN0cmxfcG1fc2VsZWN0X2Rl
ZmF1bHRfc3RhdGUoZGV2KTsKPiArCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShtYXN0ZXItPnBj
bGspOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCXJldCA9IGNsa19wcmVw
YXJlX2VuYWJsZShtYXN0ZXItPmZjbGspOwo+ICsJaWYgKHJldCkgewo+ICsJCWNsa19kaXNhYmxl
X3VucHJlcGFyZShtYXN0ZXItPnBjbGspOwo+ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4gKwo+ICsJ
cmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKG1hc3Rlci0+c2Nsayk7Cj4gKwlpZiAocmV0KSB7Cj4g
KwkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1hc3Rlci0+cGNsayk7Cj4gKwkJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKG1hc3Rlci0+ZmNsayk7Cj4gKwkJcmV0dXJuIHJldDsKPiArCX0KPiArCj4gKwly
ZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgc3Zj
X2kzY19wbV9vcHMgPSB7Cj4gKwlTRVRfTk9JUlFfU1lTVEVNX1NMRUVQX1BNX09QUyhwbV9ydW50
aW1lX2ZvcmNlX3N1c3BlbmQsCj4gKwkJCQkgICAgICBwbV9ydW50aW1lX2ZvcmNlX3Jlc3VtZSkK
PiArCVNFVF9SVU5USU1FX1BNX09QUyhzdmNfaTNjX3J1bnRpbWVfc3VzcGVuZCwKPiArCQkJICAg
c3ZjX2kzY19ydW50aW1lX3Jlc3VtZSwgTlVMTCkKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN2Y19pM2NfbWFzdGVyX29mX21hdGNoX3RibFtdID0gewo+ICAJ
eyAuY29tcGF0aWJsZSA9ICJzaWx2YWNvLGkzYy1tYXN0ZXIiIH0sCj4gIAl7IC8qIHNlbnRpbmVs
ICovIH0sCj4gQEAgLTE0ODUsNiArMTU5OSw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIHN2Y19pM2NfbWFzdGVyID0gewo+ICAJLmRyaXZlciA9IHsKPiAgCQkubmFtZSA9ICJzaWx2
YWNvLWkzYy1tYXN0ZXIiLAo+ICAJCS5vZl9tYXRjaF90YWJsZSA9IHN2Y19pM2NfbWFzdGVyX29m
X21hdGNoX3RibCwKPiArCQkucG0gPSAmc3ZjX2kzY19wbV9vcHMsCj4gIAl9LAo+ICB9Owo+ICBt
b2R1bGVfcGxhdGZvcm1fZHJpdmVyKHN2Y19pM2NfbWFzdGVyKTsKClRoYW5rcywKTWlxdcOobAoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
