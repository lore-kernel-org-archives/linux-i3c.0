Return-Path: <SRS0=stO+=MH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AB4C636C8
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jul 2021 22:56:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03767613D4
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jul 2021 22:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03767613D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urAE8oEBY8lmsXzTRU/P7U8/6XOKnheVAxHyaCCeiik=; b=wvZt4J7Yud6ULf
	iw+LGvBK2OVchmHQMGRzKjkRZ5yQA48TKZ9+iYV0sdgFXN43VWcfSh4rX1IQ1/9iRDxtZX+jEHtqJ
	N2XeUENh7wI8YEANDXrtYdw7OXhQ5MdD4yFWlab09nXSPRnPm5usSHshgYpbrBX2YmN400g6kL38L
	OKL7B7iPm6q89uZ2aWIPT1Ef+ANP69t+G0EqZ2iUgFgwcFplS9rwoZuI3lB6DF8j5pWejYLdXz29J
	LZxiVcBMcHFfmQtWTaqP+TDYxv8AChPPP1HIk7MY8Xpa1MgkvWeZkfdYNo48JAkv9H57iVhMT6mAH
	f5QPepAJJikp6GQoCA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4AGu-002a8E-AH; Thu, 15 Jul 2021 22:56:00 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4AGp-002a5g-At
 for linux-i3c@lists.infradead.org; Thu, 15 Jul 2021 22:55:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 23C041BF204;
 Thu, 15 Jul 2021 22:55:53 +0000 (UTC)
Date: Fri, 16 Jul 2021 00:55:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 vitor.soares@synopsys.com, boris.brezillon@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] i3c: master: svc: add support for slave to stop
 returning data
Message-ID: <20210716005552.6078c7eb@xps13>
In-Reply-To: <20210715082413.3042149-4-xiaoning.wang@nxp.com>
References: <20210715082413.3042149-1-xiaoning.wang@nxp.com>
 <20210715082413.3042149-4-xiaoning.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_155555_741544_E3AEBC0A 
