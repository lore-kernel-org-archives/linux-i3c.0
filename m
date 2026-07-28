Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E8DC54F54
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 17:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTl8r87fgQc45Y0G3bbYirXVFeKuGFf3tRakcEI/Tvw=; b=Q44ckLBxpLOjcL
	WGD61R1SPHv44kmZxCRTBq4c9Yap3V4oLvnd60AYd4Fnklubz3k8fpsEKAdjG+8c+y4qLnXlJ9SFp
	/iWUdaY4FkSWqcTtnWee57Ub/0nDr5rbj46oU54+uITtEoQbmo1isSZiuTMlFYGEVyXfZCHtj1a73
	hvmwmEosr5pjqHftGdkesD5s4vawjt0nHA6/8Kn5utBF9sOe5Dvk/DvBqzduA0uUwT9hjjZD3hwZF
	MkmavRXyO60TP8iTzw2+aYC0Hjb5Lu9ezLaPAmdaCbU8q8Ha8p9LGkL/dinavUUmSiPhuqhp168hY
	E4gd7yRGjpWV8EtzX9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolFp-00000005uFK-1D9G;
	Tue, 28 Jul 2026 17:06:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolFn-00000005uF8-3RWT
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 17:06:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D3F060A5E;
	Tue, 28 Jul 2026 17:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6361F000E9;
	Tue, 28 Jul 2026 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785258366;
	bh=SdsJEzWZmxkSCTar71zu4Z2o3Nn1lx2ko0LroJtCwLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YYpYh0xP0ijMcO15KVuSup/osEU2aXvPAk8nXkg+GSzCPa4D48d04ddqpfxgsKJZf
	 2yCUxStbUxsQ5vf8vpUNgZa3XleDIoDpu45mQLg7c7SvSyc6Wdt5LUtxF8+CZHv5Uy
	 DhuF3f0kClgrtRHG83BoOGyZOKvkxLlVS0VING1Le9SzJfPdQpuycrX8VrZveDyTmp
	 B4sakF3lCZFl9GapcnkQ9XNEQ5Cl62hPYeGnVW+AsKhRKK4FiElNl6N+qNutYwDWLY
	 oLoQvU+oAcksz5nEmubPiiMLSBOpcsM3ezaMALpMxGms8oU9KOlOlTJKyNET2E8aDI
	 rehCSscVGMsoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 5/8] i3c: master: Reject IBI requests from
 non-IBI-capable devices
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-pci@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260728155308.142713-6-adrian.hunter@intel.com>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
 <20260728155308.142713-6-adrian.hunter@intel.com>
