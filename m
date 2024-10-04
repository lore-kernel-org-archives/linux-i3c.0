Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D34BCF8840
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Oct 2024 17:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SskK06vOx7oY8mUS1UjnKsxoMwYMel59k1Gswju7KHY=; b=A+CzwXwkw8j3Fl
	f0GaJNfYbg2FGdgX+RLA0nr0JBuYH8AHM6olC2ONJFwsGMVeT/8gU67NBTJgoT051COV349XO9T2s
	cBWnu/nqrvt6VMWf67cu3BSC4/53PBR2Hr1p1yNyWBcX1KmkKYukwzY0GazcDaiR0/o2XtE8BYJWm
	ELPVO3m5qDPoAOSQx076JCbHdCYjfjQHoR79y4KXg1H+9UY14AhK5Q8yR70Ni8ff8kGBuREZ95xFm
	psnfgZhQLZmfEf7oIJ8wrhX4MpHNa0YVFxmbyzdOfa07CNu+7sHgt1yVrocsZrOZiZNoEm7uypHut
	692QjWnt9femmduHTmOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swlqx-0000000DScy-08f8;
	Fri, 04 Oct 2024 17:12:31 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swl4e-0000000DEUm-08gU
	for linux-i3c@lists.infradead.org;
	Fri, 04 Oct 2024 16:22:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25ADF4000B;
	Fri,  4 Oct 2024 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728058953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RFJZiZ70kuhVJM7CKPrrjtdjJ4PTniafhKm6S3phoZQ=;
	b=hJl5Z07e9oxr1TwZw9Ch9RBk7tos3r+M+r5M51lvHnaDYMyG5qfg/OdFfiapl3YMYVAsRs
	xxy/G9yTIvQCHQsdKY7PCEWeDq+Qx41KjYQO2oVbjPJd2DT+p85F2dHKTv2EdIiP6GdgM/
	k5c2/DPV+7wlauVCGZJLGIzA38tslBs0LugAls/cD9wk2f+7wTOkrsqsgbC+3dyk4YOw3w
	eWHsnIw5UXBzawSsxf0ijIPAbd0J4Vv7KLKNz71Q0YkjBLhcsBo4Ao7ngIZjCiVKw2mMZb
	o11z7oLOAnv0KvQVgLIxmN+3mtdsgZFxDAeRKr379QSdlEMMTIf8zTg+ej07ZQ==
Date: Fri, 4 Oct 2024 18:22:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 bbrezillon@kernel.org, boris.brezillon@collabora.com,
 conor.culhane@silvaco.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 pthombar@cadence.com, ravindra.yashvant.shinde@nxp.com
Subject: Re: [PATCH v6 2/3] i3c: master: Extend address status bit to 4 and
 add I3C_ADDR_SLOT_EXT_DESIRED
Message-ID: <20241004182229.6e08d02c@xps-13>
In-Reply-To: <ZwAHziElHUR7ZdKS@lizhi-Precision-Tower-5810>
References: <20241003-i3c_dts_assign-v6-0-eae2569c92ca@nxp.com>
	<20241003-i3c_dts_assign-v6-2-eae2569c92ca@nxp.com>
	<20241004092914.42701e56@xps-13>
	<ZwAHziElHUR7ZdKS@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_092236_225672_9F0D989B 
X-CRM114-Status: GOOD (  12.04  )
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

SGkgRnJhbmssCgo+ID4gPiBAQCAtMTkxOCw5ICsxOTU5LDEwIEBAIHN0YXRpYyBpbnQgaTNjX21h
c3Rlcl9idXNfaW5pdChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIpCj4gPiA+
ICAJCQlnb3RvIGVycl9yc3RkYWE7Cj4gPiA+ICAJCX0KPiA+ID4KPiA+ID4gLQkJaTNjX2J1c19z
ZXRfYWRkcl9zbG90X3N0YXR1cygmbWFzdGVyLT5idXMsCj4gPiA+IC0JCQkJCSAgICAgaTNjYm9h
cmRpbmZvLT5pbml0X2R5bl9hZGRyLAo+ID4gPiAtCQkJCQkgICAgIEkzQ19BRERSX1NMT1RfSTND
X0RFVik7Cj4gPiA+ICsJCWkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXNfbWFzaygmbWFzdGVy
LT5idXMsCj4gPiA+ICsJCQkJCQkgaTNjYm9hcmRpbmZvLT5pbml0X2R5bl9hZGRyLAo+ID4gPiAr
CQkJCQkJIEkzQ19BRERSX1NMT1RfSTNDX0RFViB8IEkzQ19BRERSX1NMT1RfRVhUX0RFU0lSRUQs
Cj4gPiA+ICsJCQkJCQkgSTNDX0FERFJfU0xPVF9FWFRfU1RBVFVTX01BU0spOyAgCj4gPgo+ID4g
SG93ZXZlciBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoZSB1c2Ugb2YgdGhlCj4gPiBzZXRf
YWRkcl9zbG90X3N0YXR1c19tYXNrKCkgZnVuY3Rpb24uIENhbid0IHdlIGp1c3QgdXNlIHRoZSBu
b3JtYWwKPiA+IGZ1bmN0aW9uIGFuZCBqdXN0IGV4dGVuZCB0aGUgbWFzayBpbiB0aGUgZmlzdCBw
bGFjZT8gIAo+IAo+IFRoZSBtYWpvciBwdXJwb3NlIG9mIHNldF9hZGRyX3Nsb3Rfc3RhdHVzX21h
c2soKSBpcyB0aGF0IHJlZHVjZSBjb2RlCj4gY2hhbmdlLiBUaGVyZSBhcmUgYWxyZWFkeSBhZGRy
ZXNzIGFsbG9jL2ZyZWUgYnkgdXNpbmcgSTNDX0FERFJfU0xPVF9GUkVFLgo+IAo+IHdlIGRvbid0
IHdhbnQgaTNjX2J1c19zZXRfYWRkcl9zbG90X3N0YXR1cygpIHRvdWNoIGJpdAo+IEkzQ19BRERS
X1NMT1RfRVhUX0RFU0lSRUQgc2luY2UgaXQgd2FzIGluaXQgYXQgc2NhbiBkdHMuCgpJIGFncmVl
LCBidXQgaW4gZ2VuZXJhbCB5b3Ugd2lsbCBuZXZlciByZW1vdmUgYW55ICJkZXNpcmVkIiBzbG90
LCBzbwp0aGUgInNldCBzdGF0dXMiLCBiZXNpZGVzIGF0IGluaXQgdGltZSwgc2hvdWxkIG5ldmVy
IHRvdWNoIHRoZXNlIGV4dHJhCmJpdHM/Cgo+IFRoZXJlIGFyZSAxOCBwbGFjZSwgdXNpbmcgaTNj
X2J1c19zZXRfYWRkcl9zbG90X3N0YXR1cygpLCBidXQgd2Ugb25seSBuZWVkCj4gdG91Y2ggSTND
X0FERFJfU0xPVF9FWFRfREVTSVJFRCBiaXQgd2hlbiBzY2FuIGR0cy4KPiAKClRoYW5rcywKTWlx
dcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1p
M2MK