X-CRM114-Status: GOOD (  20.42  )
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
dSwgMTUgSnVsIDIwMjEgMTY6MjQ6MTIKKzA4MDA6Cgo+IFdoZW4gaTNjIGNvbnRyb2xsZXIgcmVh
ZHMgZGF0YSBmcm9tIHNsYXZlIGRldmljZSwgc2xhdmUgZGV2aWNlIGNhbiBzdG9wCj4gcmV0dXJu
aW5nIGRhdGEgd2l0aCBhbiBBQ0sgYWZ0ZXIgYW55IGJ5dGUuCj4gQWRkIHRoaXMgc3VwcG9ydCBm
b3Igc3ZjIGkzYyBjb250cm9sbGVyLiBPdGhlcndpc2UsIGl0IHdpbGwgZ28gVElNRU9VVAo+IGVy
cm9yIHBhdGggd2hlbiB0aGUgc2xhdmUgZGV2aWNlIGVuZHMgdGhlIHJlYWQgb3BlcmF0aW9uIGVh
cmx5LgoKSXMgdGhpcyBwYXJ0IG9mIHRoZSBJM0Mgc3BlY2lmaWNhdGlvbj8gSSBhbSBub3QgYXdh
cmUgYWJvdXQgaXQuCgo+IFNpZ25lZC1vZmYtYnk6IENsYXJrIFdhbmcgPHhpYW9uaW5nLndhbmdA
bnhwLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCAy
OCArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9t
YXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rl
ci5jCj4gaW5kZXggOWQ4MDQzNTYzOGVhLi44OTJlNTdmZWM0YjAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+IEBAIC04NjUsNyArODY1LDcgQEAgc3RhdGljIGludCBzdmNf
aTNjX21hc3Rlcl9yZWFkKHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyLAo+ICAJCQkgICAg
ICAgdTggKmluLCB1bnNpZ25lZCBpbnQgbGVuKQo+ICB7Cj4gIAlpbnQgb2Zmc2V0ID0gMCwgaSwg
cmV0Owo+IC0JdTMyIG1kY3RybDsKPiArCXUzMiBtZGN0cmwsIG1zdGF0dXM7Cj4gIAo+ICAJd2hp
bGUgKG9mZnNldCA8IGxlbikgewo+ICAJCXVuc2lnbmVkIGludCBjb3VudDsKPiBAQCAtODc0LDgg
Kzg3NCwxNSBAQCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX3JlYWQoc3RydWN0IHN2Y19pM2Nf
bWFzdGVyICptYXN0ZXIsCj4gIAkJCQkJIG1kY3RybCwKPiAgCQkJCQkgIShtZGN0cmwgJiBTVkNf
STNDX01EQVRBQ1RSTF9SWEVNUFRZKSwKPiAgCQkJCQkgMCwgMTAwMCk7Cj4gLQkJaWYgKHJldCkK
PiAtCQkJcmV0dXJuIHJldDsKPiArCQlpZiAocmV0KSB7Cj4gKwkJCXJldCA9IHJlYWRsX3BvbGxf
dGltZW91dChtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01TVEFUVVMsCj4gKwkJCQkgbXN0YXR1cywg
U1ZDX0kzQ19NU1RBVFVTX0NPTVBMRVRFKG1zdGF0dXMpLAo+ICsJCQkJIDAsIDEwMDApOwo+ICsJ
CQlpZiAocmV0KQo+ICsJCQkJcmV0dXJuIHJldDsKPiArCQkJZWxzZQo+ICsJCQkJcmV0dXJuIG9m
ZnNldDsKPiArCQl9Cj4gIAo+ICAJCWNvdW50ID0gU1ZDX0kzQ19NREFUQUNUUkxfUlhDT1VOVCht
ZGN0cmwpOwo+ICAJCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKQo+IEBAIC04ODQsNyArODkx
LDcgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9yZWFkKHN0cnVjdCBzdmNfaTNjX21hc3Rl
ciAqbWFzdGVyLAo+ICAJCW9mZnNldCArPSBjb3VudDsKPiAgCX0KPiAgCj4gLQlyZXR1cm4gMDsK
PiArCXJldHVybiBvZmZzZXQ7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJf
d3JpdGUoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIsCj4gQEAgLTkxNyw3ICs5MjQsNyBA
QCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX3dyaXRlKHN0cnVjdCBzdmNfaTNjX21hc3RlciAq
bWFzdGVyLAo+ICBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX3hmZXIoc3RydWN0IHN2Y19pM2Nf
bWFzdGVyICptYXN0ZXIsCj4gIAkJCSAgICAgICBib29sIHJudywgdW5zaWduZWQgaW50IHhmZXJf
dHlwZSwgdTggYWRkciwKPiAgCQkJICAgICAgIHU4ICppbiwgY29uc3QgdTggKm91dCwgdW5zaWdu
ZWQgaW50IHhmZXJfbGVuLAo+IC0JCQkgICAgICAgdW5zaWduZWQgaW50IHJlYWRfbGVuLCBib29s
IGNvbnRpbnVlZCkKPiArCQkJICAgICAgIHVuc2lnbmVkIGludCAqcmVhZF9sZW4sIGJvb2wgY29u
dGludWVkKQo+ICB7Cj4gIAl1MzIgcmVnOwo+ICAJaW50IHJldDsKPiBAQCAtOTI3LDcgKzkzNCw3
IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfeGZlcihzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIg
Km1hc3RlciwKPiAgCSAgICAgICBTVkNfSTNDX01DVFJMX0lCSVJFU1BfTkFDSyB8Cj4gIAkgICAg
ICAgU1ZDX0kzQ19NQ1RSTF9ESVIocm53KSB8Cj4gIAkgICAgICAgU1ZDX0kzQ19NQ1RSTF9BRERS
KGFkZHIpIHwKPiAtCSAgICAgICBTVkNfSTNDX01DVFJMX1JEVEVSTShyZWFkX2xlbiksCj4gKwkg
ICAgICAgU1ZDX0kzQ19NQ1RSTF9SRFRFUk0oKnJlYWRfbGVuKSwKPiAgCSAgICAgICBtYXN0ZXIt
PnJlZ3MgKyBTVkNfSTNDX01DVFJMKTsKPiAgCj4gIAlyZXQgPSByZWFkbF9wb2xsX3RpbWVvdXQo
bWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NU1RBVFVTLCByZWcsCj4gQEAgLTkzOSw4ICs5NDYsMTAg
QEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl94ZmVyKHN0cnVjdCBzdmNfaTNjX21hc3RlciAq
bWFzdGVyLAo+ICAJCXJldCA9IHN2Y19pM2NfbWFzdGVyX3JlYWQobWFzdGVyLCBpbiwgeGZlcl9s
ZW4pOwo+ICAJZWxzZQo+ICAJCXJldCA9IHN2Y19pM2NfbWFzdGVyX3dyaXRlKG1hc3Rlciwgb3V0
LCB4ZmVyX2xlbik7Cj4gLQlpZiAocmV0KQo+ICsJaWYgKHJldCA8IDApCj4gIAkJZ290byBlbWl0
X3N0b3A7Cj4gKwlpZiAocm53KQo+ICsJCSpyZWFkX2xlbiA9IHJldDsKPiAgCj4gIAlyZXQgPSBy
ZWFkbF9wb2xsX3RpbWVvdXQobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NU1RBVFVTLCByZWcsCj4g
IAkJCQkgU1ZDX0kzQ19NU1RBVFVTX0NPTVBMRVRFKHJlZyksIDAsIDEwMDApOwo+IEBAIC0xMDEy
LDcgKzEwMjEsNyBAQCBzdGF0aWMgdm9pZCBzdmNfaTNjX21hc3Rlcl9zdGFydF94ZmVyX2xvY2tl
ZChzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlcikKPiAgCj4gIAkJcmV0ID0gc3ZjX2kzY19t
YXN0ZXJfeGZlcihtYXN0ZXIsIGNtZC0+cm53LCB4ZmVyLT50eXBlLAo+ICAJCQkJCSAgY21kLT5h
ZGRyLCBjbWQtPmluLCBjbWQtPm91dCwKPiAtCQkJCQkgIGNtZC0+bGVuLCBjbWQtPnJlYWRfbGVu
LAo+ICsJCQkJCSAgY21kLT5sZW4sICZjbWQtPnJlYWRfbGVuLAo+ICAJCQkJCSAgY21kLT5jb250
aW51ZWQpOwo+ICAJCWlmIChyZXQpCj4gIAkJCWJyZWFrOwo+IEBAIC0xMTQxLDYgKzExNTAsOSBA
QCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX3NlbmRfZGlyZWN0X2NjY19jbWQoc3RydWN0IHN2
Y19pM2NfbWFzdGVyICptYXN0ZXIsCj4gIAlpZiAoIXdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91
dCgmeGZlci0+Y29tcCwgbXNlY3NfdG9famlmZmllcygxMDAwKSkpCj4gIAkJc3ZjX2kzY19tYXN0
ZXJfZGVxdWV1ZV94ZmVyKG1hc3RlciwgeGZlcik7Cj4gIAo+ICsJaWYgKGNtZC0+cmVhZF9sZW4g
IT0geGZlcl9sZW4pCj4gKwkJY2NjLT5kZXN0c1swXS5wYXlsb2FkLmxlbiA9IGNtZC0+cmVhZF9s
ZW47Cj4gKwo+ICAJcmV0ID0geGZlci0+cmV0Owo+ICAJc3ZjX2kzY19tYXN0ZXJfZnJlZV94ZmVy
KHhmZXIpOwo+ICAKClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
