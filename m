Return-Path: <SRS0=stO+=MH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952C7C636C8
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jul 2021 22:57:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6061C613AF
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jul 2021 22:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6061C613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teTFeOVIu+u1CwtOM9hpSwmeaQ6/7icu6P0ZHlhDocU=; b=SrS3v/Xjyn7/WB
	snhX6p1lFfV6J7DrT82Dj/I6D2GOBgYMtfNSD0LWpThgfSlkvsjdLJrv0idhNuCp88IUV1XsYZCm6
	nM8ooiNnE8vaMRpuiV65TX6yLxrO2svF1WeGm1FomXqafrw6VKSr4mh/RI2vF/OIlNsCH90EXf7sQ
	Tbe5dCYDdgBrkbVGmWodASRmvgSM+QK3gAr0nLKWGCA4Lo5CLrNd/KCyX/VDyb5l79dChOIVfti7B
	LseeBk6dyl8YhOPH1bN6SOHA+ZS6aWNupZ6ekE++qg3SupImKEMYV372/nYK1eWNqxTZmzT8GFwYL
	A+b/9t/hEkEf2HvwpwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4AIZ-002aZE-NP; Thu, 15 Jul 2021 22:57:43 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4AIX-002aY4-1z
 for linux-i3c@lists.infradead.org; Thu, 15 Jul 2021 22:57:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 8287F1BF205;
 Thu, 15 Jul 2021 22:57:38 +0000 (UTC)
Date: Fri, 16 Jul 2021 00:57:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 vitor.soares@synopsys.com, boris.brezillon@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] i3c: master: svc: set ODSTOP to let I2C device see
 the STOP signal
Message-ID: <20210716005737.49760d66@xps13>
In-Reply-To: <20210715082413.3042149-5-xiaoning.wang@nxp.com>
References: <20210715082413.3042149-1-xiaoning.wang@nxp.com>
 <20210715082413.3042149-5-xiaoning.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_155741_308532_C13D4385 
X-CRM114-Status: GOOD (  15.02  )
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

SGkgQ2xhcmssCgpDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+IHdyb3RlIG9uIFRo
dSwgMTUgSnVsIDIwMjEgMTY6MjQ6MTMKKzA4MDA6Cgo+IElmIHVzaW5nIEkyQy9JM0MgbWl4ZWQg
bW9kZSwgbmVlZCB0byBzZXQgT0RTVE9QLiBPdGhlcndpc2UsIHRoZSBJMkMKPiBkZXZpY2VzIGNh
bm5vdCBzZWUgdGhlIHN0b3Agc2lnbmFsLiBJdCBtYXkgY2F1c2UgbWVzc2FnZSBzZW5kaW5nIGVy
cm9ycy4KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgNyArKysr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJp
dmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBpbmRleCA4OTJlNTdmZWM0YjAuLmIw
NWNjN2Y1MjFlNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0
ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gQEAgLTQ0
OSw3ICs0NDksNyBAQCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX2J1c19pbml0KHN0cnVjdCBp
M2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0pCj4gIAlzdHJ1Y3QgaTNjX2RldmljZV9pbmZvIGluZm8g
PSB7fTsKPiAgCXVuc2lnbmVkIGxvbmcgZmNsa19yYXRlLCBmY2xrX3BlcmlvZF9uczsKPiAgCXVu
c2lnbmVkIGludCBoaWdoX3BlcmlvZF9ucywgb2RfbG93X3BlcmlvZF9uczsKPiAtCXUzMiBwcGJh
dWQsIHBwbG93LCBvZGhwcCwgb2RiYXVkLCBpMmNiYXVkLCByZWc7Cj4gKwl1MzIgcHBiYXVkLCBw
cGxvdywgb2RocHAsIG9kYmF1ZCwgb2RzdG9wLCBpMmNiYXVkLCByZWc7Cj4gIAlpbnQgcmV0Owo+
ICAKPiAgCS8qIFRpbWluZ3MgZGVyaXZhdGlvbiAqLwo+IEBAIC00NzksNiArNDc5LDcgQEAgc3Rh
dGljIGludCBzdmNfaTNjX21hc3Rlcl9idXNfaW5pdChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9s
bGVyICptKQo+ICAJc3dpdGNoIChidXMtPm1vZGUpIHsKPiAgCWNhc2UgSTNDX0JVU19NT0RFX1BV
UkU6Cj4gIAkJaTJjYmF1ZCA9IDA7Cj4gKwkJb2RzdG9wID0gMDsKPiAgCQlicmVhazsKPiAgCWNh
c2UgSTNDX0JVU19NT0RFX01JWEVEX0ZBU1Q6Cj4gIAljYXNlIEkzQ19CVVNfTU9ERV9NSVhFRF9M
SU1JVEVEOgo+IEBAIC00ODcsNiArNDg4LDcgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9i
dXNfaW5pdChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptKQo+ICAJCSAqIGJldHdlZW4g
dGhlIGhpZ2ggYW5kIGxvdyBwZXJpb2QgZG9lcyBub3QgcmVhbGx5IG1hdHRlci4KPiAgCQkgKi8K
PiAgCQlpMmNiYXVkID0gRElWX1JPVU5EX1VQKDEwMDAsIG9kX2xvd19wZXJpb2RfbnMpIC0gMjsK
PiArCQlvZHN0b3AgPSAxOwo+ICAJCWJyZWFrOwo+ICAJY2FzZSBJM0NfQlVTX01PREVfTUlYRURf
U0xPVzoKPiAgCQkvKgo+IEBAIC00OTQsNiArNDk2LDcgQEAgc3RhdGljIGludCBzdmNfaTNjX21h
c3Rlcl9idXNfaW5pdChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptKQo+ICAJCSAqIGNv
bnN0cmFpbnRzIGFzIHRoZSBGTSsgbW9kZS4KPiAgCQkgKi8KPiAgCQlpMmNiYXVkID0gRElWX1JP
VU5EX1VQKDI1MDAsIG9kX2xvd19wZXJpb2RfbnMpIC0gMjsKPiArCQlvZHN0b3AgPSAxOwo+ICAJ
CWJyZWFrOwo+ICAJZGVmYXVsdDoKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiBAQCAtNTAyLDcgKzUw
NSw3IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfYnVzX2luaXQoc3RydWN0IGkzY19tYXN0
ZXJfY29udHJvbGxlciAqbSkKPiAgCXJlZyA9IFNWQ19JM0NfTUNPTkZJR19NQVNURVJfRU4gfAo+
ICAJICAgICAgU1ZDX0kzQ19NQ09ORklHX0RJU1RPKDApIHwKPiAgCSAgICAgIFNWQ19JM0NfTUNP
TkZJR19IS0VFUCgwKSB8Cj4gLQkgICAgICBTVkNfSTNDX01DT05GSUdfT0RTVE9QKDApIHwKPiAr
CSAgICAgIFNWQ19JM0NfTUNPTkZJR19PRFNUT1Aob2RzdG9wKSB8Cj4gIAkgICAgICBTVkNfSTND
X01DT05GSUdfUFBCQVVEKHBwYmF1ZCkgfAo+ICAJICAgICAgU1ZDX0kzQ19NQ09ORklHX1BQTE9X
KHBwbG93KSB8Cj4gIAkgICAgICBTVkNfSTNDX01DT05GSUdfT0RCQVVEKG9kYmF1ZCkgfAoKCgoK
VGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWkzYwo=