Date: Tue, 28 Jul 2026 17:06:05 +0000
Message-Id: <20260728170605.CA6361F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBMZWFrZWQgd29ya3F1ZXVlIGluIGBpM2NfZGV2X3JlcXVlc3RfaWJpX2xvY2tlZCgp
YCB3aGVuIGBtYXN0ZXItPm9wcy0+cmVxdWVzdF9pYmkoKWAgZmFpbHMuCi0tCgotLS0gUGF0Y2gg
WzVdOiBbUEFUQ0ggVjIgNS84XSBpM2M6IG1hc3RlcjogUmVqZWN0IElCSSByZXF1ZXN0cyBmcm9t
IG5vbi1JQkktY2FwYWJsZSBkZXZpY2VzIC0tLQpjb21taXQgZDY5ZTU0MmI4N2MzM2UwNzg5ZTQx
MDc2N2IyZWUzNTRmZTAwMGMyOApBdXRob3I6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJA
aW50ZWwuY29tPgppM2M6IG1hc3RlcjogUmVqZWN0IElCSSByZXF1ZXN0cyBmcm9tIG5vbi1JQkkt
Y2FwYWJsZSBkZXZpY2VzCgpUaGlzIGNvbW1pdCBhZGRzIGEgY2hlY2sgaW4gaTNjX2RldmljZV9y
ZXF1ZXN0X2liaSgpIHRvIGVuc3VyZSBhIGRldmljZQpyZXBvcnRzIElCSSBzdXBwb3J0IGJlZm9y
ZSBhdHRlbXB0aW5nIHRvIHNldCB1cCBJQkkgaGFuZGxpbmcuIElmIHRoZSBkZXZpY2UKZG9lcyBu
b3QgYWR2ZXJ0aXNlIEkzQ19CQ1JfSUJJX1JFUV9DQVAsIGl0IG5vdyBmYWlscyB3aXRoIC1FT1BO
T1RTVVBQLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvZGV2aWNlLmMgYi9kcml2ZXJzL2kz
Yy9kZXZpY2UuYwo+IGluZGV4IDEwMWVhYTc3ZGU2ODYuLjMwN2NhNmRjMDRjYTAgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9pM2MvZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2kzYy9kZXZpY2UuYwo+
IEBAIC0yMDUsMTIgKzIwNSwxNCBAQCBpbnQgaTNjX2RldmljZV9yZXF1ZXN0X2liaShzdHJ1Y3Qg
aTNjX2RldmljZSAqZGV2LAo+ICAJCXJldHVybiByZXQ7Cj4gIAo+ICAJaTNjX2J1c19ub3JtYWx1
c2VfbG9jayhkZXYtPmJ1cyk7Cj4gLQlpZiAoZGV2LT5kZXNjKSB7Cj4gKwlpZiAoIWRldi0+ZGVz
Yykgewo+ICsJCXJldCA9IC1FTk9FTlQ7Cj4gKwl9IGVsc2UgaWYgKCEoZGV2LT5kZXNjLT5pbmZv
LmJjciAmIEkzQ19CQ1JfSUJJX1JFUV9DQVApKSB7Cj4gKwkJcmV0ID0gLUVPUE5PVFNVUFA7Cj4g
Kwl9IGVsc2Ugewo+ICAJCW11dGV4X2xvY2soJmRldi0+ZGVzYy0+aWJpX2xvY2spOwo+ICAJCXJl
dCA9IGkzY19kZXZfcmVxdWVzdF9pYmlfbG9ja2VkKGRldi0+ZGVzYywgcmVxKTsKCltTZXZlcml0
eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgaTNjX2Rldl9y
ZXF1ZXN0X2liaV9sb2NrZWQoKSBsZWFrIHRoZQphbGxvY2F0ZWQgd29ya3F1ZXVlIGlmIHRoZSBt
YXN0ZXIncyByZXF1ZXN0X2liaSBjYWxsYmFjayBmYWlscz8KCkxvb2tpbmcgYXQgaTNjX2Rldl9y
ZXF1ZXN0X2liaV9sb2NrZWQoKSBpbiBkcml2ZXJzL2kzYy9tYXN0ZXIuYzoKCglpYmktPndxID0g
YWxsb2Nfb3JkZXJlZF93b3JrcXVldWUoZGV2X25hbWUoaTNjZGV2X3RvX2RldihkZXYtPmRldikp
LAoJCQkJCSAgV1FfTUVNX1JFQ0xBSU0pOwoJaWYgKCFpYmktPndxKSB7CgkJa2ZyZWUoaWJpKTsK
CQlyZXR1cm4gLUVOT01FTTsKCX0KCS4uLgoJcmV0ID0gbWFzdGVyLT5vcHMtPnJlcXVlc3RfaWJp
KGRldiwgcmVxKTsKCWlmIChyZXQpIHsKCQlrZnJlZShpYmkpOwoJCWRldi0+aWJpID0gTlVMTDsK
CX0KCklmIG1hc3Rlci0+b3BzLT5yZXF1ZXN0X2liaSgpIHJldHVybnMgYW4gZXJyb3IsIHRoZSBl
cnJvciBwYXRoIGZyZWVzIGliaQpidXQgZG9lc24ndCBjYWxsIGRlc3Ryb3lfd29ya3F1ZXVlKGli
aS0+d3EpLgoKSWYgYSBkZXZpY2UgcHJvYmUgcmVwZWF0ZWRseSBmYWlscyBhdCB0aGlzIHN0ZXAs
IGNvdWxkIHRoaXMgcmVzdWx0IGluIGEKd29ya3F1ZXVlIGFuZCBtZW1vcnkgbGVhaz8KCj4gIAkJ
bXV0ZXhfdW5sb2NrKCZkZXYtPmRlc2MtPmliaV9sb2NrKTsKPiAtCX0gZWxzZSB7Cj4gLQkJcmV0
ID0gLUVOT0VOVDsKPiAgCX0KPiAgCWkzY19idXNfbm9ybWFsdXNlX3VubG9jayhkZXYtPmJ1cyk7
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwNzI4MTU1MzA4LjE0MjcxMy0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9NQoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
